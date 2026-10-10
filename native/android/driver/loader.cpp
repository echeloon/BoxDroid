#define VK_NO_PROTOTYPES
#include <vulkan/vulkan.h>
#include <adrenotools/driver.h>
#include <android/log.h>
#include <jni.h>
#include <dlfcn.h>
#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

static void *loader;
static PFN_vkGetInstanceProcAddr proc;
static std::string error;
static std::string directory;

extern "C" void boxdroid_driver_diagnostic(VkInstance instance, VkPhysicalDevice gpu, const char *consumer) {
    auto properties = reinterpret_cast<PFN_vkGetPhysicalDeviceProperties>(proc(instance, "vkGetPhysicalDeviceProperties"));
    VkPhysicalDeviceProperties p{};
    properties(gpu, &p);
    VkPhysicalDeviceDriverProperties driver{}; driver.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES;
    auto props2 = reinterpret_cast<PFN_vkGetPhysicalDeviceProperties2>(proc(instance, "vkGetPhysicalDeviceProperties2"));
    auto enumerate = reinterpret_cast<PFN_vkEnumerateDeviceExtensionProperties>(proc(instance, "vkEnumerateDeviceExtensionProperties"));
    uint32_t count = 0;
    enumerate(gpu, nullptr, &count, nullptr);
    std::vector<VkExtensionProperties> extensions(count);
    enumerate(gpu, nullptr, &count, extensions.data());
    bool supported = p.apiVersion >= VK_API_VERSION_1_2;
    for (const auto &ext : extensions) if (std::string(ext.extensionName) == VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME) supported = true;
    if (props2 && supported) {
        VkPhysicalDeviceProperties2 p2{}; p2.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
        p2.pNext = &driver;
        props2(gpu, &p2);
    }
    __android_log_print(ANDROID_LOG_INFO, "BoxDroid-Driver",
        "VULKAN_DRIVER consumer=%s mode=CUSTOM device=%s vendor=0x%04x deviceID=0x%04x driverVersion=%u api=%u driverName=%s driverInfo=%s driverID=%u path=%s",
        consumer, p.deviceName, p.vendorID, p.deviceID, p.driverVersion, p.apiVersion,
        driver.driverName, driver.driverInfo, driver.driverID, directory.c_str());
}

extern "C" void *boxdroid_driver_proc() { return reinterpret_cast<void *>(proc); }

// One selection per process. Keep the isolated loader alive until process exit.
extern "C" const char *boxdroid_driver_configure(const char *hooks, const char *dir, const char *name, const char *tmp) {
    if (loader) return "Driver already configured; restart emulator process";
    directory = std::string(dir) + "/";
    loader = adrenotools_open_libvulkan(RTLD_NOW | RTLD_LOCAL, ADRENOTOOLS_DRIVER_CUSTOM,
        tmp, hooks, directory.c_str(), name, nullptr, nullptr);
    if (!loader) {
        const char *detail = dlerror();
        error = std::string("Custom Vulkan loader failed: ") + (detail ? detail : "namespace/hook initialization failed");
        return error.c_str();
    }
    proc = reinterpret_cast<PFN_vkGetInstanceProcAddr>(dlsym(loader, "vkGetInstanceProcAddr"));
    if (!proc) return "Custom loader has no vkGetInstanceProcAddr";
    auto create = reinterpret_cast<PFN_vkCreateInstance>(proc(nullptr, "vkCreateInstance"));
    if (!create) return "Custom loader has no vkCreateInstance";
    VkApplicationInfo app{}; app.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app.pApplicationName = "BoxDroid driver validation";
    app.apiVersion = VK_API_VERSION_1_1;
    VkInstanceCreateInfo info{}; info.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    info.pApplicationInfo = &app;
    VkInstance instance{};
    VkResult result = create(&info, nullptr, &instance);
    if (result != VK_SUCCESS) { error = "Custom vkCreateInstance failed: " + std::to_string(result); return error.c_str(); }
    auto destroy = reinterpret_cast<PFN_vkDestroyInstance>(proc(instance, "vkDestroyInstance"));
    auto enumerate = reinterpret_cast<PFN_vkEnumeratePhysicalDevices>(proc(instance, "vkEnumeratePhysicalDevices"));
    uint32_t count = 0;
    result = enumerate(instance, &count, nullptr);
    if (result != VK_SUCCESS || !count) { destroy(instance, nullptr); return "Custom driver exposes no Vulkan physical devices"; }
    std::vector<VkPhysicalDevice> devices(count);
    result = enumerate(instance, &count, devices.data());
    bool mapped = false;
    std::ifstream maps("/proc/self/maps");
    std::string line;
    struct stat imported{};
    if (stat((directory + name).c_str(), &imported) == 0) {
        while (std::getline(maps, line)) {
            unsigned int deviceMajor = 0, deviceMinor = 0;
            unsigned long long inode = 0;
            if (sscanf(line.c_str(), "%*s %*s %*s %x:%x %llu", &deviceMajor, &deviceMinor, &inode) == 3 &&
                inode == imported.st_ino && deviceMajor == major(imported.st_dev) && deviceMinor == minor(imported.st_dev)) {
                mapped = true;
                __android_log_print(ANDROID_LOG_INFO, "BoxDroid-Driver", "CUSTOM_LIBRARY_MAP %s", line.c_str());
                break;
            }
        }
    }
    if (!mapped || result != VK_SUCCESS) { destroy(instance, nullptr); return "Custom library was not mapped; rejected silent system fallback"; }
    auto queues = reinterpret_cast<PFN_vkGetPhysicalDeviceQueueFamilyProperties>(proc(instance, "vkGetPhysicalDeviceQueueFamilyProperties"));
    auto createDevice = reinterpret_cast<PFN_vkCreateDevice>(proc(instance, "vkCreateDevice"));
    auto deviceProc = reinterpret_cast<PFN_vkGetDeviceProcAddr>(proc(instance, "vkGetDeviceProcAddr"));
    bool ready = false;
    for (auto gpu : devices) {
        uint32_t n = 0; queues(gpu, &n, nullptr);
        std::vector<VkQueueFamilyProperties> families(n); queues(gpu, &n, families.data());
        for (uint32_t i = 0; i < n; ++i) {
            if (!families[i].queueCount || !(families[i].queueFlags & VK_QUEUE_GRAPHICS_BIT)) continue;
            float priority = 1;
            VkDeviceQueueCreateInfo queue{}; queue.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
            queue.queueFamilyIndex = i; queue.queueCount = 1; queue.pQueuePriorities = &priority;
            VkDeviceCreateInfo ci{}; ci.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO; ci.queueCreateInfoCount = 1; ci.pQueueCreateInfos = &queue;
            VkDevice device{};
            result = createDevice(gpu, &ci, nullptr, &device);
            if (result == VK_SUCCESS) {
                boxdroid_driver_diagnostic(instance, gpu, "probe");
                reinterpret_cast<PFN_vkDestroyDevice>(deviceProc(device, "vkDestroyDevice"))(device, nullptr);
                ready = true;
            }
            break;
        }
        if (ready) break;
    }
    destroy(instance, nullptr);
    if (!ready) { error = "Custom vkCreateDevice failed: " + std::to_string(result); return error.c_str(); }
    __android_log_print(ANDROID_LOG_INFO, "BoxDroid-Driver", "CUSTOM_LOADER_READY mapped=%s%s", directory.c_str(), name);
    return "";
}

extern "C" JNIEXPORT jstring JNICALL Java_org_boxdroid_GraphicsDriverProbe_nativeProbe(JNIEnv *env, jclass, jstring hooks, jstring dir, jstring name, jstring tmp) {
    const char *h = env->GetStringUTFChars(hooks, nullptr), *d = env->GetStringUTFChars(dir, nullptr),
        *n = env->GetStringUTFChars(name, nullptr), *t = env->GetStringUTFChars(tmp, nullptr);
    std::string result = boxdroid_driver_configure(h, d, n, t);
    env->ReleaseStringUTFChars(hooks, h); env->ReleaseStringUTFChars(dir, d);
    env->ReleaseStringUTFChars(name, n); env->ReleaseStringUTFChars(tmp, t);
    return env->NewStringUTF(result.c_str());
}
