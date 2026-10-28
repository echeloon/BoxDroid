#include <chrono>
#ifdef BOXDROID_RUNTIME
#include <pixman.h>
#endif
#define VK_USE_PLATFORM_ANDROID_KHR 1
#include <jni.h>
#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <sys/system_properties.h>
#include <pthread.h>
#include <vulkan/vulkan.h>
#include <vulkan/vulkan_android.h>

#include <algorithm>
#include <atomic>
#include <array>
#include <cstdint>
#include <cstring>
#include <dlfcn.h>
#include <mutex>
#include <sstream>
#include <string>
#include <vector>

#include "boxdroid-frame-queue.h"
#include "boxdroid-present-shaders.h"

// The presenter and Xemu own separate dispatch tables, backed by one selected loader.
extern "C" void *boxdroid_vk_proc();
extern "C" void boxdroid_vk_diagnostic(void *, void *, void *, const char *);
extern "C" JNIEXPORT jstring JNICALL Java_org_boxdroid_MainActivity_nativeConfigureGraphicsDriver(JNIEnv *, jobject, jstring, jstring, jstring, jstring);
static PFN_vkGetInstanceProcAddr customDriverProc = nullptr;
extern "C" void *boxdroid_vk_proc() { return reinterpret_cast<void *>(customDriverProc); }

extern "C" void boxdroid_vk_diagnostic(void *instanceHandle, void *gpuHandle, void *procHandle, const char *consumer) {
    auto instance = reinterpret_cast<VkInstance>(instanceHandle);
    auto gpu = reinterpret_cast<VkPhysicalDevice>(gpuHandle);
    auto getProc = reinterpret_cast<PFN_vkGetInstanceProcAddr>(procHandle);
    auto properties = reinterpret_cast<PFN_vkGetPhysicalDeviceProperties>(getProc(instance, "vkGetPhysicalDeviceProperties"));
    VkPhysicalDeviceProperties props{};
    properties(gpu, &props);
    VkPhysicalDeviceDriverProperties driver{VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES};
    auto props2 = reinterpret_cast<PFN_vkGetPhysicalDeviceProperties2>(getProc(instance, "vkGetPhysicalDeviceProperties2"));
    auto enumerate = reinterpret_cast<PFN_vkEnumerateDeviceExtensionProperties>(getProc(instance, "vkEnumerateDeviceExtensionProperties"));
    uint32_t count = 0;
    enumerate(gpu, nullptr, &count, nullptr);
    std::vector<VkExtensionProperties> extensions(count);
    enumerate(gpu, nullptr, &count, extensions.data());
    bool supported = props.apiVersion >= VK_API_VERSION_1_2;
    for (const auto &ext : extensions) if (std::strcmp(ext.extensionName, VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME) == 0) supported = true;
    if (props2 && supported) {
        VkPhysicalDeviceProperties2 p2{VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2};
        p2.pNext = &driver;
        props2(gpu, &p2);
    }
    __android_log_print(ANDROID_LOG_INFO, "BoxDroid-Driver",
        "VULKAN_DRIVER consumer=%s mode=%s device=%s vendor=0x%04x deviceID=0x%04x driverVersion=%u api=%u driverName=%s driverInfo=%s driverID=%u",
        consumer, customDriverProc ? "CUSTOM" : "SYSTEM", props.deviceName, props.vendorID, props.deviceID,
        props.driverVersion, props.apiVersion, driver.driverName, driver.driverInfo, driver.driverID);
}

extern "C" JNIEXPORT jstring JNICALL Java_org_boxdroid_MainActivity_nativeConfigureGraphicsDriver(JNIEnv *env, jobject, jstring hooks, jstring directory, jstring library, jstring temporary) {
    const char *h = env->GetStringUTFChars(hooks, nullptr), *d = env->GetStringUTFChars(directory, nullptr),
        *n = env->GetStringUTFChars(library, nullptr), *t = env->GetStringUTFChars(temporary, nullptr);
    void *support = dlopen("libboxdroid_driver.so", RTLD_NOW | RTLD_LOCAL);
    std::string error;
    if (!support) { const char *detail = dlerror(); error = detail ? detail : "Cannot load custom driver support"; }
    else {
        auto configure = reinterpret_cast<const char *(*)(const char *, const char *, const char *, const char *)>(dlsym(support, "boxdroid_driver_configure"));
        auto getProc = reinterpret_cast<void *(*)()>(dlsym(support, "boxdroid_driver_proc"));
        if (!configure || !getProc) error = "Custom driver support entry points missing";
        else {
            error = configure(h, d, n, t);
            if (error.empty()) customDriverProc = reinterpret_cast<PFN_vkGetInstanceProcAddr>(getProc());
        }
    }
    env->ReleaseStringUTFChars(hooks, h); env->ReleaseStringUTFChars(directory, d);
    env->ReleaseStringUTFChars(library, n); env->ReleaseStringUTFChars(temporary, t);
    return env->NewStringUTF(error.c_str());
}

namespace {
constexpr char kTag[] = "BoxDroid";

struct AspectFit {
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t x = 0;
    uint32_t y = 0;
    double scale = 0;
};

// Display aspect modes, matching the Java ASPECT_* constants. The Xbox drives
// a 4:3 or 16:9 TV whatever the framebuffer size, so the frame is fitted to the
// chosen display aspect rather than to its pixel dimensions (720x480 is 4:3).
constexpr int kAspect4x3 = 0;
constexpr int kAspect16x9 = 1;
constexpr int kAspectStretch = 2;
std::atomic<int> aspectMode{kAspect4x3};
// Scaling filters, matching the Java FILTER_* constants.
constexpr int kFilterNearest = 0;
constexpr int kFilterBilinear = 1;
// Snapdragon Game Super Resolution 1: a bilinear base sample plus edge-adaptive
// Lanczos-like sharpening, in its own pipeline (shaders/sgsr1.frag).
constexpr int kFilterSgsr = 2;
std::atomic<int> scalingFilter{kFilterNearest};

AspectFit aspectFit(uint32_t sourceWidth, uint32_t sourceHeight,
                    uint32_t surfaceWidth, uint32_t surfaceHeight, int mode) {
    AspectFit fit;
    if (!sourceWidth || !sourceHeight || !surfaceWidth || !surfaceHeight) return fit;
    fit.scale = std::min(static_cast<double>(surfaceWidth) / sourceWidth,
                         static_cast<double>(surfaceHeight) / sourceHeight);
    if (mode == kAspectStretch) {
        fit.width = surfaceWidth;
        fit.height = surfaceHeight;
        return fit;
    }
    const uint32_t aspectWidth = mode == kAspect16x9 ? 16 : 4;
    const uint32_t aspectHeight = mode == kAspect16x9 ? 9 : 3;
    if (static_cast<uint64_t>(surfaceWidth) * aspectHeight >
        static_cast<uint64_t>(surfaceHeight) * aspectWidth) {
        fit.height = surfaceHeight;
        fit.width = std::max(1u, static_cast<uint32_t>(
            (static_cast<uint64_t>(aspectWidth) * surfaceHeight) / aspectHeight));
    } else {
        fit.width = surfaceWidth;
        fit.height = std::max(1u, static_cast<uint32_t>(
            (static_cast<uint64_t>(aspectHeight) * surfaceWidth) / aspectWidth));
    }
    fit.x = (surfaceWidth - fit.width) / 2;
    fit.y = (surfaceHeight - fit.height) / 2;
    return fit;
}

// Surface callbacks and QEMU frame delivery run on different native threads.
// Serialize presenter resources so a resize cannot tear down an active upload.
std::mutex presenterLock;
// Serialize producer mode changes with Java surface lifecycle calls. The worker
// takes only presenterLock, so draining/joining never holds its resource lock.
std::mutex presentationLifecycleLock;
std::atomic<uint32_t> overlayPresentedFrames{0};
std::atomic<bool> surfaceRetiring{false};
std::atomic<bool> asyncPresentation{true};

bool propertyEnabled(const char *name, bool fallback) {
    char value[PROP_VALUE_MAX]{};
    if (!__system_property_get(name, value)) return fallback;
    return std::strcmp(value, "0") != 0 && std::strcmp(value, "false") != 0;
}

bool profilingEnabled() {
    static const bool enabled = propertyEnabled("debug.boxdroid.profile", false);
    return enabled;
}

bool asyncPresentationEnabled() {
    return asyncPresentation.load(std::memory_order_acquire);
}

bool consumeQueuedFrame(const boxdroid::FrameQueue::Frame &frame);

struct Presenter {
    void *loader = nullptr;
    PFN_vkGetInstanceProcAddr getInstanceProcAddr = nullptr;
    PFN_vkCreateInstance fn_CreateInstance = nullptr;
    PFN_vkDestroyInstance fn_DestroyInstance = nullptr;
    PFN_vkEnumeratePhysicalDevices fn_EnumeratePhysicalDevices = nullptr;
    PFN_vkGetPhysicalDeviceProperties fn_GetPhysicalDeviceProperties = nullptr;
    PFN_vkGetPhysicalDeviceQueueFamilyProperties fn_GetPhysicalDeviceQueueFamilyProperties = nullptr;
    PFN_vkGetPhysicalDeviceSurfaceSupportKHR fn_GetPhysicalDeviceSurfaceSupportKHR = nullptr;
    PFN_vkEnumerateDeviceExtensionProperties fn_EnumerateDeviceExtensionProperties = nullptr;
    PFN_vkCreateAndroidSurfaceKHR fn_CreateAndroidSurfaceKHR = nullptr;
    PFN_vkDestroySurfaceKHR fn_DestroySurfaceKHR = nullptr;
    PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR fn_GetPhysicalDeviceSurfaceCapabilitiesKHR = nullptr;
    PFN_vkGetPhysicalDeviceSurfaceFormatsKHR fn_GetPhysicalDeviceSurfaceFormatsKHR = nullptr;
    PFN_vkGetPhysicalDeviceSurfacePresentModesKHR fn_GetPhysicalDeviceSurfacePresentModesKHR = nullptr;
    PFN_vkCreateDevice fn_CreateDevice = nullptr;
    PFN_vkDestroyDevice fn_DestroyDevice = nullptr;
    PFN_vkGetDeviceProcAddr getDeviceProcAddr = nullptr;
    PFN_vkGetDeviceQueue fn_GetDeviceQueue = nullptr;
    PFN_vkCreateSwapchainKHR fn_CreateSwapchainKHR = nullptr;
    PFN_vkDestroySwapchainKHR fn_DestroySwapchainKHR = nullptr;
    PFN_vkGetSwapchainImagesKHR fn_GetSwapchainImagesKHR = nullptr;
    PFN_vkCreateSemaphore fn_CreateSemaphore = nullptr;
    PFN_vkDestroySemaphore fn_DestroySemaphore = nullptr;
    PFN_vkCreateCommandPool fn_CreateCommandPool = nullptr;
    PFN_vkDestroyCommandPool fn_DestroyCommandPool = nullptr;
    PFN_vkAllocateCommandBuffers fn_AllocateCommandBuffers = nullptr;
    PFN_vkResetCommandBuffer fn_ResetCommandBuffer = nullptr;
    PFN_vkBeginCommandBuffer fn_BeginCommandBuffer = nullptr;
    PFN_vkEndCommandBuffer fn_EndCommandBuffer = nullptr;
    PFN_vkCmdClearColorImage fn_CmdClearColorImage = nullptr;
    PFN_vkCmdPipelineBarrier fn_CmdPipelineBarrier = nullptr;
    PFN_vkCreateBuffer fn_CreateBuffer = nullptr;
    PFN_vkDestroyBuffer fn_DestroyBuffer = nullptr;
    PFN_vkGetBufferMemoryRequirements fn_GetBufferMemoryRequirements = nullptr;
    PFN_vkAllocateMemory fn_AllocateMemory = nullptr;
    PFN_vkFreeMemory fn_FreeMemory = nullptr;
    PFN_vkBindBufferMemory fn_BindBufferMemory = nullptr;
    PFN_vkMapMemory fn_MapMemory = nullptr;
    PFN_vkUnmapMemory fn_UnmapMemory = nullptr;
    PFN_vkGetPhysicalDeviceMemoryProperties fn_GetPhysicalDeviceMemoryProperties = nullptr;
    PFN_vkCmdCopyBufferToImage fn_CmdCopyBufferToImage = nullptr;
    PFN_vkAcquireNextImageKHR fn_AcquireNextImageKHR = nullptr;
    PFN_vkQueueSubmit fn_QueueSubmit = nullptr;
    PFN_vkQueuePresentKHR fn_QueuePresentKHR = nullptr;
    PFN_vkQueueWaitIdle fn_QueueWaitIdle = nullptr;
    PFN_vkDeviceWaitIdle fn_DeviceWaitIdle = nullptr;
    PFN_vkCreateImage fn_CreateImage = nullptr;
    PFN_vkDestroyImage fn_DestroyImage = nullptr;
    PFN_vkGetImageMemoryRequirements fn_GetImageMemoryRequirements = nullptr;
    PFN_vkBindImageMemory fn_BindImageMemory = nullptr;
    PFN_vkCreateImageView fn_CreateImageView = nullptr;
    PFN_vkDestroyImageView fn_DestroyImageView = nullptr;
    PFN_vkCreateSampler fn_CreateSampler = nullptr;
    PFN_vkDestroySampler fn_DestroySampler = nullptr;
    PFN_vkCreateRenderPass fn_CreateRenderPass = nullptr;
    PFN_vkDestroyRenderPass fn_DestroyRenderPass = nullptr;
    PFN_vkCreateFramebuffer fn_CreateFramebuffer = nullptr;
    PFN_vkDestroyFramebuffer fn_DestroyFramebuffer = nullptr;
    PFN_vkCreateShaderModule fn_CreateShaderModule = nullptr;
    PFN_vkDestroyShaderModule fn_DestroyShaderModule = nullptr;
    PFN_vkCreateDescriptorSetLayout fn_CreateDescriptorSetLayout = nullptr;
    PFN_vkDestroyDescriptorSetLayout fn_DestroyDescriptorSetLayout = nullptr;
    PFN_vkCreateDescriptorPool fn_CreateDescriptorPool = nullptr;
    PFN_vkDestroyDescriptorPool fn_DestroyDescriptorPool = nullptr;
    PFN_vkAllocateDescriptorSets fn_AllocateDescriptorSets = nullptr;
    PFN_vkUpdateDescriptorSets fn_UpdateDescriptorSets = nullptr;
    PFN_vkCreatePipelineLayout fn_CreatePipelineLayout = nullptr;
    PFN_vkDestroyPipelineLayout fn_DestroyPipelineLayout = nullptr;
    PFN_vkCreateGraphicsPipelines fn_CreateGraphicsPipelines = nullptr;
    PFN_vkDestroyPipeline fn_DestroyPipeline = nullptr;
    PFN_vkCmdBeginRenderPass fn_CmdBeginRenderPass = nullptr;
    PFN_vkCmdEndRenderPass fn_CmdEndRenderPass = nullptr;
    PFN_vkCmdBindPipeline fn_CmdBindPipeline = nullptr;
    PFN_vkCmdBindDescriptorSets fn_CmdBindDescriptorSets = nullptr;
    PFN_vkCmdSetViewport fn_CmdSetViewport = nullptr;
    PFN_vkCmdSetScissor fn_CmdSetScissor = nullptr;
    PFN_vkCmdDraw fn_CmdDraw = nullptr;
    PFN_vkCmdPushConstants fn_CmdPushConstants = nullptr;
    VkInstance instance = VK_NULL_HANDLE;
    VkPhysicalDevice gpu = VK_NULL_HANDLE;
    VkDevice device = VK_NULL_HANDLE;
    VkQueue queue = VK_NULL_HANDLE;
    uint32_t queueFamily = UINT32_MAX;
    VkSurfaceKHR surface = VK_NULL_HANDLE;
    VkSwapchainKHR swapchain = VK_NULL_HANDLE;
    VkCommandPool commandPool = VK_NULL_HANDLE;
    VkCommandBuffer commandBuffer = VK_NULL_HANDLE;
    VkSemaphore acquired = VK_NULL_HANDLE;
    VkSemaphore rendered = VK_NULL_HANDLE;
    VkBuffer stagingBuffer = VK_NULL_HANDLE;
    VkDeviceMemory stagingMemory = VK_NULL_HANDLE;
    void *stagingMapped = nullptr;
    VkDeviceSize stagingCapacity = 0;
    ANativeWindow *window = nullptr;
    std::vector<VkImage> images;
    // GPU presentation: the guest frame is uploaded at its own size into
    // sourceImage and scaled to the aspect-fit rectangle by a draw.
    bool gpuPresent = false;
    VkFormat pipelineFormat = VK_FORMAT_UNDEFINED;
    VkRenderPass renderPass = VK_NULL_HANDLE;
    VkPipelineLayout pipelineLayout = VK_NULL_HANDLE;
    VkPipeline pipeline = VK_NULL_HANDLE;
    VkPipeline sgsrPipeline = VK_NULL_HANDLE;  // null when it failed to build: SGSR draws bilinear
    VkDescriptorSetLayout setLayout = VK_NULL_HANDLE;
    VkDescriptorPool descriptorPool = VK_NULL_HANDLE;
    std::array<VkDescriptorSet, 2> descriptorSets{};  // one per scaling filter
    std::array<VkSampler, 2> samplers{};
    std::vector<VkImageView> imageViews;
    std::vector<VkFramebuffer> framebuffers;
    VkImage sourceImage = VK_NULL_HANDLE;
    VkDeviceMemory sourceMemory = VK_NULL_HANDLE;
    VkImageView sourceView = VK_NULL_HANDLE;
    uint32_t sourceImageWidth = 0;
    uint32_t sourceImageHeight = 0;
    bool sourceImageWritten = false;
    std::vector<VkSurfaceFormatKHR> supportedFormats;
    std::vector<VkPresentModeKHR> supportedPresentModes;
    VkFormat format = VK_FORMAT_UNDEFINED;
    VkColorSpaceKHR colorSpace = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
    VkPresentModeKHR presentMode = VK_PRESENT_MODE_FIFO_KHR;
    VkExtent2D extent{};
    uint32_t requestedWidth = 0;
    uint32_t requestedHeight = 0;
    uint32_t nativeWindowWidth = 0;
    uint32_t nativeWindowHeight = 0;
    uint32_t surfaceCurrentExtentWidth = 0;
    uint32_t surfaceCurrentExtentHeight = 0;
    uint32_t surfaceCurrentTransform = 0;
    uint32_t surfaceSupportedTransforms = 0;
    uint32_t swapchainPreTransform = 0;
    uint32_t surfaceCreates = 0;
    uint32_t surfaceDestroys = 0;
    uint32_t swapchainCreates = 0;
    uint32_t swapchainDestroys = 0;
    uint32_t acquires = 0;
    uint32_t submissions = 0;
    uint32_t presents = 0;
    uint32_t failedPresents = 0;
    uint32_t outOfDate = 0;
    uint32_t suboptimal = 0;
    bool suboptimalLogged = false;
    uint32_t surfaceLost = 0;
    uint32_t frameBeforeRecreate = 0;
    uint32_t frameAfterRecreate = 0;
    uint32_t requestedImageCount = 0;
    uint32_t actualImageCount = 0;
    uint32_t surfaceMinImageCount = 0;
    uint32_t surfaceMaxImageCount = 0;
    VkImageUsageFlags surfaceUsageFlags = 0;
    uint32_t generation = 0;
    bool frameGeometryValid = false;
    std::array<uint32_t, 10> frameGeometryKey{};
    AspectFit frameFit{};
    uint32_t geometryChanges = 0;
    std::vector<uint8_t> lastFrame;
    uint32_t lastSourceWidth = 0;
    uint32_t lastSourceHeight = 0;
    uint32_t lastSourceStride = 0;
    std::string gpuName;
    std::string lastError;
} p;

// Construct after presenter resources so destruction joins the worker before
// the presenter's owned vectors are freed. Retire first to cancel an acquire
// retry if the library is unloaded without the Java shutdown callback.
boxdroid::FrameQueue frameQueue(consumeQueuedFrame);
struct PresentationWorkerLifetime {
    ~PresentationWorkerLifetime() {
        surfaceRetiring.store(true, std::memory_order_release);
        frameQueue.stop();
    }
} presentationWorkerLifetime;

// The Xemu renderer uses Volk's process-wide Vulkan dispatch table. This
// diagnostic presenter owns a separate instance/device, so it must also own
// an independent dispatch table instead of resolving vk* symbols through the
// Volk globals in libboxdroid.so.
#define vkCreateInstance p.fn_CreateInstance
#define vkDestroyInstance p.fn_DestroyInstance
#define vkEnumeratePhysicalDevices p.fn_EnumeratePhysicalDevices
#define vkGetPhysicalDeviceProperties p.fn_GetPhysicalDeviceProperties
#define vkGetPhysicalDeviceQueueFamilyProperties p.fn_GetPhysicalDeviceQueueFamilyProperties
#define vkGetPhysicalDeviceSurfaceSupportKHR p.fn_GetPhysicalDeviceSurfaceSupportKHR
#define vkEnumerateDeviceExtensionProperties p.fn_EnumerateDeviceExtensionProperties
#define vkCreateAndroidSurfaceKHR p.fn_CreateAndroidSurfaceKHR
#define vkDestroySurfaceKHR p.fn_DestroySurfaceKHR
#define vkGetPhysicalDeviceSurfaceCapabilitiesKHR p.fn_GetPhysicalDeviceSurfaceCapabilitiesKHR
#define vkGetPhysicalDeviceSurfaceFormatsKHR p.fn_GetPhysicalDeviceSurfaceFormatsKHR
#define vkGetPhysicalDeviceSurfacePresentModesKHR p.fn_GetPhysicalDeviceSurfacePresentModesKHR
#define vkCreateDevice p.fn_CreateDevice
#define vkDestroyDevice p.fn_DestroyDevice
#define vkGetDeviceQueue p.fn_GetDeviceQueue
#define vkCreateSwapchainKHR p.fn_CreateSwapchainKHR
#define vkDestroySwapchainKHR p.fn_DestroySwapchainKHR
#define vkGetSwapchainImagesKHR p.fn_GetSwapchainImagesKHR
#define vkCreateSemaphore p.fn_CreateSemaphore
#define vkDestroySemaphore p.fn_DestroySemaphore
#define vkCreateCommandPool p.fn_CreateCommandPool
#define vkDestroyCommandPool p.fn_DestroyCommandPool
#define vkAllocateCommandBuffers p.fn_AllocateCommandBuffers
#define vkResetCommandBuffer p.fn_ResetCommandBuffer
#define vkBeginCommandBuffer p.fn_BeginCommandBuffer
#define vkEndCommandBuffer p.fn_EndCommandBuffer
#define vkCmdClearColorImage p.fn_CmdClearColorImage
#define vkCmdPipelineBarrier p.fn_CmdPipelineBarrier
#define vkCreateBuffer p.fn_CreateBuffer
#define vkDestroyBuffer p.fn_DestroyBuffer
#define vkGetBufferMemoryRequirements p.fn_GetBufferMemoryRequirements
#define vkAllocateMemory p.fn_AllocateMemory
#define vkFreeMemory p.fn_FreeMemory
#define vkBindBufferMemory p.fn_BindBufferMemory
#define vkMapMemory p.fn_MapMemory
#define vkUnmapMemory p.fn_UnmapMemory
#define vkGetPhysicalDeviceMemoryProperties p.fn_GetPhysicalDeviceMemoryProperties
#define vkCmdCopyBufferToImage p.fn_CmdCopyBufferToImage
#define vkAcquireNextImageKHR p.fn_AcquireNextImageKHR
#define vkQueueSubmit p.fn_QueueSubmit
#define vkQueuePresentKHR p.fn_QueuePresentKHR
#define vkQueueWaitIdle p.fn_QueueWaitIdle
#define vkDeviceWaitIdle p.fn_DeviceWaitIdle
#define vkCreateImage p.fn_CreateImage
#define vkDestroyImage p.fn_DestroyImage
#define vkGetImageMemoryRequirements p.fn_GetImageMemoryRequirements
#define vkBindImageMemory p.fn_BindImageMemory
#define vkCreateImageView p.fn_CreateImageView
#define vkDestroyImageView p.fn_DestroyImageView
#define vkCreateSampler p.fn_CreateSampler
#define vkDestroySampler p.fn_DestroySampler
#define vkCreateRenderPass p.fn_CreateRenderPass
#define vkDestroyRenderPass p.fn_DestroyRenderPass
#define vkCreateFramebuffer p.fn_CreateFramebuffer
#define vkDestroyFramebuffer p.fn_DestroyFramebuffer
#define vkCreateShaderModule p.fn_CreateShaderModule
#define vkDestroyShaderModule p.fn_DestroyShaderModule
#define vkCreateDescriptorSetLayout p.fn_CreateDescriptorSetLayout
#define vkDestroyDescriptorSetLayout p.fn_DestroyDescriptorSetLayout
#define vkCreateDescriptorPool p.fn_CreateDescriptorPool
#define vkDestroyDescriptorPool p.fn_DestroyDescriptorPool
#define vkAllocateDescriptorSets p.fn_AllocateDescriptorSets
#define vkUpdateDescriptorSets p.fn_UpdateDescriptorSets
#define vkCreatePipelineLayout p.fn_CreatePipelineLayout
#define vkDestroyPipelineLayout p.fn_DestroyPipelineLayout
#define vkCreateGraphicsPipelines p.fn_CreateGraphicsPipelines
#define vkDestroyPipeline p.fn_DestroyPipeline
#define vkCmdBeginRenderPass p.fn_CmdBeginRenderPass
#define vkCmdEndRenderPass p.fn_CmdEndRenderPass
#define vkCmdBindPipeline p.fn_CmdBindPipeline
#define vkCmdBindDescriptorSets p.fn_CmdBindDescriptorSets
#define vkCmdSetViewport p.fn_CmdSetViewport
#define vkCmdSetScissor p.fn_CmdSetScissor
#define vkCmdDraw p.fn_CmdDraw
#define vkCmdPushConstants p.fn_CmdPushConstants

void log(int priority, const std::string &message) {
    __android_log_write(priority, kTag, message.c_str());
}

void startPresentationWorker() {
    if (!frameQueue.start()) {
        asyncPresentation.store(false, std::memory_order_release);
        log(ANDROID_LOG_WARN, "PRESENT_WORKER_UNAVAILABLE using synchronous presentation");
    }
}

std::string hexValue(uint32_t value) {
    std::ostringstream stream;
    stream << "0x" << std::hex << value;
    return stream.str();
}

const char *resultName(VkResult r) {
    switch (r) {
    case VK_SUCCESS: return "VK_SUCCESS";
    case VK_SUBOPTIMAL_KHR: return "VK_SUBOPTIMAL_KHR";
    case VK_ERROR_OUT_OF_DATE_KHR: return "VK_ERROR_OUT_OF_DATE_KHR";
    case VK_ERROR_SURFACE_LOST_KHR: return "VK_ERROR_SURFACE_LOST_KHR";
    case VK_ERROR_DEVICE_LOST: return "VK_ERROR_DEVICE_LOST";
    case VK_ERROR_OUT_OF_HOST_MEMORY: return "VK_ERROR_OUT_OF_HOST_MEMORY";
    case VK_ERROR_OUT_OF_DEVICE_MEMORY: return "VK_ERROR_OUT_OF_DEVICE_MEMORY";
    case VK_ERROR_EXTENSION_NOT_PRESENT: return "VK_ERROR_EXTENSION_NOT_PRESENT";
    case VK_ERROR_FORMAT_NOT_SUPPORTED: return "VK_ERROR_FORMAT_NOT_SUPPORTED";
    default: return "VK_RESULT_OTHER";
    }
}

void noteSuboptimal(const char *operation) {
    ++p.suboptimal;
    if (!p.suboptimalLogged) {
        p.suboptimalLogged = true;
        log(ANDROID_LOG_WARN, std::string(operation) +
            "=VK_SUBOPTIMAL_KHR; retaining valid swapchain until resize/out-of-date");
    }
}

bool check(VkResult r, const char *operation) {
    if (r != VK_SUCCESS) {
        log(r == VK_SUBOPTIMAL_KHR ? ANDROID_LOG_WARN : ANDROID_LOG_ERROR,
            std::string(operation) + "=" + resultName(r) + " (" + std::to_string(r) + ")");
    }
    if (r == VK_ERROR_OUT_OF_DATE_KHR) ++p.outOfDate;
    if (r == VK_SUBOPTIMAL_KHR) noteSuboptimal(operation);
    if (r == VK_ERROR_SURFACE_LOST_KHR) ++p.surfaceLost;
    if (r != VK_SUCCESS) p.lastError = std::string(operation) + ":" + resultName(r);
    return r == VK_SUCCESS;
}

template <typename T>
bool loadInstanceFunction(T *target, const char *name) {
    *target = reinterpret_cast<T>(p.getInstanceProcAddr(p.instance, name));
    if (!*target) {
        p.lastError = std::string("missing Vulkan instance function: ") + name;
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    return true;
}

template <typename T>
bool loadDeviceFunction(T *target, const char *name) {
    *target = reinterpret_cast<T>(p.getDeviceProcAddr(p.device, name));
    if (!*target) {
        p.lastError = std::string("missing Vulkan device function: ") + name;
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    return true;
}

#define LOAD_INSTANCE(name) if (!loadInstanceFunction(&p.fn_##name, "vk" #name)) return false
#define LOAD_DEVICE(name) if (!loadDeviceFunction(&p.fn_##name, "vk" #name)) return false

bool loadInstanceFunctions() {
    LOAD_INSTANCE(DestroyInstance);
    LOAD_INSTANCE(EnumeratePhysicalDevices);
    LOAD_INSTANCE(GetPhysicalDeviceProperties);
    LOAD_INSTANCE(GetPhysicalDeviceQueueFamilyProperties);
    LOAD_INSTANCE(GetPhysicalDeviceSurfaceSupportKHR);
    LOAD_INSTANCE(EnumerateDeviceExtensionProperties);
    LOAD_INSTANCE(CreateAndroidSurfaceKHR);
    LOAD_INSTANCE(DestroySurfaceKHR);
    LOAD_INSTANCE(GetPhysicalDeviceSurfaceCapabilitiesKHR);
    LOAD_INSTANCE(GetPhysicalDeviceSurfaceFormatsKHR);
    LOAD_INSTANCE(GetPhysicalDeviceSurfacePresentModesKHR);
    LOAD_INSTANCE(CreateDevice);
    LOAD_INSTANCE(GetPhysicalDeviceMemoryProperties);
    p.getDeviceProcAddr = reinterpret_cast<PFN_vkGetDeviceProcAddr>(
        p.getInstanceProcAddr(p.instance, "vkGetDeviceProcAddr"));
    if (!p.getDeviceProcAddr) {
        p.lastError = "missing Vulkan instance function: vkGetDeviceProcAddr";
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    return true;
}

bool loadDeviceFunctions() {
    LOAD_DEVICE(DestroyDevice);
    LOAD_DEVICE(GetDeviceQueue);
    LOAD_DEVICE(CreateSwapchainKHR);
    LOAD_DEVICE(DestroySwapchainKHR);
    LOAD_DEVICE(GetSwapchainImagesKHR);
    LOAD_DEVICE(CreateSemaphore);
    LOAD_DEVICE(DestroySemaphore);
    LOAD_DEVICE(CreateCommandPool);
    LOAD_DEVICE(DestroyCommandPool);
    LOAD_DEVICE(AllocateCommandBuffers);
    LOAD_DEVICE(ResetCommandBuffer);
    LOAD_DEVICE(BeginCommandBuffer);
    LOAD_DEVICE(EndCommandBuffer);
    LOAD_DEVICE(CmdClearColorImage);
    LOAD_DEVICE(CmdPipelineBarrier);
    LOAD_DEVICE(CreateBuffer);
    LOAD_DEVICE(DestroyBuffer);
    LOAD_DEVICE(GetBufferMemoryRequirements);
    LOAD_DEVICE(AllocateMemory);
    LOAD_DEVICE(FreeMemory);
    LOAD_DEVICE(BindBufferMemory);
    LOAD_DEVICE(MapMemory);
    LOAD_DEVICE(UnmapMemory);
    LOAD_DEVICE(CmdCopyBufferToImage);
    LOAD_DEVICE(AcquireNextImageKHR);
    LOAD_DEVICE(QueueSubmit);
    LOAD_DEVICE(QueuePresentKHR);
    LOAD_DEVICE(QueueWaitIdle);
    LOAD_DEVICE(DeviceWaitIdle);
    LOAD_DEVICE(CreateImage);
    LOAD_DEVICE(DestroyImage);
    LOAD_DEVICE(GetImageMemoryRequirements);
    LOAD_DEVICE(BindImageMemory);
    LOAD_DEVICE(CreateImageView);
    LOAD_DEVICE(DestroyImageView);
    LOAD_DEVICE(CreateSampler);
    LOAD_DEVICE(DestroySampler);
    LOAD_DEVICE(CreateRenderPass);
    LOAD_DEVICE(DestroyRenderPass);
    LOAD_DEVICE(CreateFramebuffer);
    LOAD_DEVICE(DestroyFramebuffer);
    LOAD_DEVICE(CreateShaderModule);
    LOAD_DEVICE(DestroyShaderModule);
    LOAD_DEVICE(CreateDescriptorSetLayout);
    LOAD_DEVICE(DestroyDescriptorSetLayout);
    LOAD_DEVICE(CreateDescriptorPool);
    LOAD_DEVICE(DestroyDescriptorPool);
    LOAD_DEVICE(AllocateDescriptorSets);
    LOAD_DEVICE(UpdateDescriptorSets);
    LOAD_DEVICE(CreatePipelineLayout);
    LOAD_DEVICE(DestroyPipelineLayout);
    LOAD_DEVICE(CreateGraphicsPipelines);
    LOAD_DEVICE(DestroyPipeline);
    LOAD_DEVICE(CmdBeginRenderPass);
    LOAD_DEVICE(CmdEndRenderPass);
    LOAD_DEVICE(CmdBindPipeline);
    LOAD_DEVICE(CmdBindDescriptorSets);
    LOAD_DEVICE(CmdSetViewport);
    LOAD_DEVICE(CmdSetScissor);
    LOAD_DEVICE(CmdDraw);
    LOAD_DEVICE(CmdPushConstants);
    return true;
}

bool hasDeviceExtension(VkPhysicalDevice device, const char *name) {
    uint32_t count = 0;
    if (vkEnumerateDeviceExtensionProperties(device, nullptr, &count, nullptr) != VK_SUCCESS) return false;
    std::vector<VkExtensionProperties> extensions(count);
    if (vkEnumerateDeviceExtensionProperties(device, nullptr, &count, extensions.data()) != VK_SUCCESS) return false;
    return std::any_of(extensions.begin(), extensions.end(), [name](const auto &e) {
        return std::strcmp(e.extensionName, name) == 0;
    });
}

bool createSwapchain();
void destroySwapchain();
bool presentFrame(bool allowRetry, const uint8_t *pixels,
                  uint32_t sourceWidth, uint32_t sourceHeight, uint32_t sourceStride);

bool redrawLastFrame() {
    if (p.lastFrame.empty()) return true;
    // A static dashboard may not generate another QEMU dirty update after resize.
    // Repaint the owned copy of the last guest frame through the same presenter.
    const bool ok = presentFrame(true, p.lastFrame.data(), p.lastSourceWidth,
                                 p.lastSourceHeight, p.lastSourceStride);
    log(ok ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR,
        std::string("FRAME_REFIT_REDRAW result=") + (ok ? "PASS" : "FAIL"));
    return ok;
}

bool resizeSurface(uint32_t width, uint32_t height, bool redraw = true) {
    if (!p.surface || !p.device) return false;
    width = std::max(width, 1u);
    height = std::max(height, 1u);
    const uint32_t nativeWidth = static_cast<uint32_t>(std::max(ANativeWindow_getWidth(p.window), 0));
    const uint32_t nativeHeight = static_cast<uint32_t>(std::max(ANativeWindow_getHeight(p.window), 0));
    if (width == p.requestedWidth && height == p.requestedHeight &&
        nativeWidth == p.nativeWindowWidth && nativeHeight == p.nativeWindowHeight) return true;
    destroySwapchain();
    p.requestedWidth = width;
    p.requestedHeight = height;
    p.nativeWindowWidth = static_cast<uint32_t>(std::max(ANativeWindow_getWidth(p.window), 0));
    p.nativeWindowHeight = static_cast<uint32_t>(std::max(ANativeWindow_getHeight(p.window), 0));
    log(ANDROID_LOG_INFO, "SURFACE_RESIZE requested=" + std::to_string(width) + "x" + std::to_string(height) +
        " native_window=" + std::to_string(p.nativeWindowWidth) + "x" + std::to_string(p.nativeWindowHeight));
    return createSwapchain() && (!redraw || redrawLastFrame());
}

bool createInstance() {
    if (customDriverProc) {
        p.getInstanceProcAddr = customDriverProc;
    } else {
    p.loader = dlopen("libvulkan.so", RTLD_NOW | RTLD_LOCAL);
    if (!p.loader) {
        p.lastError = std::string("dlopen(libvulkan.so) failed: ") + dlerror();
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    p.getInstanceProcAddr = reinterpret_cast<PFN_vkGetInstanceProcAddr>(
        dlsym(p.loader, "vkGetInstanceProcAddr"));
    }
    if (!p.getInstanceProcAddr) {
        p.lastError = "libvulkan.so is missing vkGetInstanceProcAddr";
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    p.fn_CreateInstance = reinterpret_cast<PFN_vkCreateInstance>(
        p.getInstanceProcAddr(VK_NULL_HANDLE, "vkCreateInstance"));
    if (!p.fn_CreateInstance) {
        p.lastError = "Vulkan loader returned no vkCreateInstance";
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    const char *extensions[] = {VK_KHR_SURFACE_EXTENSION_NAME, VK_KHR_ANDROID_SURFACE_EXTENSION_NAME};
    VkApplicationInfo app{VK_STRUCTURE_TYPE_APPLICATION_INFO};
    app.pApplicationName = "BoxDroid Presenter";
    app.applicationVersion = VK_MAKE_VERSION(0, 4, 0);
    app.pEngineName = "BoxDroid";
    app.engineVersion = VK_MAKE_VERSION(0, 4, 0);
    app.apiVersion = VK_API_VERSION_1_1;
    VkInstanceCreateInfo ci{VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO};
    ci.pApplicationInfo = &app;
    ci.enabledExtensionCount = 2;
    ci.ppEnabledExtensionNames = extensions;
    log(ANDROID_LOG_INFO, "INSTANCE_EXTENSIONS=VK_KHR_surface,VK_KHR_android_surface");
    if (!check(vkCreateInstance(&ci, nullptr, &p.instance), "vkCreateInstance")) return false;
    return loadInstanceFunctions();
}

bool createSurface(JNIEnv *env, jobject javaSurface, uint32_t width, uint32_t height, uint32_t generation) {
    if (!p.instance && !createInstance()) return false;
    p.window = ANativeWindow_fromSurface(env, javaSurface);
    if (!p.window) {
        p.lastError = "ANativeWindow_fromSurface failed";
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    p.requestedWidth = std::max(width, 1u);
    p.requestedHeight = std::max(height, 1u);
    p.nativeWindowWidth = static_cast<uint32_t>(std::max(ANativeWindow_getWidth(p.window), 0));
    p.nativeWindowHeight = static_cast<uint32_t>(std::max(ANativeWindow_getHeight(p.window), 0));
    p.generation = generation;
    log(ANDROID_LOG_INFO, "ANDROID_NATIVE_WINDOW requested=" + std::to_string(width) + "x" + std::to_string(height) +
        " native=" + std::to_string(p.nativeWindowWidth) + "x" + std::to_string(p.nativeWindowHeight) +
        " format=" + std::to_string(ANativeWindow_getFormat(p.window)));
    VkAndroidSurfaceCreateInfoKHR sci{VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR};
    sci.window = p.window;
    if (!check(vkCreateAndroidSurfaceKHR(p.instance, &sci, nullptr, &p.surface), "vkCreateAndroidSurfaceKHR")) return false;
    ++p.surfaceCreates;

    if (!p.gpu) {
        uint32_t count = 0;
        if (!check(vkEnumeratePhysicalDevices(p.instance, &count, nullptr), "vkEnumeratePhysicalDevices(count)") || !count) return false;
        std::vector<VkPhysicalDevice> devices(count);
        if (!check(vkEnumeratePhysicalDevices(p.instance, &count, devices.data()), "vkEnumeratePhysicalDevices")) return false;
        for (VkPhysicalDevice device : devices) {
            VkPhysicalDeviceProperties properties{};
            vkGetPhysicalDeviceProperties(device, &properties);
            uint32_t familyCount = 0;
            vkGetPhysicalDeviceQueueFamilyProperties(device, &familyCount, nullptr);
            std::vector<VkQueueFamilyProperties> families(familyCount);
            vkGetPhysicalDeviceQueueFamilyProperties(device, &familyCount, families.data());
            for (uint32_t i = 0; i < familyCount; ++i) {
                VkBool32 canPresent = VK_FALSE;
                VkResult r = vkGetPhysicalDeviceSurfaceSupportKHR(device, i, p.surface, &canPresent);
                if (r == VK_SUCCESS && families[i].queueCount &&
                    (families[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) && canPresent &&
                    hasDeviceExtension(device, VK_KHR_SWAPCHAIN_EXTENSION_NAME)) {
                    p.gpu = device;
                    p.queueFamily = i;
                    p.gpuName = properties.deviceName;
                    break;
                }
            }
            if (p.gpu) break;
        }
        if (!p.gpu) {
            p.lastError = "no Vulkan graphics/present queue with VK_KHR_swapchain";
            log(ANDROID_LOG_ERROR, p.lastError);
            return false;
        }
        boxdroid_vk_diagnostic(p.instance, p.gpu, reinterpret_cast<void *>(p.getInstanceProcAddr), "presenter");
        log(ANDROID_LOG_INFO, "GPU=" + p.gpuName + " queue_family=" + std::to_string(p.queueFamily) + " graphics=1 present=1");
        float priority = 1.0f;
        VkDeviceQueueCreateInfo qi{VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO};
        qi.queueFamilyIndex = p.queueFamily;
        qi.queueCount = 1;
        qi.pQueuePriorities = &priority;
        const char *deviceExtensions[] = {VK_KHR_SWAPCHAIN_EXTENSION_NAME};
        VkDeviceCreateInfo di{VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO};
        di.queueCreateInfoCount = 1;
        di.pQueueCreateInfos = &qi;
        di.enabledExtensionCount = 1;
        di.ppEnabledExtensionNames = deviceExtensions;
        log(ANDROID_LOG_INFO, "DEVICE_EXTENSIONS=VK_KHR_swapchain");
        if (!check(vkCreateDevice(p.gpu, &di, nullptr, &p.device), "vkCreateDevice")) return false;
        if (!loadDeviceFunctions()) return false;
        vkGetDeviceQueue(p.device, p.queueFamily, 0, &p.queue);
        p.gpuPresent = propertyEnabled("debug.boxdroid.gpu_present", true);
        log(ANDROID_LOG_INFO, std::string("GPU_PRESENT requested=") + (p.gpuPresent ? "1" : "0"));
    }
    return createSwapchain() && redrawLastFrame();
}

void destroyStaging() {
    p.frameGeometryValid = false;
    if (p.stagingMapped) vkUnmapMemory(p.device, p.stagingMemory);
    if (p.stagingBuffer) vkDestroyBuffer(p.device, p.stagingBuffer, nullptr);
    if (p.stagingMemory) vkFreeMemory(p.device, p.stagingMemory, nullptr);
    p.stagingBuffer = VK_NULL_HANDLE;
    p.stagingMemory = VK_NULL_HANDLE;
    p.stagingMapped = nullptr;
    p.stagingCapacity = 0;
}

bool ensureStaging(VkDeviceSize bytes) {
    if (p.stagingCapacity >= bytes) return true;
    // Called under presenterLock after the previous upload's queue completion.
    // The mapped coherent buffer is reused only after vkQueueWaitIdle below.
    destroyStaging();
    VkBufferCreateInfo info{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};
    info.size = bytes;
    info.usage = VK_BUFFER_USAGE_TRANSFER_SRC_BIT;
    info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    if (!check(vkCreateBuffer(p.device, &info, nullptr, &p.stagingBuffer), "vkCreateBuffer(frame)")) return false;
    VkMemoryRequirements requirements{};
    vkGetBufferMemoryRequirements(p.device, p.stagingBuffer, &requirements);
    VkPhysicalDeviceMemoryProperties properties{};
    vkGetPhysicalDeviceMemoryProperties(p.gpu, &properties);
    uint32_t memoryType = UINT32_MAX;
    for (uint32_t i = 0; i < properties.memoryTypeCount; ++i) {
        const auto flags = properties.memoryTypes[i].propertyFlags;
        if ((requirements.memoryTypeBits & (1u << i)) &&
            (flags & VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT) &&
            (flags & VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)) {
            memoryType = i;
            break;
        }
    }
    if (memoryType == UINT32_MAX) {
        p.lastError = "no host-visible coherent Vulkan memory for NV2A frame upload";
        log(ANDROID_LOG_ERROR, p.lastError);
        destroyStaging();
        return false;
    }
    VkMemoryAllocateInfo allocation{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
    allocation.allocationSize = requirements.size;
    allocation.memoryTypeIndex = memoryType;
    if (!check(vkAllocateMemory(p.device, &allocation, nullptr, &p.stagingMemory), "vkAllocateMemory(frame)") ||
        !check(vkBindBufferMemory(p.device, p.stagingBuffer, p.stagingMemory, 0), "vkBindBufferMemory(frame)") ||
        !check(vkMapMemory(p.device, p.stagingMemory, 0, allocation.allocationSize, 0, &p.stagingMapped), "vkMapMemory(frame)")) {
        destroyStaging();
        return false;
    }
    p.stagingCapacity = bytes;
    return true;
}

uint32_t findMemoryType(uint32_t typeBits, VkMemoryPropertyFlags preferred) {
    VkPhysicalDeviceMemoryProperties properties{};
    vkGetPhysicalDeviceMemoryProperties(p.gpu, &properties);
    for (uint32_t i = 0; i < properties.memoryTypeCount; ++i) {
        if ((typeBits & (1u << i)) &&
            (properties.memoryTypes[i].propertyFlags & preferred) == preferred) return i;
    }
    for (uint32_t i = 0; i < properties.memoryTypeCount; ++i) {
        if (typeBits & (1u << i)) return i;
    }
    return UINT32_MAX;
}

void destroySourceImage() {
    if (p.sourceView) { vkDestroyImageView(p.device, p.sourceView, nullptr); p.sourceView = VK_NULL_HANDLE; }
    if (p.sourceImage) { vkDestroyImage(p.device, p.sourceImage, nullptr); p.sourceImage = VK_NULL_HANDLE; }
    if (p.sourceMemory) { vkFreeMemory(p.device, p.sourceMemory, nullptr); p.sourceMemory = VK_NULL_HANDLE; }
    p.sourceImageWidth = 0;
    p.sourceImageHeight = 0;
    p.sourceImageWritten = false;
}

// Called under presenterLock with the queue idle (every present waits for it),
// so the descriptor sets can be rewritten in place.
bool ensureSourceImage(uint32_t width, uint32_t height) {
    if (p.sourceImage && p.sourceImageWidth == width && p.sourceImageHeight == height) return true;
    destroySourceImage();
    VkImageCreateInfo info{VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO};
    info.imageType = VK_IMAGE_TYPE_2D;
    info.format = VK_FORMAT_R8G8B8A8_UNORM;
    info.extent = {width, height, 1};
    info.mipLevels = 1;
    info.arrayLayers = 1;
    info.samples = VK_SAMPLE_COUNT_1_BIT;
    info.tiling = VK_IMAGE_TILING_OPTIMAL;
    info.usage = VK_IMAGE_USAGE_TRANSFER_DST_BIT | VK_IMAGE_USAGE_SAMPLED_BIT;
    info.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    info.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    if (!check(vkCreateImage(p.device, &info, nullptr, &p.sourceImage), "vkCreateImage(source)")) return false;
    VkMemoryRequirements requirements{};
    vkGetImageMemoryRequirements(p.device, p.sourceImage, &requirements);
    VkMemoryAllocateInfo allocation{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
    allocation.allocationSize = requirements.size;
    allocation.memoryTypeIndex = findMemoryType(requirements.memoryTypeBits, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};
    view.image = p.sourceImage;
    view.viewType = VK_IMAGE_VIEW_TYPE_2D;
    view.format = info.format;
    view.subresourceRange = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1};
    if (allocation.memoryTypeIndex == UINT32_MAX ||
        !check(vkAllocateMemory(p.device, &allocation, nullptr, &p.sourceMemory), "vkAllocateMemory(source)") ||
        !check(vkBindImageMemory(p.device, p.sourceImage, p.sourceMemory, 0), "vkBindImageMemory(source)") ||
        !check(vkCreateImageView(p.device, &view, nullptr, &p.sourceView), "vkCreateImageView(source)")) {
        destroySourceImage();
        return false;
    }
    p.sourceImageWidth = width;
    p.sourceImageHeight = height;
    std::array<VkDescriptorImageInfo, 2> images{};
    std::array<VkWriteDescriptorSet, 2> writes{};
    for (size_t i = 0; i < writes.size(); ++i) {
        images[i] = {p.samplers[i], p.sourceView, VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL};
        writes[i] = {VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET};
        writes[i].dstSet = p.descriptorSets[i];
        writes[i].descriptorCount = 1;
        writes[i].descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
        writes[i].pImageInfo = &images[i];
    }
    vkUpdateDescriptorSets(p.device, static_cast<uint32_t>(writes.size()), writes.data(), 0, nullptr);
    log(ANDROID_LOG_INFO, "GPU_PRESENT_SOURCE extent=" + std::to_string(width) + "x" + std::to_string(height));
    return true;
}

void destroySwapchainTargets() {
    for (VkFramebuffer framebuffer : p.framebuffers) vkDestroyFramebuffer(p.device, framebuffer, nullptr);
    for (VkImageView view : p.imageViews) vkDestroyImageView(p.device, view, nullptr);
    p.framebuffers.clear();
    p.imageViews.clear();
}

void destroyPipelineObjects() {
    if (!p.device) return;
    destroySwapchainTargets();
    destroySourceImage();
    if (p.pipeline) { vkDestroyPipeline(p.device, p.pipeline, nullptr); p.pipeline = VK_NULL_HANDLE; }
    if (p.sgsrPipeline) { vkDestroyPipeline(p.device, p.sgsrPipeline, nullptr); p.sgsrPipeline = VK_NULL_HANDLE; }
    if (p.pipelineLayout) { vkDestroyPipelineLayout(p.device, p.pipelineLayout, nullptr); p.pipelineLayout = VK_NULL_HANDLE; }
    if (p.renderPass) { vkDestroyRenderPass(p.device, p.renderPass, nullptr); p.renderPass = VK_NULL_HANDLE; }
    if (p.descriptorPool) { vkDestroyDescriptorPool(p.device, p.descriptorPool, nullptr); p.descriptorPool = VK_NULL_HANDLE; }
    if (p.setLayout) { vkDestroyDescriptorSetLayout(p.device, p.setLayout, nullptr); p.setLayout = VK_NULL_HANDLE; }
    for (VkSampler &sampler : p.samplers) {
        if (sampler) vkDestroySampler(p.device, sampler, nullptr);
        sampler = VK_NULL_HANDLE;
    }
    p.descriptorSets = {};
    p.pipelineFormat = VK_FORMAT_UNDEFINED;
}

VkShaderModule createShaderModule(const uint32_t *code, size_t bytes, const char *name) {
    VkShaderModuleCreateInfo info{VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO};
    info.codeSize = bytes;
    info.pCode = code;
    VkShaderModule module = VK_NULL_HANDLE;
    check(vkCreateShaderModule(p.device, &info, nullptr, &module), name);
    return module;
}

// The fullscreen-triangle pipeline with one fragment shader; null on failure.
// Needs p.renderPass and p.pipelineLayout.
VkPipeline createGraphicsPipeline(const uint32_t *fragmentCode, size_t fragmentBytes, const char *name) {
    VkShaderModule vertex = createShaderModule(kPresentVertexShader, sizeof(kPresentVertexShader), "vkCreateShaderModule(vertex)");
    VkShaderModule fragment = createShaderModule(fragmentCode, fragmentBytes, "vkCreateShaderModule(fragment)");
    VkPipeline pipeline = VK_NULL_HANDLE;
    if (vertex && fragment) {
        std::array<VkPipelineShaderStageCreateInfo, 2> stages{};
        stages[0] = {VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO};
        stages[0].stage = VK_SHADER_STAGE_VERTEX_BIT;
        stages[0].module = vertex;
        stages[0].pName = "main";
        stages[1] = {VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO};
        stages[1].stage = VK_SHADER_STAGE_FRAGMENT_BIT;
        stages[1].module = fragment;
        stages[1].pName = "main";
        VkPipelineVertexInputStateCreateInfo vertexInput{VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO};
        VkPipelineInputAssemblyStateCreateInfo assembly{VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO};
        assembly.topology = VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST;
        VkPipelineViewportStateCreateInfo viewport{VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO};
        viewport.viewportCount = 1;
        viewport.scissorCount = 1;
        VkPipelineRasterizationStateCreateInfo raster{VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO};
        raster.polygonMode = VK_POLYGON_MODE_FILL;
        raster.cullMode = VK_CULL_MODE_NONE;
        raster.frontFace = VK_FRONT_FACE_COUNTER_CLOCKWISE;
        raster.lineWidth = 1.0f;
        VkPipelineMultisampleStateCreateInfo multisample{VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO};
        multisample.rasterizationSamples = VK_SAMPLE_COUNT_1_BIT;
        VkPipelineColorBlendAttachmentState blendAttachment{};
        blendAttachment.colorWriteMask = VK_COLOR_COMPONENT_R_BIT | VK_COLOR_COMPONENT_G_BIT |
                                         VK_COLOR_COMPONENT_B_BIT | VK_COLOR_COMPONENT_A_BIT;
        VkPipelineColorBlendStateCreateInfo blend{VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO};
        blend.attachmentCount = 1;
        blend.pAttachments = &blendAttachment;
        std::array<VkDynamicState, 2> dynamicStates{VK_DYNAMIC_STATE_VIEWPORT, VK_DYNAMIC_STATE_SCISSOR};
        VkPipelineDynamicStateCreateInfo dynamic{VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO};
        dynamic.dynamicStateCount = static_cast<uint32_t>(dynamicStates.size());
        dynamic.pDynamicStates = dynamicStates.data();
        VkGraphicsPipelineCreateInfo pipelineInfo{VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO};
        pipelineInfo.stageCount = static_cast<uint32_t>(stages.size());
        pipelineInfo.pStages = stages.data();
        pipelineInfo.pVertexInputState = &vertexInput;
        pipelineInfo.pInputAssemblyState = &assembly;
        pipelineInfo.pViewportState = &viewport;
        pipelineInfo.pRasterizationState = &raster;
        pipelineInfo.pMultisampleState = &multisample;
        pipelineInfo.pColorBlendState = &blend;
        pipelineInfo.pDynamicState = &dynamic;
        pipelineInfo.layout = p.pipelineLayout;
        pipelineInfo.renderPass = p.renderPass;
        check(vkCreateGraphicsPipelines(p.device, VK_NULL_HANDLE, 1, &pipelineInfo, nullptr, &pipeline),
              (std::string("vkCreateGraphicsPipelines(") + name + ")").c_str());
    }
    if (vertex) vkDestroyShaderModule(p.device, vertex, nullptr);
    if (fragment) vkDestroyShaderModule(p.device, fragment, nullptr);
    return pipeline;
}

// Render pass, pipeline, samplers and descriptor sets for one swapchain format.
bool createPipelineObjects(VkFormat format) {
    if (p.pipeline && p.pipelineFormat == format) return true;
    destroyPipelineObjects();
    for (int filter = kFilterNearest; filter <= kFilterBilinear; ++filter) {
        VkSamplerCreateInfo sampler{VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO};
        sampler.magFilter = sampler.minFilter = filter == kFilterBilinear ? VK_FILTER_LINEAR : VK_FILTER_NEAREST;
        sampler.mipmapMode = VK_SAMPLER_MIPMAP_MODE_NEAREST;
        sampler.addressModeU = sampler.addressModeV = sampler.addressModeW = VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
        sampler.maxLod = 0.0f;
        if (!check(vkCreateSampler(p.device, &sampler, nullptr, &p.samplers[filter]), "vkCreateSampler")) return false;
    }
    VkDescriptorSetLayoutBinding binding{};
    binding.binding = 0;
    binding.descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
    binding.descriptorCount = 1;
    binding.stageFlags = VK_SHADER_STAGE_FRAGMENT_BIT;
    VkDescriptorSetLayoutCreateInfo layoutInfo{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO};
    layoutInfo.bindingCount = 1;
    layoutInfo.pBindings = &binding;
    if (!check(vkCreateDescriptorSetLayout(p.device, &layoutInfo, nullptr, &p.setLayout), "vkCreateDescriptorSetLayout")) return false;
    VkDescriptorPoolSize poolSize{VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, static_cast<uint32_t>(p.descriptorSets.size())};
    VkDescriptorPoolCreateInfo poolInfo{VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO};
    poolInfo.maxSets = static_cast<uint32_t>(p.descriptorSets.size());
    poolInfo.poolSizeCount = 1;
    poolInfo.pPoolSizes = &poolSize;
    if (!check(vkCreateDescriptorPool(p.device, &poolInfo, nullptr, &p.descriptorPool), "vkCreateDescriptorPool")) return false;
    std::array<VkDescriptorSetLayout, 2> setLayouts{p.setLayout, p.setLayout};
    VkDescriptorSetAllocateInfo setInfo{VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO};
    setInfo.descriptorPool = p.descriptorPool;
    setInfo.descriptorSetCount = static_cast<uint32_t>(setLayouts.size());
    setInfo.pSetLayouts = setLayouts.data();
    if (!check(vkAllocateDescriptorSets(p.device, &setInfo, p.descriptorSets.data()), "vkAllocateDescriptorSets")) return false;
    // SGSR's ViewportInfo; the plain present shader declares no push constants.
    VkPushConstantRange pushRange{VK_SHADER_STAGE_FRAGMENT_BIT, 0, 4 * sizeof(float)};
    VkPipelineLayoutCreateInfo pipelineLayoutInfo{VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO};
    pipelineLayoutInfo.setLayoutCount = 1;
    pipelineLayoutInfo.pSetLayouts = &p.setLayout;
    pipelineLayoutInfo.pushConstantRangeCount = 1;
    pipelineLayoutInfo.pPushConstantRanges = &pushRange;
    if (!check(vkCreatePipelineLayout(p.device, &pipelineLayoutInfo, nullptr, &p.pipelineLayout), "vkCreatePipelineLayout")) return false;

    // The clear paints the letterbox; the swapchain image goes straight to present.
    VkAttachmentDescription attachment{};
    attachment.format = format;
    attachment.samples = VK_SAMPLE_COUNT_1_BIT;
    attachment.loadOp = VK_ATTACHMENT_LOAD_OP_CLEAR;
    attachment.storeOp = VK_ATTACHMENT_STORE_OP_STORE;
    attachment.stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
    attachment.stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
    attachment.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    attachment.finalLayout = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;
    VkAttachmentReference colorReference{0, VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL};
    VkSubpassDescription subpass{};
    subpass.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS;
    subpass.colorAttachmentCount = 1;
    subpass.pColorAttachments = &colorReference;
    // Order the attachment write after the acquire semaphore's wait stage.
    VkSubpassDependency dependency{};
    dependency.srcSubpass = VK_SUBPASS_EXTERNAL;
    dependency.dstSubpass = 0;
    dependency.srcStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    dependency.dstStageMask = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    dependency.dstAccessMask = VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT;
    VkRenderPassCreateInfo renderPassInfo{VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO};
    renderPassInfo.attachmentCount = 1;
    renderPassInfo.pAttachments = &attachment;
    renderPassInfo.subpassCount = 1;
    renderPassInfo.pSubpasses = &subpass;
    renderPassInfo.dependencyCount = 1;
    renderPassInfo.pDependencies = &dependency;
    if (!check(vkCreateRenderPass(p.device, &renderPassInfo, nullptr, &p.renderPass), "vkCreateRenderPass")) return false;

    p.pipeline = createGraphicsPipeline(kPresentFragmentShader, sizeof(kPresentFragmentShader), "present");
    if (!p.pipeline) return false;
    p.sgsrPipeline = createGraphicsPipeline(kSgsrFragmentShader, sizeof(kSgsrFragmentShader), "sgsr");
    if (!p.sgsrPipeline) {
        p.lastError.clear();
        log(ANDROID_LOG_WARN, "GPU_PRESENT_SGSR_UNAVAILABLE fallback=bilinear");
    }
    p.pipelineFormat = format;
    log(ANDROID_LOG_INFO, "GPU_PRESENT_PIPELINE format=" + std::to_string(format));
    return true;
}

// Image views and framebuffers for the current swapchain. On failure the
// presenter falls back to CPU scaling for the rest of the process.
bool createSwapchainTargets() {
    if (!p.gpuPresent) return true;
    bool ok = createPipelineObjects(p.format);
    for (size_t i = 0; ok && i < p.images.size(); ++i) {
        VkImageViewCreateInfo view{VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO};
        view.image = p.images[i];
        view.viewType = VK_IMAGE_VIEW_TYPE_2D;
        view.format = p.format;
        view.subresourceRange = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1};
        VkImageView imageView = VK_NULL_HANDLE;
        ok = check(vkCreateImageView(p.device, &view, nullptr, &imageView), "vkCreateImageView(swapchain)");
        if (!ok) break;
        p.imageViews.push_back(imageView);
        VkFramebufferCreateInfo framebuffer{VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO};
        framebuffer.renderPass = p.renderPass;
        framebuffer.attachmentCount = 1;
        framebuffer.pAttachments = &imageView;
        framebuffer.width = p.extent.width;
        framebuffer.height = p.extent.height;
        framebuffer.layers = 1;
        VkFramebuffer created = VK_NULL_HANDLE;
        ok = check(vkCreateFramebuffer(p.device, &framebuffer, nullptr, &created), "vkCreateFramebuffer");
        if (ok) p.framebuffers.push_back(created);
    }
    if (!ok) {
        destroyPipelineObjects();
        p.gpuPresent = false;
        p.lastError.clear();
        log(ANDROID_LOG_WARN, "GPU_PRESENT_FALLBACK reason=pipeline scaling=cpu");
    }
    return true;
}

void destroySwapchain() {
    p.frameGeometryValid = false;
    if (p.device) vkDeviceWaitIdle(p.device);
    destroyStaging();
    if (p.device) {
        destroySwapchainTargets();
        destroySourceImage();
    }
    if (p.acquired) { vkDestroySemaphore(p.device, p.acquired, nullptr); p.acquired = VK_NULL_HANDLE; }
    if (p.rendered) { vkDestroySemaphore(p.device, p.rendered, nullptr); p.rendered = VK_NULL_HANDLE; }
    if (p.commandPool) { vkDestroyCommandPool(p.device, p.commandPool, nullptr); p.commandPool = VK_NULL_HANDLE; p.commandBuffer = VK_NULL_HANDLE; }
    if (p.swapchain) {
        vkDestroySwapchainKHR(p.device, p.swapchain, nullptr);
        p.swapchain = VK_NULL_HANDLE;
        p.images.clear();
        ++p.swapchainDestroys;
        log(ANDROID_LOG_INFO, "SWAPCHAIN_DESTROY count=" + std::to_string(p.swapchainDestroys));
    }
}

bool createSwapchain() {
    p.nativeWindowWidth = static_cast<uint32_t>(std::max(ANativeWindow_getWidth(p.window), 0));
    p.nativeWindowHeight = static_cast<uint32_t>(std::max(ANativeWindow_getHeight(p.window), 0));
    VkSurfaceCapabilitiesKHR caps{};
    if (!check(vkGetPhysicalDeviceSurfaceCapabilitiesKHR(p.gpu, p.surface, &caps), "vkGetPhysicalDeviceSurfaceCapabilitiesKHR")) return false;
    uint32_t formatCount = 0;
    if (!check(vkGetPhysicalDeviceSurfaceFormatsKHR(p.gpu, p.surface, &formatCount, nullptr), "vkGetPhysicalDeviceSurfaceFormatsKHR(count)") || !formatCount) return false;
    std::vector<VkSurfaceFormatKHR> formats(formatCount);
    if (!check(vkGetPhysicalDeviceSurfaceFormatsKHR(p.gpu, p.surface, &formatCount, formats.data()), "vkGetPhysicalDeviceSurfaceFormatsKHR")) return false;
    p.supportedFormats = formats;
    for (const auto &f : formats) log(ANDROID_LOG_INFO, "SURFACE_FORMAT format=" + std::to_string(f.format) + " color_space=" + std::to_string(f.colorSpace));
    VkSurfaceFormatKHR selected = formats.front();
    for (const auto &f : formats) {
        if ((f.format == VK_FORMAT_R8G8B8A8_UNORM || f.format == VK_FORMAT_B8G8R8A8_UNORM) && f.colorSpace == VK_COLOR_SPACE_SRGB_NONLINEAR_KHR) { selected = f; break; }
    }
    uint32_t modeCount = 0;
    if (!check(vkGetPhysicalDeviceSurfacePresentModesKHR(p.gpu, p.surface, &modeCount, nullptr), "vkGetPhysicalDeviceSurfacePresentModesKHR(count)") || !modeCount) return false;
    std::vector<VkPresentModeKHR> modes(modeCount);
    if (!check(vkGetPhysicalDeviceSurfacePresentModesKHR(p.gpu, p.surface, &modeCount, modes.data()), "vkGetPhysicalDeviceSurfacePresentModesKHR")) return false;
    p.supportedPresentModes = modes;
    if (std::find(modes.begin(), modes.end(), VK_PRESENT_MODE_FIFO_KHR) == modes.end()) {
        p.lastError = "FIFO present mode is not supported for Android surface";
        return false;
    }
    p.presentMode = VK_PRESENT_MODE_FIFO_KHR;
    p.format = selected.format;
    p.colorSpace = selected.colorSpace;
    // Android permits imageExtent to differ from currentExtent. During a view
    // resize currentExtent can still describe the previous swapchain buffers.
    // Follow the latest SurfaceHolder size, clamped to the advertised limits,
    // so Android does not stretch an old-aspect buffer onto the new surface.
    p.extent = VkExtent2D{
        std::clamp(p.requestedWidth, caps.minImageExtent.width, caps.maxImageExtent.width),
        std::clamp(p.requestedHeight, caps.minImageExtent.height, caps.maxImageExtent.height)};
    p.surfaceCurrentExtentWidth = caps.currentExtent.width;
    p.surfaceCurrentExtentHeight = caps.currentExtent.height;
    p.surfaceCurrentTransform = static_cast<uint32_t>(caps.currentTransform);
    p.surfaceSupportedTransforms = static_cast<uint32_t>(caps.supportedTransforms);
    p.swapchainPreTransform =
        (caps.supportedTransforms & VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR) ?
        VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR : caps.currentTransform;
    if (!(caps.supportedUsageFlags & VK_IMAGE_USAGE_TRANSFER_DST_BIT)) {
        p.lastError = "surface does not support transfer-destination swapchain images";
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    uint32_t imageCount = caps.minImageCount + 1;
    if (caps.maxImageCount && imageCount > caps.maxImageCount) imageCount = caps.maxImageCount;
    p.requestedImageCount = imageCount;
    p.surfaceMinImageCount = caps.minImageCount;
    p.surfaceMaxImageCount = caps.maxImageCount;
    p.surfaceUsageFlags = caps.supportedUsageFlags;
    uint32_t alpha = (caps.supportedCompositeAlpha & VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR) ?
        VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR : (1u << __builtin_ctz(caps.supportedCompositeAlpha));
    log(ANDROID_LOG_INFO, "SURFACE_CAPS min_images=" + std::to_string(caps.minImageCount) +
        " max_images=" + std::to_string(caps.maxImageCount) + " usage=" + std::to_string(caps.supportedUsageFlags) +
        " formats=" + std::to_string(formatCount) + " present_modes=" + std::to_string(modeCount) +
        " min_extent=" + std::to_string(caps.minImageExtent.width) + "x" + std::to_string(caps.minImageExtent.height) +
        " max_extent=" + std::to_string(caps.maxImageExtent.width) + "x" + std::to_string(caps.maxImageExtent.height) +
        " current_extent=" + std::to_string(caps.currentExtent.width) + "x" + std::to_string(caps.currentExtent.height) +
        " current_transform=" + hexValue(static_cast<uint32_t>(caps.currentTransform)) +
        " supported_transforms=" + hexValue(static_cast<uint32_t>(caps.supportedTransforms)) +
        " chosen_pre_transform=" + hexValue(p.swapchainPreTransform) +
        " transform_policy=" + ((p.swapchainPreTransform == VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR) ?
            "identity_unrotated_source" : "current_surface_transform"));
    VkSwapchainCreateInfoKHR ci{VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR};
    ci.surface = p.surface;
    ci.minImageCount = imageCount;
    ci.imageFormat = p.format;
    ci.imageColorSpace = p.colorSpace;
    ci.imageExtent = p.extent;
    ci.imageArrayLayers = 1;
    if (p.gpuPresent && !(caps.supportedUsageFlags & VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT)) {
        p.gpuPresent = false;
        log(ANDROID_LOG_WARN, "GPU_PRESENT_FALLBACK reason=no_color_attachment_usage scaling=cpu");
    }
    ci.imageUsage = VK_IMAGE_USAGE_TRANSFER_DST_BIT |
        (p.gpuPresent ? VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT : 0);
    ci.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    ci.preTransform = static_cast<VkSurfaceTransformFlagBitsKHR>(p.swapchainPreTransform);
    ci.compositeAlpha = static_cast<VkCompositeAlphaFlagBitsKHR>(alpha);
    ci.presentMode = p.presentMode;
    ci.clipped = VK_TRUE;
    if (!check(vkCreateSwapchainKHR(p.device, &ci, nullptr, &p.swapchain), "vkCreateSwapchainKHR")) return false;
    // Swapchain creation configures the window's buffer dimensions. Cache the
    // resulting values so that change detection does not chase old dimensions.
    p.nativeWindowWidth = static_cast<uint32_t>(std::max(ANativeWindow_getWidth(p.window), 0));
    p.nativeWindowHeight = static_cast<uint32_t>(std::max(ANativeWindow_getHeight(p.window), 0));
    ++p.swapchainCreates;
    uint32_t actual = 0;
    if (!check(vkGetSwapchainImagesKHR(p.device, p.swapchain, &actual, nullptr), "vkGetSwapchainImagesKHR(count)")) return false;
    p.images.resize(actual);
    p.actualImageCount = actual;
    if (!check(vkGetSwapchainImagesKHR(p.device, p.swapchain, &actual, p.images.data()), "vkGetSwapchainImagesKHR")) return false;
    VkCommandPoolCreateInfo pci{VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO};
    pci.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
    pci.queueFamilyIndex = p.queueFamily;
    if (!check(vkCreateCommandPool(p.device, &pci, nullptr, &p.commandPool), "vkCreateCommandPool")) return false;
    VkCommandBufferAllocateInfo cai{VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO};
    cai.commandPool = p.commandPool;
    cai.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
    cai.commandBufferCount = 1;
    if (!check(vkAllocateCommandBuffers(p.device, &cai, &p.commandBuffer), "vkAllocateCommandBuffers")) return false;
    VkSemaphoreCreateInfo sem{VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO};
    if (!check(vkCreateSemaphore(p.device, &sem, nullptr, &p.acquired), "vkCreateSemaphore(acquire)")) return false;
    if (!check(vkCreateSemaphore(p.device, &sem, nullptr, &p.rendered), "vkCreateSemaphore(render)")) return false;
    log(ANDROID_LOG_INFO, "SWAPCHAIN_CREATE count=" + std::to_string(p.swapchainCreates) +
        " extent=" + std::to_string(p.extent.width) + "x" + std::to_string(p.extent.height) +
        " requested=" + std::to_string(p.requestedWidth) + "x" + std::to_string(p.requestedHeight) +
        " native_window=" + std::to_string(p.nativeWindowWidth) + "x" + std::to_string(p.nativeWindowHeight) +
        " current_extent=" + std::to_string(p.surfaceCurrentExtentWidth) + "x" + std::to_string(p.surfaceCurrentExtentHeight) +
        " current_transform=" + hexValue(p.surfaceCurrentTransform) +
        " supported_transforms=" + hexValue(p.surfaceSupportedTransforms) +
        " pre_transform=" + hexValue(p.swapchainPreTransform) +
        " format=" + std::to_string(p.format) + " color_space=" + std::to_string(p.colorSpace) +
        " present_mode=FIFO requested_images=" + std::to_string(imageCount) + " actual_images=" + std::to_string(actual) +
        " scaling=" + (p.gpuPresent ? "gpu" : "cpu"));
    return createSwapchainTargets();
}

bool recoverLostSurface() {
    if (!p.window || !p.instance || !p.device) return false;
    destroySwapchain();
    if (p.surface) {
        vkDestroySurfaceKHR(p.instance, p.surface, nullptr);
        p.surface = VK_NULL_HANDLE;
        ++p.surfaceDestroys;
    }
    VkAndroidSurfaceCreateInfoKHR ci{VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR};
    ci.window = p.window;
    if (!check(vkCreateAndroidSurfaceKHR(p.instance, &ci, nullptr, &p.surface), "vkCreateAndroidSurfaceKHR(recover)")) return false;
    ++p.surfaceCreates;
    VkBool32 canPresent = VK_FALSE;
    if (!check(vkGetPhysicalDeviceSurfaceSupportKHR(p.gpu, p.queueFamily, p.surface, &canPresent),
               "vkGetPhysicalDeviceSurfaceSupportKHR(recover)" ) || !canPresent) {
        p.lastError = "replacement surface is not supported by the selected queue family";
        return false;
    }
    log(ANDROID_LOG_WARN, "SURFACE_LOST_RECOVERED new_surface_count=" + std::to_string(p.surfaceCreates));
    if (!createSwapchain()) return false;
    p.lastError.clear();
    return true;
}

bool presentFrame(bool allowRetry = true, const uint8_t *pixels = nullptr,
                  uint32_t sourceWidth = 0, uint32_t sourceHeight = 0,
                  uint32_t sourceStride = 0) {
    if (!p.swapchain || !p.device) return false;
    // A native window can change before its queued Java resize callback runs.
    // Refresh only when its dimensions change; SUBOPTIMAL alone stays nonfatal.
    if (static_cast<uint32_t>(std::max(ANativeWindow_getWidth(p.window), 0)) != p.nativeWindowWidth ||
        static_cast<uint32_t>(std::max(ANativeWindow_getHeight(p.window), 0)) != p.nativeWindowHeight) {
        if (!resizeSurface(p.requestedWidth, p.requestedHeight, false)) return false;
    }
#ifdef BOXDROID_RUNTIME
    using PerfClock = std::chrono::steady_clock;
    auto perfStart = PerfClock::now();
#endif
    const bool hasPixels = pixels && sourceWidth && sourceHeight && sourceStride >= sourceWidth * 4;
    // GPU scaling uploads the frame at its own size; CPU scaling fills a
    // staging buffer as large as the swapchain image.
    const bool gpuDraw = hasPixels && p.gpuPresent && sourceStride % 4 == 0;
    const VkDeviceSize stagingBytes = gpuDraw ?
        static_cast<VkDeviceSize>(sourceStride) * sourceHeight :
        static_cast<VkDeviceSize>(p.extent.width) * p.extent.height * 4;
    if (hasPixels && !ensureStaging(stagingBytes)) return false;
    if (gpuDraw && !ensureSourceImage(sourceWidth, sourceHeight)) return false;
    uint32_t index = 0;
    VkResult r;
    // A finite acquisition lets surface retirement interrupt a blocked worker.
    // While the surface is live, retry without discarding the queued frame.
    do {
        if (surfaceRetiring.load(std::memory_order_acquire)) return false;
        r = vkAcquireNextImageKHR(p.device, p.swapchain, 100000000,
                                 p.acquired, VK_NULL_HANDLE, &index);
    } while (r == VK_TIMEOUT || r == VK_NOT_READY);
    if (r == VK_ERROR_OUT_OF_DATE_KHR) {
        ++p.outOfDate;
        log(ANDROID_LOG_WARN, "vkAcquireNextImageKHR=VK_ERROR_OUT_OF_DATE_KHR");
        destroySwapchain();
        return createSwapchain() && allowRetry ? presentFrame(false, pixels, sourceWidth, sourceHeight, sourceStride) : false;
    }
    if (r == VK_ERROR_SURFACE_LOST_KHR) {
        ++p.surfaceLost;
        p.lastError = resultName(r);
        return recoverLostSurface() && allowRetry ? presentFrame(false, pixels, sourceWidth, sourceHeight, sourceStride) : false;
    }
    if (r == VK_SUBOPTIMAL_KHR) noteSuboptimal("vkAcquireNextImageKHR");
    else if (r != VK_SUCCESS) { ++p.failedPresents; check(r, "vkAcquireNextImageKHR"); return false; }
    ++p.acquires;

#ifdef BOXDROID_RUNTIME
    auto perfAcquired = PerfClock::now();
#endif
    VkBuffer stagingBuffer = hasPixels ? p.stagingBuffer : VK_NULL_HANDLE;
    if (hasPixels) {
        const int mode = aspectMode.load(std::memory_order_relaxed);
        const AspectFit fit = aspectFit(sourceWidth, sourceHeight, p.extent.width, p.extent.height, mode);
        const uint32_t destinationWidth = fit.width;
        const uint32_t destinationHeight = fit.height;
        const uint32_t destinationX = fit.x;
        const uint32_t destinationY = fit.y;
        const std::array<uint32_t, 10> geometry = {sourceWidth, sourceHeight, sourceStride,
            p.requestedWidth, p.requestedHeight, p.nativeWindowWidth, p.nativeWindowHeight,
            p.extent.width, p.extent.height, static_cast<uint32_t>(mode)};
        auto *dst = static_cast<uint8_t *>(p.stagingMapped);
        if (!p.frameGeometryValid || geometry != p.frameGeometryKey) {
            p.frameGeometryValid = true;
            p.frameGeometryKey = geometry;
            p.frameFit = fit;
            ++p.geometryChanges;
            if (!gpuDraw) {
                const size_t destinationPixels = static_cast<size_t>(p.extent.width) * p.extent.height;
                std::fill_n(reinterpret_cast<uint32_t *>(dst), destinationPixels, 0xFF000000U);
            }
            // Geometry events only, with a fixed cap for this diagnostic harness.
            if (p.geometryChanges <= 32) log(ANDROID_LOG_INFO,
                "FRAME_UPLOAD_GEOMETRY change=" + std::to_string(p.geometryChanges) +
                " source=" + std::to_string(sourceWidth) + "x" +
                std::to_string(sourceHeight) + " stride=" + std::to_string(sourceStride) +
                " surface=" + std::to_string(p.requestedWidth) + "x" + std::to_string(p.requestedHeight) +
                " native_window=" + std::to_string(p.nativeWindowWidth) + "x" + std::to_string(p.nativeWindowHeight) +
                " swapchain=" + std::to_string(p.extent.width) + "x" + std::to_string(p.extent.height) +
                " scale=" + std::to_string(fit.scale) +
                " destination=" + std::to_string(destinationWidth) + "x" +
                std::to_string(destinationHeight) + "+" + std::to_string(destinationX) + "+" +
                std::to_string(destinationY) + " aspect_mode=" + std::to_string(mode) + " pre_transform=" +
                hexValue(p.swapchainPreTransform) + " scaling=" + (gpuDraw ? "gpu" : "cpu"));
        }
        if (gpuDraw) {
            std::memcpy(dst, pixels, static_cast<size_t>(stagingBytes));
        } else {
#ifdef BOXDROID_RUNTIME
            // Same aspect-fit rectangle; Pixman's NEON scaler removes per-pixel
            // integer divisions from the refresh/BQL critical path.
            pixman_image_t *srcImage = pixman_image_create_bits(PIXMAN_a8b8g8r8,
                sourceWidth, sourceHeight, const_cast<uint32_t *>(reinterpret_cast<const uint32_t *>(pixels)), sourceStride);
            pixman_image_t *dstImage = pixman_image_create_bits(
                p.format == VK_FORMAT_B8G8R8A8_UNORM ? PIXMAN_a8r8g8b8 : PIXMAN_a8b8g8r8,
                p.extent.width, p.extent.height, reinterpret_cast<uint32_t *>(dst), p.extent.width * 4);
            if (!srcImage || !dstImage) {
                if (srcImage) pixman_image_unref(srcImage);
                if (dstImage) pixman_image_unref(dstImage);
                return false;
            }
            pixman_transform_t transform;
            pixman_transform_init_scale(&transform,
                pixman_double_to_fixed(static_cast<double>(sourceWidth) / destinationWidth),
                pixman_double_to_fixed(static_cast<double>(sourceHeight) / destinationHeight));
            pixman_image_set_transform(srcImage, &transform);
            // The CPU fallback has no SGSR; it scales bilinear instead.
            pixman_image_set_filter(srcImage, scalingFilter.load(std::memory_order_relaxed) == kFilterNearest ?
                PIXMAN_FILTER_NEAREST : PIXMAN_FILTER_BILINEAR, nullptr, 0);
            pixman_image_set_repeat(srcImage, PIXMAN_REPEAT_PAD);
            pixman_image_composite32(PIXMAN_OP_SRC, srcImage, nullptr, dstImage,
                0, 0, 0, 0, destinationX, destinationY, destinationWidth, destinationHeight);
            pixman_image_unref(srcImage); pixman_image_unref(dstImage);
#else
            for (uint32_t y = 0; y < destinationHeight; ++y) {
                const uint32_t sy = std::min(sourceHeight - 1, static_cast<uint32_t>((static_cast<uint64_t>(y) * sourceHeight) / destinationHeight));
                for (uint32_t x = 0; x < destinationWidth; ++x) {
                    const uint32_t sx = std::min(sourceWidth - 1, static_cast<uint32_t>((static_cast<uint64_t>(x) * sourceWidth) / destinationWidth));
                    const uint8_t *src = pixels + sy * sourceStride + sx * 4;
                    uint8_t *pixel = dst + (static_cast<size_t>(destinationY + y) * p.extent.width +
                                            destinationX + x) * 4;
                    if (p.format == VK_FORMAT_B8G8R8A8_UNORM) {
                        pixel[0] = src[2]; pixel[1] = src[1]; pixel[2] = src[0]; pixel[3] = src[3];
                    } else {
                        pixel[0] = src[0]; pixel[1] = src[1]; pixel[2] = src[2]; pixel[3] = src[3];
                    }
                }
            }
#endif
        }
    }
#ifdef BOXDROID_RUNTIME
    auto perfPrepared = PerfClock::now();
#endif
    if (!check(vkResetCommandBuffer(p.commandBuffer, 0), "vkResetCommandBuffer")) return false;
    VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};
    begin.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    if (!check(vkBeginCommandBuffer(p.commandBuffer, &begin), "vkBeginCommandBuffer")) return false;
    VkPipelineStageFlags waitStage = VK_PIPELINE_STAGE_TRANSFER_BIT;
    if (gpuDraw) {
        // Upload the frame, then draw it scaled into the aspect-fit rectangle.
        VkImageMemoryBarrier toUpload{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};
        toUpload.srcAccessMask = p.sourceImageWritten ? VK_ACCESS_SHADER_READ_BIT : 0;
        toUpload.dstAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
        toUpload.oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
        toUpload.newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
        toUpload.srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        toUpload.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        toUpload.image = p.sourceImage;
        toUpload.subresourceRange = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1};
        vkCmdPipelineBarrier(p.commandBuffer,
            p.sourceImageWritten ? VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT : VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT,
            VK_PIPELINE_STAGE_TRANSFER_BIT, 0, 0, nullptr, 0, nullptr, 1, &toUpload);
        VkBufferImageCopy copy{};
        copy.bufferRowLength = sourceStride / 4;
        copy.imageSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
        copy.imageExtent = {sourceWidth, sourceHeight, 1};
        vkCmdCopyBufferToImage(p.commandBuffer, p.stagingBuffer, p.sourceImage,
                               VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &copy);
        VkImageMemoryBarrier toSample = toUpload;
        toSample.srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
        toSample.dstAccessMask = VK_ACCESS_SHADER_READ_BIT;
        toSample.oldLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
        toSample.newLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
        vkCmdPipelineBarrier(p.commandBuffer, VK_PIPELINE_STAGE_TRANSFER_BIT,
            VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT, 0, 0, nullptr, 0, nullptr, 1, &toSample);
        p.sourceImageWritten = true;

        VkClearValue black{};
        black.color = {{0.0f, 0.0f, 0.0f, 1.0f}};
        VkRenderPassBeginInfo pass{VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO};
        pass.renderPass = p.renderPass;
        pass.framebuffer = p.framebuffers[index];
        pass.renderArea = {{0, 0}, p.extent};
        pass.clearValueCount = 1;
        pass.pClearValues = &black;
        vkCmdBeginRenderPass(p.commandBuffer, &pass, VK_SUBPASS_CONTENTS_INLINE);
        const AspectFit &fit = p.frameFit;
        VkViewport viewport{static_cast<float>(fit.x), static_cast<float>(fit.y),
                            static_cast<float>(fit.width), static_cast<float>(fit.height), 0.0f, 1.0f};
        VkRect2D scissor{{0, 0}, p.extent};
        vkCmdSetViewport(p.commandBuffer, 0, 1, &viewport);
        vkCmdSetScissor(p.commandBuffer, 0, 1, &scissor);
        // SGSR samples through the bilinear sampler; without its pipeline it draws bilinear.
        const int filter = scalingFilter.load(std::memory_order_relaxed);
        const bool sgsr = filter == kFilterSgsr && p.sgsrPipeline;
        vkCmdBindPipeline(p.commandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS, sgsr ? p.sgsrPipeline : p.pipeline);
        const int sampler = filter == kFilterNearest ? kFilterNearest : kFilterBilinear;
        vkCmdBindDescriptorSets(p.commandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS, p.pipelineLayout,
                                0, 1, &p.descriptorSets[sampler], 0, nullptr);
        if (sgsr) {
            const float viewportInfo[4] = {1.0f / sourceWidth, 1.0f / sourceHeight,
                                           static_cast<float>(sourceWidth), static_cast<float>(sourceHeight)};
            vkCmdPushConstants(p.commandBuffer, p.pipelineLayout, VK_SHADER_STAGE_FRAGMENT_BIT,
                               0, sizeof(viewportInfo), viewportInfo);
        }
        vkCmdDraw(p.commandBuffer, 3, 1, 0, 0);
        vkCmdEndRenderPass(p.commandBuffer);
        waitStage = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    } else {
        VkImageMemoryBarrier toClear{VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER};
        toClear.dstAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
        toClear.oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
        toClear.newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
        toClear.srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        toClear.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
        toClear.image = p.images[index];
        toClear.subresourceRange = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1};
        vkCmdPipelineBarrier(p.commandBuffer, VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT, 0, 0, nullptr, 0, nullptr, 1, &toClear);
        if (stagingBuffer) {
            VkBufferImageCopy copy{};
            copy.imageSubresource = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 0, 1};
            copy.imageExtent = {p.extent.width, p.extent.height, 1};
            vkCmdCopyBufferToImage(p.commandBuffer, stagingBuffer, p.images[index],
                                   VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &copy);
        } else {
            VkClearColorValue color = p.generation == 1 ? VkClearColorValue{{0.92f, 0.04f, 0.52f, 1.0f}} : VkClearColorValue{{0.02f, 0.78f, 0.92f, 1.0f}};
            vkCmdClearColorImage(p.commandBuffer, p.images[index], VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &color, 1, &toClear.subresourceRange);
        }
        VkImageMemoryBarrier toPresent = toClear;
        toPresent.srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
        toPresent.dstAccessMask = 0;
        toPresent.oldLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
        toPresent.newLayout = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;
        vkCmdPipelineBarrier(p.commandBuffer, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT, 0, 0, nullptr, 0, nullptr, 1, &toPresent);
    }
    if (!check(vkEndCommandBuffer(p.commandBuffer), "vkEndCommandBuffer")) return false;
    VkSubmitInfo submit{VK_STRUCTURE_TYPE_SUBMIT_INFO};
    submit.waitSemaphoreCount = 1;
    submit.pWaitSemaphores = &p.acquired;
    submit.pWaitDstStageMask = &waitStage;
    submit.commandBufferCount = 1;
    submit.pCommandBuffers = &p.commandBuffer;
    submit.signalSemaphoreCount = 1;
    submit.pSignalSemaphores = &p.rendered;
    if (!check(vkQueueSubmit(p.queue, 1, &submit, VK_NULL_HANDLE), "vkQueueSubmit")) { ++p.failedPresents; return false; }
    ++p.submissions;
    VkPresentInfoKHR present{VK_STRUCTURE_TYPE_PRESENT_INFO_KHR};
    present.waitSemaphoreCount = 1;
    present.pWaitSemaphores = &p.rendered;
    present.swapchainCount = 1;
    present.pSwapchains = &p.swapchain;
    present.pImageIndices = &index;
#ifdef BOXDROID_RUNTIME
    auto perfSubmitted = PerfClock::now();
#endif
    r = vkQueuePresentKHR(p.queue, &present);
#ifdef BOXDROID_RUNTIME
    auto perfPresented = PerfClock::now();
#endif
    if (r == VK_ERROR_OUT_OF_DATE_KHR) ++p.outOfDate;
    else if (r == VK_ERROR_SURFACE_LOST_KHR) {
        ++p.surfaceLost;
        p.lastError = resultName(r);
        vkQueueWaitIdle(p.queue);
        return recoverLostSurface() && allowRetry ? presentFrame(false, pixels, sourceWidth, sourceHeight, sourceStride) : false;
    }
    else if (r == VK_SUBOPTIMAL_KHR) {
        noteSuboptimal("vkQueuePresentKHR");
    }
    else if (r != VK_SUCCESS) { ++p.failedPresents; check(r, "vkQueuePresentKHR"); return false; }
    if (!check(vkQueueWaitIdle(p.queue), "vkQueueWaitIdle")) { ++p.failedPresents; return false; }
    if (r == VK_ERROR_OUT_OF_DATE_KHR) {
        ++p.failedPresents;
        p.lastError = resultName(r);
        destroySwapchain();
        return createSwapchain() && allowRetry ? presentFrame(false, pixels, sourceWidth, sourceHeight, sourceStride) : false;
    }
#ifdef BOXDROID_RUNTIME
    static uint64_t count=0, acquire=0, prepare=0, submitTime=0, presentTime=0, idle=0;
    auto micros=[](auto a, auto b) { return std::chrono::duration_cast<std::chrono::microseconds>(b-a).count(); };
    acquire+=micros(perfStart,perfAcquired); prepare+=micros(perfAcquired,perfPrepared);
    submitTime+=micros(perfPrepared,perfSubmitted); presentTime+=micros(perfSubmitted,perfPresented);
    idle+=micros(perfPresented,PerfClock::now());
    if (++count == 30 && profilingEnabled()) {
        __android_log_print(ANDROID_LOG_INFO,"BoxDroid",
            "WSI frames=%llu acquire_us=%llu prepare_us=%llu submit_us=%llu present_us=%llu idle_us=%llu",
            (unsigned long long)count,(unsigned long long)acquire,(unsigned long long)prepare,
            (unsigned long long)submitTime,(unsigned long long)presentTime,(unsigned long long)idle);
    }
    if (count >= 30) count=acquire=prepare=submitTime=presentTime=idle=0;
#endif
    ++p.presents;
    overlayPresentedFrames.store(p.presents, std::memory_order_relaxed);
    if (p.generation == 1) ++p.frameBeforeRecreate; else ++p.frameAfterRecreate;
    if (profilingEnabled() && (p.presents % 30) == 0) log(ANDROID_LOG_INFO, "FRAME presented=" + std::to_string(p.presents) + " generation=" + std::to_string(p.generation));
    return true;
}

void destroySurface() {
    if (p.device) vkDeviceWaitIdle(p.device);
    destroySwapchain();
    if (p.surface) { vkDestroySurfaceKHR(p.instance, p.surface, nullptr); p.surface = VK_NULL_HANDLE; ++p.surfaceDestroys; }
    if (p.window) { ANativeWindow_release(p.window); p.window = nullptr; }
    log(ANDROID_LOG_INFO, "SURFACE_DESTROY count=" + std::to_string(p.surfaceDestroys));
}

bool presentOwnedPixels(const uint8_t *pixels, uint32_t width,
                       uint32_t height, uint32_t stride) {
    std::lock_guard<std::mutex> guard(presenterLock);
    if (!p.surface || surfaceRetiring.load(std::memory_order_acquire)) return false;
    p.lastFrame.assign(pixels, pixels + static_cast<size_t>(stride) * height);
    p.lastSourceWidth = width;
    p.lastSourceHeight = height;
    p.lastSourceStride = stride;
    return presentFrame(true, p.lastFrame.data(), width, height, stride);
}

void recordPresentation(boxdroid::FrameQueue::Clock::time_point queued,
                        boxdroid::FrameQueue::Clock::time_point begin, bool ok) {
    if (!profilingEnabled()) return;
    using Queue = boxdroid::FrameQueue;
    const auto end = Queue::Clock::now();
    const auto monoUs = std::chrono::duration_cast<std::chrono::microseconds>(
        end.time_since_epoch()).count();
    // Opt-in per-frame timestamps permit exact interval and latency percentiles.
    __android_log_print(ANDROID_LOG_INFO, kTag,
        "PRESENT_FRAME mono_us=%lld queue_us=%llu service_us=%llu ok=%d async=%d",
        static_cast<long long>(monoUs),
        static_cast<unsigned long long>(Queue::micros(queued, begin)),
        static_cast<unsigned long long>(Queue::micros(begin, end)),
        ok, asyncPresentationEnabled());
    static auto lastReport = Queue::Clock::now();
    if (Queue::micros(lastReport, end) >= 1000000) {
        const auto stats = frameQueue.snapshot();
        __android_log_print(ANDROID_LOG_INFO, kTag,
            "PRESENT_QUEUE submitted=%llu completed=%llu failed=%llu canceled=%llu max_depth=%llu blocked_us=%llu idle_us=%llu",
            static_cast<unsigned long long>(stats.submitted),
            static_cast<unsigned long long>(stats.completed),
            static_cast<unsigned long long>(stats.failed),
            static_cast<unsigned long long>(stats.canceled),
            static_cast<unsigned long long>(stats.maxDepth),
            static_cast<unsigned long long>(stats.blockedUs),
            static_cast<unsigned long long>(stats.idleUs));
        lastReport = end;
    }
}

bool consumeQueuedFrame(const boxdroid::FrameQueue::Frame &frame) {
    thread_local const bool named = [] {
        pthread_setname_np(pthread_self(), "boxdroid-wsi");
        return true;
    }();
    (void)named;
    const auto begin = boxdroid::FrameQueue::Clock::now();
    const bool ok = presentOwnedPixels(frame.pixels.data(), frame.width,
                                      frame.height, frame.stride);
    recordPresentation(frame.queued, begin, ok);
    return ok;
}

std::string diagnostics() {
    std::ostringstream s;
    const bool pass = p.surfaceCreates >= 2 && p.surfaceDestroys >= 2 && p.swapchainCreates >= 2 &&
        p.swapchainDestroys >= 2 && p.frameBeforeRecreate > 0 && p.frameAfterRecreate > 0 &&
        p.failedPresents == 0 && !p.surface && !p.swapchain;
    s << "{\"status\":\"" << (pass ? "PASS" : "FAIL") << "\",\"gpu\":\"" << p.gpuName
      << "\",\"queue_family\":" << p.queueFamily << ",\"format\":" << p.format
      << ",\"color_space\":" << p.colorSpace << ",\"present_mode\":\"FIFO\",\"extent\":["
      << p.extent.width << ',' << p.extent.height << "],\"requested_extent\":["
      << p.requestedWidth << ',' << p.requestedHeight << "],\"native_window\":["
      << p.nativeWindowWidth << ',' << p.nativeWindowHeight << "],\"current_extent\":["
      << p.surfaceCurrentExtentWidth << ',' << p.surfaceCurrentExtentHeight
      << "],\"current_transform\":" << p.surfaceCurrentTransform
      << ",\"supported_transforms\":" << p.surfaceSupportedTransforms
      << ",\"pre_transform\":" << p.swapchainPreTransform
      << ",\"surface_min_image_count\":" << p.surfaceMinImageCount
      << ",\"surface_max_image_count\":" << p.surfaceMaxImageCount << ",\"surface_usage_flags\":" << p.surfaceUsageFlags
      << ",\"requested_image_count\":" << p.requestedImageCount << ",\"actual_image_count\":" << p.actualImageCount
      << ",\"surface_formats\":[";
    for (size_t i = 0; i < p.supportedFormats.size(); ++i) {
        if (i) s << ',';
        s << "{\"format\":" << p.supportedFormats[i].format << ",\"color_space\":" << p.supportedFormats[i].colorSpace << '}';
    }
    s << "],\"surface_present_modes\":[";
    for (size_t i = 0; i < p.supportedPresentModes.size(); ++i) {
        if (i) s << ',';
        s << p.supportedPresentModes[i];
    }
    s << "],\"surface_creations\":" << p.surfaceCreates
      << ",\"surface_destructions\":" << p.surfaceDestroys << ",\"swapchain_creations\":" << p.swapchainCreates
      << ",\"swapchain_destructions\":" << p.swapchainDestroys << ",\"successful_acquires\":" << p.acquires
      << ",\"submitted_frames\":" << p.submissions << ",\"successful_presents\":" << p.presents
      << ",\"failed_presents\":" << p.failedPresents << ",\"frame_before_recreation\":" << p.frameBeforeRecreate
      << ",\"frame_after_recreation\":" << p.frameAfterRecreate << ",\"out_of_date\":" << p.outOfDate
      << ",\"suboptimal\":" << p.suboptimal << ",\"surface_lost\":" << p.surfaceLost
      << ",\"source_extent\":[" << p.frameGeometryKey[0] << ',' << p.frameGeometryKey[1]
      << "],\"fit_scale\":" << p.frameFit.scale << ",\"destination_rect\":["
      << p.frameFit.x << ',' << p.frameFit.y << ',' << p.frameFit.width << ',' << p.frameFit.height
      << "],\"geometry_changes\":" << p.geometryChanges
      << ",\"last_error\":\"" << p.lastError << "\"}";
    return s.str();
}
} // namespace

extern "C" JNIEXPORT jboolean JNICALL Java_org_boxdroid_MainActivity_nativeSurfaceCreated(JNIEnv *, jobject, jobject, jint, jint, jint);
extern "C" JNIEXPORT jboolean JNICALL Java_org_boxdroid_MainActivity_nativeSurfaceChanged(JNIEnv *, jobject, jint, jint);
extern "C" JNIEXPORT jboolean JNICALL Java_org_boxdroid_MainActivity_nativePresentFrame(JNIEnv *, jobject);
extern "C" JNIEXPORT void JNICALL Java_org_boxdroid_MainActivity_nativeSurfaceDestroyed(JNIEnv *, jobject);
extern "C" JNIEXPORT jstring JNICALL Java_org_boxdroid_MainActivity_nativeDiagnostics(JNIEnv *, jobject);
extern "C" JNIEXPORT void JNICALL Java_org_boxdroid_MainActivity_nativeShutdown(JNIEnv *, jobject);
extern "C" JNIEXPORT void JNICALL Java_org_boxdroid_MainActivity_nativeSetAspectMode(JNIEnv *, jobject, jint);
extern "C" JNIEXPORT void JNICALL Java_org_boxdroid_MainActivity_nativeSetScalingFilter(JNIEnv *, jobject, jint);
extern "C" JNIEXPORT jlong JNICALL Java_org_boxdroid_PerformanceActivity_nativePresentedFrames(JNIEnv *, jobject);

extern "C" bool boxdroid_android_present_rgba(const uint8_t *, uint32_t,
                                                uint32_t, uint32_t);

extern "C" bool boxdroid_android_present_rgba(const uint8_t *pixels,
                                                uint32_t width,
                                                uint32_t height,
                                                uint32_t stride) {
    if (!pixels || !width || !height || static_cast<uint64_t>(stride) <
        static_cast<uint64_t>(width) * 4) return false;
    std::lock_guard<std::mutex> lifecycle(presentationLifecycleLock);
    if (surfaceRetiring.load(std::memory_order_acquire)) return false;
    if (profilingEnabled()) {
        static auto lastCheck = boxdroid::FrameQueue::Clock::now();
        const auto now = boxdroid::FrameQueue::Clock::now();
        if (boxdroid::FrameQueue::micros(lastCheck, now) >= 1000000) {
            const bool requested = propertyEnabled("debug.boxdroid.async_present", true);
            if (requested != asyncPresentationEnabled()) {
                frameQueue.drain();
                frameQueue.stop();
                asyncPresentation.store(requested, std::memory_order_release);
                if (requested) startPresentationWorker();
                log(ANDROID_LOG_INFO, "PRESENT_MODE async=" + std::to_string(requested) + " drained=1");
            }
            lastCheck = now;
        }
    }
    if (asyncPresentationEnabled()) return frameQueue.push(pixels, width, height, stride);
    const auto begin = boxdroid::FrameQueue::Clock::now();
    const bool ok = presentOwnedPixels(pixels, width, height, stride);
    recordPresentation(begin, begin, ok);
    return ok;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_boxdroid_MainActivity_nativeSurfaceCreated(JNIEnv *env, jobject, jobject surface, jint width, jint height, jint generation) {
    surfaceRetiring.store(true, std::memory_order_release);
    std::lock_guard<std::mutex> lifecycle(presentationLifecycleLock);
    frameQueue.stop();
    std::lock_guard<std::mutex> guard(presenterLock);
    if (p.surface) destroySurface();
    surfaceRetiring.store(false, std::memory_order_release);
    asyncPresentation.store(propertyEnabled("debug.boxdroid.async_present", true), std::memory_order_release);
    const bool ok = createSurface(env, surface, static_cast<uint32_t>(std::max(width, 1)),
        static_cast<uint32_t>(std::max(height, 1)), static_cast<uint32_t>(generation));
    log(ok ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR, std::string("SURFACE_CREATED result=") + (ok ? "PASS" : "FAIL") + " generation=" + std::to_string(generation));
    if (ok && asyncPresentationEnabled()) startPresentationWorker();
    return ok ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_boxdroid_MainActivity_nativeSurfaceChanged(JNIEnv *, jobject, jint width, jint height) {
    surfaceRetiring.store(true, std::memory_order_release);
    std::lock_guard<std::mutex> lifecycle(presentationLifecycleLock);
    frameQueue.stop();
    std::lock_guard<std::mutex> guard(presenterLock);
    surfaceRetiring.store(false, std::memory_order_release);
    const bool ok = resizeSurface(static_cast<uint32_t>(std::max(width, 1)), static_cast<uint32_t>(std::max(height, 1)));
    log(ok ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR, std::string("SURFACE_CHANGED result=") + (ok ? "PASS" : "FAIL"));
    if (ok && asyncPresentationEnabled()) startPresentationWorker();
    return ok ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_boxdroid_MainActivity_nativePresentFrame(JNIEnv *, jobject) {
    std::lock_guard<std::mutex> guard(presenterLock);
    return presentFrame() ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_MainActivity_nativeSurfaceDestroyed(JNIEnv *, jobject) {
    surfaceRetiring.store(true, std::memory_order_release);
    std::lock_guard<std::mutex> lifecycle(presentationLifecycleLock);
    frameQueue.stop();
    std::lock_guard<std::mutex> guard(presenterLock);
    destroySurface();
}

// Applies from the next frame; repaints the last one at once so the change
// shows while the guest is paused behind the in-game menu.
extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_MainActivity_nativeSetAspectMode(JNIEnv *, jobject, jint mode) {
    if (mode < kAspect4x3 || mode > kAspectStretch) return;
    if (aspectMode.exchange(mode, std::memory_order_relaxed) == mode) return;
    log(ANDROID_LOG_INFO, "ASPECT_MODE mode=" + std::to_string(mode));
    std::lock_guard<std::mutex> guard(presenterLock);
    if (p.surface && p.swapchain && !surfaceRetiring.load(std::memory_order_acquire)) redrawLastFrame();
}

extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_MainActivity_nativeSetScalingFilter(JNIEnv *, jobject, jint filter) {
    if (filter < kFilterNearest || filter > kFilterSgsr) return;
    if (scalingFilter.exchange(filter, std::memory_order_relaxed) == filter) return;
    log(ANDROID_LOG_INFO, "SCALING_FILTER filter=" + std::to_string(filter));
    std::lock_guard<std::mutex> guard(presenterLock);
    if (p.surface && p.swapchain && !surfaceRetiring.load(std::memory_order_acquire)) redrawLastFrame();
}

extern "C" JNIEXPORT jstring JNICALL
Java_org_boxdroid_MainActivity_nativeDiagnostics(JNIEnv *env, jobject) {
    std::lock_guard<std::mutex> guard(presenterLock);
    const std::string result = diagnostics();
    log(ANDROID_LOG_INFO, "DIAGNOSTICS=" + result);
    return env->NewStringUTF(result.c_str());
}

extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_MainActivity_nativeShutdown(JNIEnv *, jobject) {
    surfaceRetiring.store(true, std::memory_order_release);
    std::lock_guard<std::mutex> lifecycle(presentationLifecycleLock);
    frameQueue.stop();
    std::lock_guard<std::mutex> guard(presenterLock);
    destroySurface();
    if (p.device) {
        vkDeviceWaitIdle(p.device);
        destroyPipelineObjects();
        vkDestroyDevice(p.device, nullptr);
        p.device = VK_NULL_HANDLE;
        p.queue = VK_NULL_HANDLE;
    }
    if (p.instance) {
        vkDestroyInstance(p.instance, nullptr);
        p.instance = VK_NULL_HANDLE;
    }
    p.gpu = VK_NULL_HANDLE;
    p.queueFamily = UINT32_MAX;
    p.lastFrame.clear();
    p.lastSourceWidth = p.lastSourceHeight = p.lastSourceStride = 0;
    log(ANDROID_LOG_INFO, "VULKAN_SHUTDOWN_CLEAN instance=destroyed device=destroyed");
}

#ifdef BOXDROID_RUNTIME
extern "C" JNIEXPORT jlong JNICALL
Java_org_boxdroid_PerformanceActivity_nativePresentedFrames(JNIEnv *, jobject) {
    return overlayPresentedFrames.load(std::memory_order_relaxed);
}
#endif
