#define VK_USE_PLATFORM_ANDROID_KHR 1
#include <jni.h>
#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <vulkan/vulkan.h>
#include <vulkan/vulkan_android.h>

#include <algorithm>
#include <cstdint>
#include <cstring>
#include <dlfcn.h>
#include <sstream>
#include <string>
#include <vector>

namespace {
constexpr char kTag[] = "BoxDroidM4";

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
    ANativeWindow *window = nullptr;
    std::vector<VkImage> images;
    std::vector<VkSurfaceFormatKHR> supportedFormats;
    std::vector<VkPresentModeKHR> supportedPresentModes;
    VkFormat format = VK_FORMAT_UNDEFINED;
    VkColorSpaceKHR colorSpace = VK_COLOR_SPACE_SRGB_NONLINEAR_KHR;
    VkPresentModeKHR presentMode = VK_PRESENT_MODE_FIFO_KHR;
    VkExtent2D extent{};
    uint32_t requestedWidth = 0;
    uint32_t requestedHeight = 0;
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
    uint32_t surfaceLost = 0;
    uint32_t frameBeforeRecreate = 0;
    uint32_t frameAfterRecreate = 0;
    uint32_t requestedImageCount = 0;
    uint32_t actualImageCount = 0;
    uint32_t surfaceMinImageCount = 0;
    uint32_t surfaceMaxImageCount = 0;
    VkImageUsageFlags surfaceUsageFlags = 0;
    uint32_t generation = 0;
    std::string gpuName;
    std::string lastError;
} p;

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

void log(int priority, const std::string &message) {
    __android_log_write(priority, kTag, message.c_str());
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

bool check(VkResult r, const char *operation) {
    log(r == VK_SUCCESS || r == VK_SUBOPTIMAL_KHR ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR,
        std::string(operation) + "=" + resultName(r) + " (" + std::to_string(r) + ")");
    if (r == VK_ERROR_OUT_OF_DATE_KHR) ++p.outOfDate;
    if (r == VK_SUBOPTIMAL_KHR) ++p.suboptimal;
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

bool resizeSurface(uint32_t width, uint32_t height) {
    if (!p.surface || !p.device) return false;
    width = std::max(width, 1u);
    height = std::max(height, 1u);
    if (width == p.requestedWidth && height == p.requestedHeight) return true;
    destroySwapchain();
    p.requestedWidth = width;
    p.requestedHeight = height;
    log(ANDROID_LOG_INFO, "SURFACE_RESIZE extent=" + std::to_string(width) + "x" + std::to_string(height));
    return createSwapchain();
}

bool createInstance() {
    p.loader = dlopen("libvulkan.so", RTLD_NOW | RTLD_LOCAL);
    if (!p.loader) {
        p.lastError = std::string("dlopen(libvulkan.so) failed: ") + dlerror();
        log(ANDROID_LOG_ERROR, p.lastError);
        return false;
    }
    p.getInstanceProcAddr = reinterpret_cast<PFN_vkGetInstanceProcAddr>(
        dlsym(p.loader, "vkGetInstanceProcAddr"));
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
    app.pApplicationName = "BoxDroid M4 Presenter";
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
    p.generation = generation;
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
    }
    return createSwapchain();
}

void destroySwapchain() {
    if (p.device) vkDeviceWaitIdle(p.device);
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
    p.extent = caps.currentExtent.width != UINT32_MAX ? caps.currentExtent : VkExtent2D{
        std::clamp(p.requestedWidth, caps.minImageExtent.width, caps.maxImageExtent.width),
        std::clamp(p.requestedHeight, caps.minImageExtent.height, caps.maxImageExtent.height)};
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
        " formats=" + std::to_string(formatCount) + " present_modes=" + std::to_string(modeCount));
    VkSwapchainCreateInfoKHR ci{VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR};
    ci.surface = p.surface;
    ci.minImageCount = imageCount;
    ci.imageFormat = p.format;
    ci.imageColorSpace = p.colorSpace;
    ci.imageExtent = p.extent;
    ci.imageArrayLayers = 1;
    ci.imageUsage = VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    ci.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    ci.preTransform = caps.currentTransform;
    ci.compositeAlpha = static_cast<VkCompositeAlphaFlagBitsKHR>(alpha);
    ci.presentMode = p.presentMode;
    ci.clipped = VK_TRUE;
    if (!check(vkCreateSwapchainKHR(p.device, &ci, nullptr, &p.swapchain), "vkCreateSwapchainKHR")) return false;
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
        " format=" + std::to_string(p.format) + " color_space=" + std::to_string(p.colorSpace) +
        " present_mode=FIFO requested_images=" + std::to_string(imageCount) + " actual_images=" + std::to_string(actual));
    return true;
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
    uint32_t index = 0;
    VkResult r = vkAcquireNextImageKHR(p.device, p.swapchain, UINT64_MAX, p.acquired, VK_NULL_HANDLE, &index);
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
    if (r == VK_SUBOPTIMAL_KHR) ++p.suboptimal;
    else if (r != VK_SUCCESS) { ++p.failedPresents; check(r, "vkAcquireNextImageKHR"); return false; }
    ++p.acquires;

    VkBuffer stagingBuffer = VK_NULL_HANDLE;
    VkDeviceMemory stagingMemory = VK_NULL_HANDLE;
    if (pixels && sourceWidth && sourceHeight && sourceStride >= sourceWidth * 4) {
        VkBufferCreateInfo bufferInfo{VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO};
        bufferInfo.size = static_cast<VkDeviceSize>(p.extent.width) * p.extent.height * 4;
        bufferInfo.usage = VK_BUFFER_USAGE_TRANSFER_SRC_BIT;
        bufferInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
        if (!check(vkCreateBuffer(p.device, &bufferInfo, nullptr, &stagingBuffer), "vkCreateBuffer(frame)")) return false;
        VkMemoryRequirements requirements{};
        vkGetBufferMemoryRequirements(p.device, stagingBuffer, &requirements);
        VkPhysicalDeviceMemoryProperties memoryProperties{};
        vkGetPhysicalDeviceMemoryProperties(p.gpu, &memoryProperties);
        uint32_t memoryType = UINT32_MAX;
        for (uint32_t i = 0; i < memoryProperties.memoryTypeCount; ++i) {
            const auto flags = memoryProperties.memoryTypes[i].propertyFlags;
            if ((requirements.memoryTypeBits & (1u << i)) &&
                (flags & VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT) &&
                (flags & VK_MEMORY_PROPERTY_HOST_COHERENT_BIT)) {
                memoryType = i;
                break;
            }
        }
        if (memoryType == UINT32_MAX) {
            vkDestroyBuffer(p.device, stagingBuffer, nullptr);
            p.lastError = "no host-visible coherent Vulkan memory for NV2A frame upload";
            log(ANDROID_LOG_ERROR, p.lastError);
            return false;
        }
        VkMemoryAllocateInfo allocation{VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO};
        allocation.allocationSize = requirements.size;
        allocation.memoryTypeIndex = memoryType;
        if (!check(vkAllocateMemory(p.device, &allocation, nullptr, &stagingMemory), "vkAllocateMemory(frame)")) {
            vkDestroyBuffer(p.device, stagingBuffer, nullptr);
            return false;
        }
        if (!check(vkBindBufferMemory(p.device, stagingBuffer, stagingMemory, 0), "vkBindBufferMemory(frame)")) {
            vkFreeMemory(p.device, stagingMemory, nullptr);
            vkDestroyBuffer(p.device, stagingBuffer, nullptr);
            return false;
        }
        void *mapped = nullptr;
        if (!check(vkMapMemory(p.device, stagingMemory, 0, allocation.allocationSize, 0, &mapped), "vkMapMemory(frame)")) {
            vkFreeMemory(p.device, stagingMemory, nullptr);
            vkDestroyBuffer(p.device, stagingBuffer, nullptr);
            return false;
        }
        auto *dst = static_cast<uint8_t *>(mapped);
        for (uint32_t y = 0; y < p.extent.height; ++y) {
            const uint32_t sy = std::min(sourceHeight - 1, static_cast<uint32_t>((static_cast<uint64_t>(y) * sourceHeight) / p.extent.height));
            for (uint32_t x = 0; x < p.extent.width; ++x) {
                const uint32_t sx = std::min(sourceWidth - 1, static_cast<uint32_t>((static_cast<uint64_t>(x) * sourceWidth) / p.extent.width));
                const uint8_t *src = pixels + sy * sourceStride + sx * 4;
                uint8_t *pixel = dst + (static_cast<size_t>(y) * p.extent.width + x) * 4;
                if (p.format == VK_FORMAT_B8G8R8A8_UNORM) {
                    pixel[0] = src[2]; pixel[1] = src[1]; pixel[2] = src[0]; pixel[3] = src[3];
                } else {
                    pixel[0] = src[0]; pixel[1] = src[1]; pixel[2] = src[2]; pixel[3] = src[3];
                }
            }
        }
        vkUnmapMemory(p.device, stagingMemory);
    }
    if (!check(vkResetCommandBuffer(p.commandBuffer, 0), "vkResetCommandBuffer")) return false;
    VkCommandBufferBeginInfo begin{VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO};
    begin.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    if (!check(vkBeginCommandBuffer(p.commandBuffer, &begin), "vkBeginCommandBuffer")) return false;
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
    if (!check(vkEndCommandBuffer(p.commandBuffer), "vkEndCommandBuffer")) return false;
    VkPipelineStageFlags waitStage = VK_PIPELINE_STAGE_TRANSFER_BIT;
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
    r = vkQueuePresentKHR(p.queue, &present);
    const bool recreate = r == VK_SUBOPTIMAL_KHR;
    if (r == VK_ERROR_OUT_OF_DATE_KHR) ++p.outOfDate;
    else if (r == VK_ERROR_SURFACE_LOST_KHR) {
        ++p.surfaceLost;
        p.lastError = resultName(r);
        vkQueueWaitIdle(p.queue);
        return recoverLostSurface() && allowRetry ? presentFrame(false, pixels, sourceWidth, sourceHeight, sourceStride) : false;
    }
    else if (recreate) ++p.suboptimal;
    else if (r != VK_SUCCESS) { ++p.failedPresents; check(r, "vkQueuePresentKHR"); return false; }
    if (!check(vkQueueWaitIdle(p.queue), "vkQueueWaitIdle")) { ++p.failedPresents; return false; }
    if (stagingBuffer) {
        vkDestroyBuffer(p.device, stagingBuffer, nullptr);
        vkFreeMemory(p.device, stagingMemory, nullptr);
    }
    if (r == VK_ERROR_OUT_OF_DATE_KHR) {
        ++p.failedPresents;
        p.lastError = resultName(r);
        destroySwapchain();
        return createSwapchain() && allowRetry ? presentFrame(false, pixels, sourceWidth, sourceHeight, sourceStride) : false;
    }
    ++p.presents;
    if (p.generation == 1) ++p.frameBeforeRecreate; else ++p.frameAfterRecreate;
    if ((p.presents % 30) == 0) log(ANDROID_LOG_INFO, "FRAME presented=" + std::to_string(p.presents) + " generation=" + std::to_string(p.generation));
    if (recreate) { destroySwapchain(); return createSwapchain(); }
    return true;
}

void destroySurface() {
    if (p.device) vkDeviceWaitIdle(p.device);
    destroySwapchain();
    if (p.surface) { vkDestroySurfaceKHR(p.instance, p.surface, nullptr); p.surface = VK_NULL_HANDLE; ++p.surfaceDestroys; }
    if (p.window) { ANativeWindow_release(p.window); p.window = nullptr; }
    log(ANDROID_LOG_INFO, "SURFACE_DESTROY count=" + std::to_string(p.surfaceDestroys));
}

std::string diagnostics() {
    std::ostringstream s;
    const bool pass = p.surfaceCreates >= 2 && p.surfaceDestroys >= 2 && p.swapchainCreates >= 2 &&
        p.swapchainDestroys >= 2 && p.frameBeforeRecreate > 0 && p.frameAfterRecreate > 0 &&
        p.failedPresents == 0 && !p.surface && !p.swapchain;
    s << "{\"status\":\"" << (pass ? "PASS" : "FAIL") << "\",\"gpu\":\"" << p.gpuName
      << "\",\"queue_family\":" << p.queueFamily << ",\"format\":" << p.format
      << ",\"color_space\":" << p.colorSpace << ",\"present_mode\":\"FIFO\",\"extent\":["
      << p.extent.width << ',' << p.extent.height << "],\"surface_min_image_count\":" << p.surfaceMinImageCount
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
      << ",\"last_error\":\"" << p.lastError << "\"}";
    return s.str();
}
} // namespace

extern "C" JNIEXPORT jboolean JNICALL Java_org_boxdroid_m5_MainActivity_nativeM4SurfaceCreated(JNIEnv *, jobject, jobject, jint, jint, jint);
extern "C" JNIEXPORT jboolean JNICALL Java_org_boxdroid_m5_MainActivity_nativeM4SurfaceChanged(JNIEnv *, jobject, jint, jint);
extern "C" JNIEXPORT jboolean JNICALL Java_org_boxdroid_m5_MainActivity_nativeM4PresentFrame(JNIEnv *, jobject);
extern "C" JNIEXPORT void JNICALL Java_org_boxdroid_m5_MainActivity_nativeM4SurfaceDestroyed(JNIEnv *, jobject);
extern "C" JNIEXPORT jstring JNICALL Java_org_boxdroid_m5_MainActivity_nativeM4Diagnostics(JNIEnv *, jobject);
extern "C" JNIEXPORT void JNICALL Java_org_boxdroid_m5_MainActivity_nativeM4Shutdown(JNIEnv *, jobject);

extern "C" bool boxdroid_android_present_rgba(const uint8_t *, uint32_t,
                                                uint32_t, uint32_t);

extern "C" bool boxdroid_android_present_rgba(const uint8_t *pixels,
                                                uint32_t width,
                                                uint32_t height,
                                                uint32_t stride) {
    return presentFrame(true, pixels, width, height, stride);
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_boxdroid_m5_MainActivity_nativeM4SurfaceCreated(JNIEnv *env, jobject, jobject surface, jint width, jint height, jint generation) {
    const bool ok = createSurface(env, surface, static_cast<uint32_t>(std::max(width, 1)),
        static_cast<uint32_t>(std::max(height, 1)), static_cast<uint32_t>(generation));
    log(ok ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR, std::string("M4_SURFACE_CREATED result=") + (ok ? "PASS" : "FAIL") + " generation=" + std::to_string(generation));
    return ok ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_boxdroid_m5_MainActivity_nativeM4SurfaceChanged(JNIEnv *, jobject, jint width, jint height) {
    const bool ok = resizeSurface(static_cast<uint32_t>(std::max(width, 1)), static_cast<uint32_t>(std::max(height, 1)));
    log(ok ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR, std::string("M4_SURFACE_CHANGED result=") + (ok ? "PASS" : "FAIL"));
    return ok ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT jboolean JNICALL
Java_org_boxdroid_m5_MainActivity_nativeM4PresentFrame(JNIEnv *, jobject) {
    return presentFrame() ? JNI_TRUE : JNI_FALSE;
}

extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_m5_MainActivity_nativeM4SurfaceDestroyed(JNIEnv *, jobject) {
    destroySurface();
}

extern "C" JNIEXPORT jstring JNICALL
Java_org_boxdroid_m5_MainActivity_nativeM4Diagnostics(JNIEnv *env, jobject) {
    const std::string result = diagnostics();
    log(ANDROID_LOG_INFO, "M4_DIAGNOSTICS=" + result);
    return env->NewStringUTF(result.c_str());
}

extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_m5_MainActivity_nativeM4Shutdown(JNIEnv *, jobject) {
    destroySurface();
    if (p.device) {
        vkDeviceWaitIdle(p.device);
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
    log(ANDROID_LOG_INFO, "VULKAN_SHUTDOWN_CLEAN instance=destroyed device=destroyed");
}
