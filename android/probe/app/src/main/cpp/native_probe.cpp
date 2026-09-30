#define VK_USE_PLATFORM_ANDROID_KHR 1
#include <jni.h>
#include <android/log.h>
#include <android/native_window.h>
#include <android/native_window_jni.h>
#include <android/sharedmem.h>
#include <vulkan/vulkan.h>
#include <vulkan/vulkan_android.h>

#include <sys/mman.h>
#include <sys/syscall.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/utsname.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#include <algorithm>
#include <array>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

#ifndef MFD_CLOEXEC
#define MFD_CLOEXEC 0x0001U
#endif

namespace {
constexpr char kTag[] = "BoxDroidM0";
constexpr uint32_t kCodeResult = 0x0000beefu;

void logLine(int priority, const std::string &s) {
    __android_log_write(priority, kTag, s.c_str());
}

std::string quote(const std::string &s) {
    std::ostringstream o;
    o << '"';
    for (unsigned char c : s) {
        switch (c) {
            case '"': o << "\\\""; break;
            case '\\': o << "\\\\"; break;
            case '\b': o << "\\b"; break;
            case '\f': o << "\\f"; break;
            case '\n': o << "\\n"; break;
            case '\r': o << "\\r"; break;
            case '\t': o << "\\t"; break;
            default:
                if (c < 0x20) {
                    const char *hex = "0123456789abcdef";
                    o << "\\u00" << hex[c >> 4] << hex[c & 15];
                } else o << static_cast<char>(c);
        }
    }
    o << '"';
    return o.str();
}

const char *status(bool ok) { return ok ? "PASS" : "FAIL"; }

const char *vkResultName(VkResult r) {
    switch (r) {
        case VK_SUCCESS: return "VK_SUCCESS";
        case VK_NOT_READY: return "VK_NOT_READY";
        case VK_TIMEOUT: return "VK_TIMEOUT";
        case VK_EVENT_SET: return "VK_EVENT_SET";
        case VK_EVENT_RESET: return "VK_EVENT_RESET";
        case VK_INCOMPLETE: return "VK_INCOMPLETE";
        case VK_ERROR_OUT_OF_HOST_MEMORY: return "VK_ERROR_OUT_OF_HOST_MEMORY";
        case VK_ERROR_OUT_OF_DEVICE_MEMORY: return "VK_ERROR_OUT_OF_DEVICE_MEMORY";
        case VK_ERROR_INITIALIZATION_FAILED: return "VK_ERROR_INITIALIZATION_FAILED";
        case VK_ERROR_DEVICE_LOST: return "VK_ERROR_DEVICE_LOST";
        case VK_ERROR_MEMORY_MAP_FAILED: return "VK_ERROR_MEMORY_MAP_FAILED";
        case VK_ERROR_LAYER_NOT_PRESENT: return "VK_ERROR_LAYER_NOT_PRESENT";
        case VK_ERROR_EXTENSION_NOT_PRESENT: return "VK_ERROR_EXTENSION_NOT_PRESENT";
        case VK_ERROR_FEATURE_NOT_PRESENT: return "VK_ERROR_FEATURE_NOT_PRESENT";
        case VK_ERROR_INCOMPATIBLE_DRIVER: return "VK_ERROR_INCOMPATIBLE_DRIVER";
        case VK_ERROR_TOO_MANY_OBJECTS: return "VK_ERROR_TOO_MANY_OBJECTS";
        case VK_ERROR_FORMAT_NOT_SUPPORTED: return "VK_ERROR_FORMAT_NOT_SUPPORTED";
        case VK_ERROR_SURFACE_LOST_KHR: return "VK_ERROR_SURFACE_LOST_KHR";
        case VK_ERROR_NATIVE_WINDOW_IN_USE_KHR: return "VK_ERROR_NATIVE_WINDOW_IN_USE_KHR";
        case VK_SUBOPTIMAL_KHR: return "VK_SUBOPTIMAL_KHR";
        case VK_ERROR_OUT_OF_DATE_KHR: return "VK_ERROR_OUT_OF_DATE_KHR";
        case VK_ERROR_VALIDATION_FAILED_EXT: return "VK_ERROR_VALIDATION_FAILED_EXT";
        default: return "VK_RESULT_UNKNOWN";
    }
}

std::string vkStep(const char *name, VkResult r, const std::string &detail = "") {
    std::ostringstream o;
    o << "{\"name\":" << quote(name) << ",\"status\":" << quote(status(r == VK_SUCCESS))
      << ",\"vk_result\":" << r << ",\"vk_result_name\":" << quote(vkResultName(r));
    if (!detail.empty()) o << ",\"detail\":" << quote(detail);
    o << '}';
    return o.str();
}

std::string errnoResult(const char *name, bool ok, int e, const std::string &details) {
    std::ostringstream o;
    o << "{\"name\":" << quote(name) << ",\"status\":" << quote(status(ok))
      << ",\"errno\":" << (ok ? 0 : e) << ",\"errno_name\":"
      << quote(ok ? "0" : strerror(e)) << ",\"details\":" << quote(details) << '}';
    return o.str();
}

std::string stringsJson(const std::vector<std::string> &values) {
    std::ostringstream o;
    o << '[';
    for (size_t i = 0; i < values.size(); ++i) {
        if (i) o << ',';
        o << quote(values[i]);
    }
    o << ']';
    return o.str();
}

std::string versionString(uint32_t v) {
    std::ostringstream o;
    o << VK_VERSION_MAJOR(v) << '.' << VK_VERSION_MINOR(v) << '.' << VK_VERSION_PATCH(v);
    return o.str();
}

struct Probe {
    std::string path;
    std::string deviceJson = "{}";
    std::string memoryJson = "{}";
    std::string vulkanJson = "{}";
    std::string presentationJson = "{\"status\":\"UNKNOWN\",\"steps\":[]}";
    std::string surfaceCapabilitiesJson = "{}";
    std::string surfaceFormatsJson = "[]";
    std::string surfacePresentModesJson = "[]";
    std::string compatibilityJson = "{}";
    std::vector<std::string> presentationSteps;
    std::vector<std::string> memoryChecks;
    long pageSize = 0;
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
    uint32_t recreationCount = 0;
    uint32_t surfaceCreationCount = 0;
    uint32_t surfaceDestructionCount = 0;
    uint32_t swapchainDestructionCount = 0;
    uint32_t successfulFrames = 0;
    uint32_t loaderApiVersion = VK_API_VERSION_1_0;
    bool xemuVk11 = false;
    bool vkCreateOk = false;
    bool androidSurfaceExt = false;
    bool surfaceAvailable = false;
    bool swapchainTransferDst = false;
    bool currentRequiredFeatures = false;
    bool currentRequiredFdExts = false;
    bool graphicsComputeQueue = false;
    bool fdMemoryExport = false;
    bool fdSemaphoreExport = false;
    bool syncFdSemaphoreExport = false;
    size_t selectedDeviceIndex = 0;
};

Probe g;
PFN_vkEnumerateInstanceVersion pEnumerateInstanceVersion = nullptr;
PFN_vkGetPhysicalDeviceProperties2 pGetPhysicalDeviceProperties2 = nullptr;
PFN_vkGetPhysicalDeviceImageFormatProperties2 pGetPhysicalDeviceImageFormatProperties2 = nullptr;
PFN_vkGetPhysicalDeviceExternalSemaphoreProperties pGetPhysicalDeviceExternalSemaphoreProperties = nullptr;

void recordVk(const char *name, VkResult r, const std::string &detail = "") {
    std::string v = vkStep(name, r, detail);
    g.presentationSteps.emplace_back(v);
    logLine(r == VK_SUCCESS ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR,
            std::string(name) + ": " + vkResultName(r) + " (" + std::to_string(r) + ")" +
            (detail.empty() ? "" : " " + detail));
}

void recordStatus(const char *name, bool ok, const std::string &detail) {
    std::ostringstream o;
    o << "{\"name\":" << quote(name) << ",\"status\":" << quote(status(ok))
      << ",\"detail\":" << quote(detail) << '}';
    g.presentationSteps.emplace_back(o.str());
    logLine(ok ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR,
            std::string(name) + ": " + status(ok) + " " + detail);
}

bool has(const std::vector<std::string> &v, const char *name) {
    return std::find(v.begin(), v.end(), name) != v.end();
}

std::vector<std::string> enumerateInstanceExtensions() {
    uint32_t n = 0;
    VkResult r = vkEnumerateInstanceExtensionProperties(nullptr, &n, nullptr);
    if (r != VK_SUCCESS) return {};
    std::vector<VkExtensionProperties> p(n);
    r = vkEnumerateInstanceExtensionProperties(nullptr, &n, p.data());
    if (r != VK_SUCCESS && r != VK_INCOMPLETE) return {};
    std::vector<std::string> out;
    for (const auto &x : p) out.emplace_back(x.extensionName);
    return out;
}

std::vector<std::string> enumerateDeviceExtensions(VkPhysicalDevice d) {
    uint32_t n = 0;
    VkResult r = vkEnumerateDeviceExtensionProperties(d, nullptr, &n, nullptr);
    if (r != VK_SUCCESS) return {};
    std::vector<VkExtensionProperties> p(n);
    r = vkEnumerateDeviceExtensionProperties(d, nullptr, &n, p.data());
    if (r != VK_SUCCESS && r != VK_INCOMPLETE) return {};
    std::vector<std::string> out;
    for (const auto &x : p) out.emplace_back(x.extensionName);
    return out;
}

std::string formatFlags(VkFormatFeatureFlags f) {
    std::vector<std::string> a;
    const std::array<std::pair<VkFormatFeatureFlags, const char *>, 15> known = {{
        {VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT, "sampled_image"},
        {VK_FORMAT_FEATURE_STORAGE_IMAGE_BIT, "storage_image"},
        {VK_FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT, "storage_image_atomic"},
        {VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT, "color_attachment"},
        {VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT, "color_attachment_blend"},
        {VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT, "depth_stencil_attachment"},
        {VK_FORMAT_FEATURE_BLIT_SRC_BIT, "blit_src"},
        {VK_FORMAT_FEATURE_BLIT_DST_BIT, "blit_dst"},
        {VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT, "sampled_filter_linear"},
        {VK_FORMAT_FEATURE_TRANSFER_SRC_BIT, "transfer_src"},
        {VK_FORMAT_FEATURE_TRANSFER_DST_BIT, "transfer_dst"},
        {VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT, "vertex_buffer"},
        {VK_FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT, "uniform_texel_buffer"},
        {VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT, "storage_texel_buffer"},
        {VK_FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT, "storage_texel_buffer_atomic"}
    }};
    for (const auto &x : known) if (f & x.first) a.emplace_back(x.second);
    return stringsJson(a);
}

const char *presentModeName(VkPresentModeKHR m) {
    switch (m) {
        case VK_PRESENT_MODE_IMMEDIATE_KHR: return "IMMEDIATE";
        case VK_PRESENT_MODE_MAILBOX_KHR: return "MAILBOX";
        case VK_PRESENT_MODE_FIFO_KHR: return "FIFO";
        case VK_PRESENT_MODE_FIFO_RELAXED_KHR: return "FIFO_RELAXED";
        default: return "OTHER";
    }
}

std::string featureCheck(const char *name, VkBool32 available, bool required, const char *future) {
    std::ostringstream o;
    o << "{\"name\":" << quote(name) << ",\"available\":" << (available ? "true" : "false")
      << ",\"xemu_current\":{\"required\":" << (required ? "true" : "false")
      << ",\"status\":" << quote(required ? status(available) : (available ? "PASS" : "NOT_APPLICABLE"))
      << "},\"android_path\":{\"status\":" << quote(future) << "}}";
    return o.str();
}

std::string extensionCheck(const char *name, bool available, bool requiredCurrent, const char *future, const char *why = "") {
    std::ostringstream o;
    o << "{\"name\":" << quote(name) << ",\"available\":" << (available ? "true" : "false")
      << ",\"xemu_current\":{\"required\":" << (requiredCurrent ? "true" : "false")
      << ",\"status\":" << quote(requiredCurrent ? status(available) : (available ? "PASS" : "NOT_APPLICABLE"))
      << "},\"android_path\":{\"status\":" << quote(future);
    if (*why) o << ",\"reason\":" << quote(why);
    o << "}}";
    return o.str();
}

void executeMemoryChecks() {
    const size_t n = static_cast<size_t>(g.pageSize > 0 ? g.pageSize : 4096);
    struct alignas(4) Code { uint32_t mov; uint32_t ret; } code = {0x5297dde0u, 0xd65f03c0u};
    auto writeCode = [&](void *p) {
        memcpy(p, &code, sizeof(code));
    };
    auto testExec = [&](void *p) -> std::string {
        __builtin___clear_cache(static_cast<char *>(p), static_cast<char *>(p) + sizeof(code));
        using Fn = uint32_t (*)();
        uint32_t got = reinterpret_cast<Fn>(p)();
        return got == kCodeResult ? "PASS" : "FAIL";
    };

    errno = 0;
    void *rw = mmap(nullptr, n, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    int e = errno;
    bool anonRw = rw != MAP_FAILED;
    g.memoryChecks.push_back(errnoResult("anonymous_mmap_rw", anonRw, e,
            "mmap anonymous private, PROT_READ|PROT_WRITE; length=" + std::to_string(n)));
    bool transitionOk = false;
    std::string transitionDetail = "anonymous RW allocation unavailable";
    if (anonRw) {
        memcpy(rw, &code, sizeof(code));
        errno = 0;
        int rc = mprotect(rw, n, PROT_READ | PROT_EXEC);
        e = errno;
        if (rc == 0) {
            std::string execution = testExec(rw);
            transitionOk = execution == "PASS";
            transitionDetail = "RW to RX mprotect succeeded; local AArch64 return-stub=" + execution;
            errno = 0;
            int back = mprotect(rw, n, PROT_READ | PROT_WRITE);
            int backErr = errno;
            g.memoryChecks.push_back(errnoResult("anonymous_rx_to_rw", back == 0, backErr,
                    "mprotect RX to RW"));
        } else {
            transitionDetail = "mprotect RW to RX failed: " + std::string(strerror(e));
        }
        g.memoryChecks.push_back(errnoResult("anonymous_rw_to_rx_and_execute", transitionOk,
                rc == 0 ? 0 : e, transitionDetail));
        munmap(rw, n);
    } else {
        g.memoryChecks.push_back(errnoResult("anonymous_rw_to_rx_and_execute", false, e, transitionDetail));
    }

    errno = 0;
    void *rwx = mmap(nullptr, n, PROT_READ | PROT_WRITE | PROT_EXEC,
                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    e = errno;
    bool rwxOk = rwx != MAP_FAILED;
    if (rwxOk) {
        writeCode(rwx);
        std::string execution = testExec(rwx);
        g.memoryChecks.push_back(errnoResult("anonymous_rwx_mapping_and_execute", execution == "PASS", 0,
                "mmap RWX succeeded; local AArch64 return-stub=" + execution));
        munmap(rwx, n);
    } else {
        g.memoryChecks.push_back(errnoResult("anonymous_rwx_mapping", false, e,
                "mmap anonymous private, PROT_READ|PROT_WRITE|PROT_EXEC; length=" + std::to_string(n)));
    }

    int fd = -1;
    const char *fdMethod = "memfd_create syscall";
#if defined(__NR_memfd_create)
    errno = 0;
    fd = static_cast<int>(syscall(__NR_memfd_create, "boxdroid-m0-jit", MFD_CLOEXEC));
#endif
    e = errno;
    bool ashmem = false;
    if (fd < 0) {
        fdMethod = "ASharedMemory_create fallback";
        errno = 0;
        fd = ASharedMemory_create("boxdroid-m0-jit", n);
        e = errno;
        ashmem = fd >= 0;
    }
    bool fdOk = fd >= 0;
    g.memoryChecks.push_back(errnoResult("shared_executable_memory_fd", fdOk, e,
            std::string("method=") + fdMethod));
    if (fdOk) {
        errno = 0;
        int tr = ashmem ? 0 : ftruncate(fd, static_cast<off_t>(n));
        e = errno;
        bool sized = tr == 0;
        g.memoryChecks.push_back(errnoResult("shared_memory_ftruncate", sized, e,
                ashmem ? "ASharedMemory_create already sized the shared object" : "ftruncate(fd,page_size)"));
        if (sized) {
            errno = 0;
            void *aliasRw = mmap(nullptr, n, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
            e = errno;
            bool rwMap = aliasRw != MAP_FAILED;
            g.memoryChecks.push_back(errnoResult("shared_fd_map_rw", rwMap, e,
                    "mmap MAP_SHARED PROT_READ|PROT_WRITE"));
            errno = 0;
            void *aliasRx = mmap(nullptr, n, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
            e = errno;
            bool rxMap = aliasRx != MAP_FAILED;
            g.memoryChecks.push_back(errnoResult("shared_fd_map_rx", rxMap, e,
                    "mmap same fd MAP_SHARED PROT_READ|PROT_EXEC"));
            bool aliasExec = false;
            if (rwMap && rxMap) {
                writeCode(aliasRw);
                aliasExec = testExec(aliasRx) == "PASS";
            }
            g.memoryChecks.push_back(errnoResult("shared_fd_dual_mapping_execute", aliasExec, 0,
                    rwMap && rxMap ? "write through RW alias, execute local return-stub through RX alias" :
                    "not attempted because one or both aliases could not be mapped"));
            if (rwMap) munmap(aliasRw, n);
            if (rxMap) munmap(aliasRx, n);
        }
        close(fd);
    }

    std::ostringstream o;
    o << "{\"page_size_bytes\":" << n << ",\"checks\":[";
    for (size_t i = 0; i < g.memoryChecks.size(); ++i) {
        if (i) o << ',';
        o << g.memoryChecks[i];
    }
    o << "]}";
    g.memoryJson = o.str();
}

struct DeviceSnapshot {
    VkPhysicalDevice handle = VK_NULL_HANDLE;
    VkPhysicalDeviceProperties props{};
    VkPhysicalDeviceFeatures features{};
    std::vector<std::string> extensions;
    std::string json;
};

std::string limitsJson(const VkPhysicalDeviceLimits &l) {
    std::ostringstream o;
    o << "{\"max_image_dimension_2d\":" << l.maxImageDimension2D
      << ",\"max_image_array_layers\":" << l.maxImageArrayLayers
      << ",\"max_color_attachments\":" << l.maxColorAttachments
      << ",\"max_per_stage_descriptor_sampled_images\":" << l.maxPerStageDescriptorSampledImages
      << ",\"max_descriptor_set_samplers\":" << l.maxDescriptorSetSamplers
      << ",\"max_uniform_buffer_range\":" << l.maxUniformBufferRange
      << ",\"max_storage_buffer_range\":" << l.maxStorageBufferRange
      << ",\"max_push_constants_size\":" << l.maxPushConstantsSize
      << ",\"max_bound_descriptor_sets\":" << l.maxBoundDescriptorSets
      << ",\"max_compute_work_group_invocations\":" << l.maxComputeWorkGroupInvocations
      << ",\"max_compute_work_group_size\":[" << l.maxComputeWorkGroupSize[0] << ','
      << l.maxComputeWorkGroupSize[1] << ',' << l.maxComputeWorkGroupSize[2] << ']'
      << ",\"max_compute_work_group_count\":[" << l.maxComputeWorkGroupCount[0] << ','
      << l.maxComputeWorkGroupCount[1] << ',' << l.maxComputeWorkGroupCount[2] << ']'
      << ",\"max_framebuffer_width\":" << l.maxFramebufferWidth
      << ",\"max_framebuffer_height\":" << l.maxFramebufferHeight
      << ",\"max_sampler_anisotropy\":" << l.maxSamplerAnisotropy
      << ",\"min_uniform_buffer_offset_alignment\":" << l.minUniformBufferOffsetAlignment
      << ",\"non_coherent_atom_size\":" << l.nonCoherentAtomSize
      << ",\"optimal_buffer_copy_offset_alignment\":" << l.optimalBufferCopyOffsetAlignment << '}';
    return o.str();
}

std::string imageFormatsJson(VkPhysicalDevice d) {
    struct F {
        VkFormat fmt;
        const char *name;
        bool sampledTexture;
        bool vertexInput;
        bool colorAttachment;
        bool depthAttachment;
    };
    const F formats[] = {
        // Texture formats are sampled images in Xemu's texture path. Some are
        // converted or used conditionally, so a missing format is diagnostic,
        // not by itself a claim that Xemu cannot start.
        {VK_FORMAT_A1R5G5B5_UNORM_PACK16, "A1R5G5B5_UNORM_PACK16", true, false, false, false},
        {VK_FORMAT_A4R4G4B4_UNORM_PACK16, "A4R4G4B4_UNORM_PACK16", true, false, false, false},
        {VK_FORMAT_B10G11R11_UFLOAT_PACK32, "B10G11R11_UFLOAT_PACK32", false, false, false, false},
        {VK_FORMAT_R8_UNORM, "R8_UNORM", true, true, false, false},
        {VK_FORMAT_R8G8_UNORM, "R8G8_UNORM", true, true, false, false},
        {VK_FORMAT_R8G8B8_UNORM, "R8G8B8_UNORM", false, false, false, false},
        {VK_FORMAT_R8G8B8_SNORM, "R8G8B8_SNORM", true, false, false, false},
        {VK_FORMAT_R8G8B8A8_UNORM, "R8G8B8A8_UNORM", true, true, true, false},
        {VK_FORMAT_B8G8R8A8_UNORM, "B8G8R8A8_UNORM", true, false, false, false},
        {VK_FORMAT_R5G6B5_UNORM_PACK16, "R5G6B5_UNORM_PACK16", true, false, false, false},
        {VK_FORMAT_R16_UNORM, "R16_UNORM", true, false, false, false},
        {VK_FORMAT_R16_SNORM, "R16_SNORM", true, true, false, false},
        {VK_FORMAT_R16G16_SNORM, "R16G16_SNORM", true, true, false, false},
        {VK_FORMAT_R16G16B16_SNORM, "R16G16B16_SNORM", false, true, false, false},
        {VK_FORMAT_R16G16B16A16_SNORM, "R16G16B16A16_SNORM", true, true, false, false},
        {VK_FORMAT_R16_SSCALED, "R16_SSCALED", false, true, false, false},
        {VK_FORMAT_R16G16_SSCALED, "R16G16_SSCALED", false, true, false, false},
        {VK_FORMAT_R16G16B16_SSCALED, "R16G16B16_SSCALED", false, true, false, false},
        {VK_FORMAT_R16G16B16A16_SSCALED, "R16G16B16A16_SSCALED", false, true, false, false},
        {VK_FORMAT_R32_SFLOAT, "R32_SFLOAT", false, true, false, false},
        {VK_FORMAT_R32G32_SFLOAT, "R32G32_SFLOAT", false, true, false, false},
        {VK_FORMAT_R32G32B32_SFLOAT, "R32G32B32_SFLOAT", false, true, false, false},
        {VK_FORMAT_R32G32B32A32_SFLOAT, "R32G32B32A32_SFLOAT", false, true, false, false},
        {VK_FORMAT_R32_SINT, "R32_SINT", false, true, false, false},
        {VK_FORMAT_R32_UINT, "R32_UINT", true, false, false, false},
        {VK_FORMAT_D16_UNORM, "D16_UNORM", false, false, false, true},
        {VK_FORMAT_D24_UNORM_S8_UINT, "D24_UNORM_S8_UINT", false, false, false, true},
        {VK_FORMAT_D32_SFLOAT_S8_UINT, "D32_SFLOAT_S8_UINT", false, false, false, true}
    };
    std::ostringstream o;
    o << '[';
    for (size_t i = 0; i < std::size(formats); ++i) {
        if (i) o << ',';
        VkFormatProperties p{};
        vkGetPhysicalDeviceFormatProperties(d, formats[i].fmt, &p);
        const bool sampled = (p.optimalTilingFeatures & VK_FORMAT_FEATURE_SAMPLED_IMAGE_BIT) != 0;
        const bool vertex = (p.bufferFeatures & VK_FORMAT_FEATURE_VERTEX_BUFFER_BIT) != 0;
        const bool color = (p.optimalTilingFeatures & VK_FORMAT_FEATURE_COLOR_ATTACHMENT_BIT) != 0;
        const bool depth = (p.optimalTilingFeatures & VK_FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT) != 0;
        const bool xemuFormat = formats[i].sampledTexture || formats[i].vertexInput ||
                formats[i].colorAttachment || formats[i].depthAttachment;
        o << "{\"name\":" << quote(formats[i].name) << ",\"format_id\":" << formats[i].fmt
          << ",\"xemu_format\":" << (xemuFormat ? "true" : "false") << ",\"roles\":[";
        bool comma = false;
        auto role = [&](const char *name) {
            if (comma) o << ',';
            o << quote(name);
            comma = true;
        };
        if (formats[i].sampledTexture) role("sampled_texture");
        if (formats[i].vertexInput) role("vertex_input");
        if (formats[i].colorAttachment) role("color_attachment");
        if (formats[i].depthAttachment) role("depth_attachment");
        o << "],\"usage_checks\":{";
        bool checkComma = false;
        auto usageCheck = [&](const char *name, bool applies, bool supported) {
            if (checkComma) o << ',';
            o << quote(name) << ":{\"status\":" << quote(applies ? status(supported) : "NOT_APPLICABLE")
              << ",\"applicable\":" << (applies ? "true" : "false") << '}';
            checkComma = true;
        };
        usageCheck("optimal_sampled_image", formats[i].sampledTexture, sampled);
        usageCheck("vertex_buffer", formats[i].vertexInput, vertex);
        usageCheck("optimal_color_attachment", formats[i].colorAttachment, color);
        usageCheck("optimal_depth_stencil_attachment", formats[i].depthAttachment, depth);
        o << "},\"buffer_features\":" << formatFlags(p.bufferFeatures)
          << ",\"linear_tiling_features\":" << formatFlags(p.linearTilingFeatures)
          << ",\"optimal_tiling_features\":" << formatFlags(p.optimalTilingFeatures) << '}';
    }
    o << ']';
    return o.str();
}

std::string snapshotJson(const DeviceSnapshot &s) {
    std::ostringstream o;
    const VkPhysicalDeviceProperties &p = s.props;
    bool driverPropsSupported = p.apiVersion >= VK_API_VERSION_1_2 ||
            has(s.extensions, VK_KHR_DRIVER_PROPERTIES_EXTENSION_NAME);
    VkPhysicalDeviceDriverProperties driver{};
    driver.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES;
    VkPhysicalDeviceProperties2 props2{};
    props2.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2;
    props2.pNext = driverPropsSupported ? &driver : nullptr;
    if (driverPropsSupported && pGetPhysicalDeviceProperties2) pGetPhysicalDeviceProperties2(s.handle, &props2);
    else driverPropsSupported = false;
    o << "{\"name\":" << quote(p.deviceName) << ",\"vendor_id\":" << p.vendorID
      << ",\"device_id\":" << p.deviceID << ",\"device_type\":" << p.deviceType
      << ",\"api_version_raw\":" << p.apiVersion << ",\"api_version\":" << quote(versionString(p.apiVersion))
      << ",\"driver_version_raw\":" << p.driverVersion
      << ",\"driver_version\":" << quote(std::to_string(p.driverVersion))
      << ",\"driver_version_semantics\":\"raw vendor-specific VkPhysicalDeviceProperties.driverVersion\""
      << ",\"driver_properties_available\":" << (driverPropsSupported ? "true" : "false")
      << ",\"driver_name\":" << quote(driverPropsSupported ? driver.driverName : "")
      << ",\"driver_info\":" << quote(driverPropsSupported ? driver.driverInfo : "")
      << ",\"pipeline_cache_uuid\":";
    std::vector<std::string> uuid;
    for (uint8_t b : p.pipelineCacheUUID) uuid.emplace_back(std::to_string(b));
    o << stringsJson(uuid) << ",\"device_extensions\":" << stringsJson(s.extensions)
      << ",\"queue_families\":[";
    uint32_t count = 0;
    vkGetPhysicalDeviceQueueFamilyProperties(s.handle, &count, nullptr);
    std::vector<VkQueueFamilyProperties> queues(count);
    vkGetPhysicalDeviceQueueFamilyProperties(s.handle, &count, queues.data());
    for (uint32_t i = 0; i < count; ++i) {
        if (i) o << ',';
        o << "{\"index\":" << i << ",\"queue_count\":" << queues[i].queueCount
          << ",\"flags\":" << queues[i].queueFlags
          << ",\"graphics\":" << ((queues[i].queueFlags & VK_QUEUE_GRAPHICS_BIT) ? "true" : "false")
          << ",\"compute\":" << ((queues[i].queueFlags & VK_QUEUE_COMPUTE_BIT) ? "true" : "false")
          << ",\"transfer\":" << ((queues[i].queueFlags & VK_QUEUE_TRANSFER_BIT) ? "true" : "false")
          << ",\"timestamp_valid_bits\":" << queues[i].timestampValidBits << '}';
    }
    o << "],\"limits\":" << limitsJson(p.limits) << ",\"formats\":" << imageFormatsJson(s.handle)
      << ",\"memory\":{";
    VkPhysicalDeviceMemoryProperties m{};
    vkGetPhysicalDeviceMemoryProperties(s.handle, &m);
    o << "\"types\":[";
    for (uint32_t i = 0; i < m.memoryTypeCount; ++i) {
        if (i) o << ',';
        o << "{\"index\":" << i << ",\"heap_index\":" << m.memoryTypes[i].heapIndex
          << ",\"property_flags\":" << m.memoryTypes[i].propertyFlags << '}';
    }
    o << "],\"heaps\":[";
    for (uint32_t i = 0; i < m.memoryHeapCount; ++i) {
        if (i) o << ',';
        o << "{\"index\":" << i << ",\"size_bytes\":" << m.memoryHeaps[i].size
          << ",\"flags\":" << m.memoryHeaps[i].flags << '}';
    }
    o << "]}}";
    return o.str();
}

bool queryFdMemoryExport(VkPhysicalDevice d) {
    VkPhysicalDeviceProperties p{};
    vkGetPhysicalDeviceProperties(d, &p);
    if (p.apiVersion < VK_API_VERSION_1_1) return false;
    VkPhysicalDeviceImageFormatInfo2 in{};
    in.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2;
    in.pNext = nullptr;
    in.format = VK_FORMAT_R8G8B8A8_UNORM;
    in.type = VK_IMAGE_TYPE_2D;
    in.tiling = VK_IMAGE_TILING_OPTIMAL;
    in.usage = VK_IMAGE_USAGE_SAMPLED_BIT | VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    VkPhysicalDeviceExternalImageFormatInfo ext{};
    ext.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO;
    ext.handleType = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT;
    in.pNext = &ext;
    VkExternalImageFormatProperties extOut{};
    extOut.sType = VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES;
    VkImageFormatProperties2 out{};
    out.sType = VK_STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2;
    out.pNext = &extOut;
    if (!pGetPhysicalDeviceImageFormatProperties2) return false;
    VkResult r = pGetPhysicalDeviceImageFormatProperties2(d, &in, &out);
    return r == VK_SUCCESS &&
           (extOut.externalMemoryProperties.externalMemoryFeatures & VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT);
}

bool queryFdSemaphoreExport(VkPhysicalDevice d) {
    VkPhysicalDeviceProperties p{};
    vkGetPhysicalDeviceProperties(d, &p);
    if (p.apiVersion < VK_API_VERSION_1_1) return false;
    VkPhysicalDeviceExternalSemaphoreInfo in{};
    in.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO;
    in.handleType = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_OPAQUE_FD_BIT;
    VkExternalSemaphoreProperties props{};
    props.sType = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES;
    if (!pGetPhysicalDeviceExternalSemaphoreProperties) return false;
    pGetPhysicalDeviceExternalSemaphoreProperties(d, &in, &props);
    return (props.externalSemaphoreFeatures & VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT) != 0;
}

bool querySyncFdSemaphoreExport(VkPhysicalDevice d) {
    VkPhysicalDeviceProperties p{};
    vkGetPhysicalDeviceProperties(d, &p);
    if (p.apiVersion < VK_API_VERSION_1_1 || !pGetPhysicalDeviceExternalSemaphoreProperties) return false;
    VkPhysicalDeviceExternalSemaphoreInfo in{};
    in.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO;
    in.handleType = VK_EXTERNAL_SEMAPHORE_HANDLE_TYPE_SYNC_FD_BIT;
    VkExternalSemaphoreProperties props{};
    props.sType = VK_STRUCTURE_TYPE_EXTERNAL_SEMAPHORE_PROPERTIES;
    pGetPhysicalDeviceExternalSemaphoreProperties(d, &in, &props);
    return (props.externalSemaphoreFeatures & VK_EXTERNAL_SEMAPHORE_FEATURE_EXPORTABLE_BIT) != 0;
}

void runVulkanInventory() {
    uint32_t loaderVersion = VK_API_VERSION_1_0;
    pEnumerateInstanceVersion = reinterpret_cast<PFN_vkEnumerateInstanceVersion>(
            vkGetInstanceProcAddr(VK_NULL_HANDLE, "vkEnumerateInstanceVersion"));
    VkResult enumerateVersion = pEnumerateInstanceVersion ? pEnumerateInstanceVersion(&loaderVersion) : VK_ERROR_EXTENSION_NOT_PRESENT;
    if (enumerateVersion != VK_SUCCESS) loaderVersion = VK_API_VERSION_1_0;
    g.loaderApiVersion = loaderVersion;
    std::vector<std::string> instanceExts = enumerateInstanceExtensions();
    g.androidSurfaceExt = has(instanceExts, VK_KHR_ANDROID_SURFACE_EXTENSION_NAME);
    bool surfaceExt = has(instanceExts, VK_KHR_SURFACE_EXTENSION_NAME);

    std::vector<const char *> enabled;
    if (surfaceExt) enabled.push_back(VK_KHR_SURFACE_EXTENSION_NAME);
    if (g.androidSurfaceExt) enabled.push_back(VK_KHR_ANDROID_SURFACE_EXTENSION_NAME);

    VkApplicationInfo app{};
    app.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app.pApplicationName = "BoxDroid M0 Probe";
    app.applicationVersion = VK_MAKE_VERSION(0, 1, 0);
    app.pEngineName = "BoxDroid capability probe";
    app.engineVersion = VK_MAKE_VERSION(0, 1, 0);
    app.apiVersion = std::min(loaderVersion, VK_API_VERSION_1_1);

    VkInstanceCreateInfo ci{};
    ci.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    ci.pApplicationInfo = &app;
    ci.enabledExtensionCount = static_cast<uint32_t>(enabled.size());
    ci.ppEnabledExtensionNames = enabled.data();
    VkResult create = vkCreateInstance(&ci, nullptr, &g.instance);
    g.vkCreateOk = create == VK_SUCCESS;
    g.xemuVk11 = loaderVersion >= VK_API_VERSION_1_1;
    logLine(create == VK_SUCCESS ? ANDROID_LOG_INFO : ANDROID_LOG_ERROR,
            std::string("vkCreateInstance: ") + vkResultName(create) + " (" + std::to_string(create) + ")");

    if (!g.vkCreateOk) {
        g.vulkanJson = "{\"loader_api_version_raw\":" + std::to_string(loaderVersion) +
            ",\"loader_api_version\":" + quote(versionString(loaderVersion)) +
            ",\"instance_extensions\":" + stringsJson(instanceExts) +
            ",\"vk_create_instance\":" + vkStep("vkCreateInstance", create) +
            ",\"physical_devices\":[],\"xemu_requirements\":{}}";
        return;
    }
    pGetPhysicalDeviceProperties2 = reinterpret_cast<PFN_vkGetPhysicalDeviceProperties2>(
            vkGetInstanceProcAddr(g.instance, "vkGetPhysicalDeviceProperties2"));
    pGetPhysicalDeviceImageFormatProperties2 = reinterpret_cast<PFN_vkGetPhysicalDeviceImageFormatProperties2>(
            vkGetInstanceProcAddr(g.instance, "vkGetPhysicalDeviceImageFormatProperties2"));
    pGetPhysicalDeviceExternalSemaphoreProperties = reinterpret_cast<PFN_vkGetPhysicalDeviceExternalSemaphoreProperties>(
            vkGetInstanceProcAddr(g.instance, "vkGetPhysicalDeviceExternalSemaphoreProperties"));

    uint32_t count = 0;
    VkResult r = vkEnumeratePhysicalDevices(g.instance, &count, nullptr);
    std::vector<VkPhysicalDevice> physicals;
    if (r == VK_SUCCESS && count) {
        physicals.resize(count);
        r = vkEnumeratePhysicalDevices(g.instance, &count, physicals.data());
        if (r != VK_SUCCESS && r != VK_INCOMPLETE) physicals.clear();
    }

    std::vector<DeviceSnapshot> snapshots;
    for (VkPhysicalDevice d : physicals) {
        DeviceSnapshot s;
        s.handle = d;
        vkGetPhysicalDeviceProperties(d, &s.props);
        vkGetPhysicalDeviceFeatures(d, &s.features);
        s.extensions = enumerateDeviceExtensions(d);
        s.json = snapshotJson(s);
        snapshots.emplace_back(std::move(s));
    }

    if (!snapshots.empty()) {
        auto score = [](const DeviceSnapshot &s) {
            const auto &f = s.features;
            return (f.depthClamp && f.fillModeNonSolid && f.geometryShader && f.occlusionQueryPrecise &&
                    f.shaderClipDistance && f.shaderTessellationAndGeometryPointSize ? 100 : 0) +
                   (s.props.apiVersion >= VK_API_VERSION_1_1 ? 10 : 0);
        };
        auto selected = std::max_element(snapshots.begin(), snapshots.end(),
                [&](const DeviceSnapshot &a, const DeviceSnapshot &b) { return score(a) < score(b); });
        g.selectedDeviceIndex = static_cast<size_t>(std::distance(snapshots.begin(), selected));
        g.gpu = selected->handle;
        const auto &s = *selected;
        g.currentRequiredFeatures = s.features.depthClamp && s.features.fillModeNonSolid &&
                s.features.geometryShader && s.features.occlusionQueryPrecise && s.features.shaderClipDistance &&
                s.features.shaderTessellationAndGeometryPointSize;
        bool extMem = has(s.extensions, VK_KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME);
        bool extSem = has(s.extensions, VK_KHR_EXTERNAL_SEMAPHORE_FD_EXTENSION_NAME);
        g.fdMemoryExport = extMem && queryFdMemoryExport(s.handle);
        g.fdSemaphoreExport = extSem && queryFdSemaphoreExport(s.handle);
        g.syncFdSemaphoreExport = extSem && querySyncFdSemaphoreExport(s.handle);
        // Current Xemu gates on the two extension names. The explicit export
        // property queries below are extra interop evidence, not that gate.
        g.currentRequiredFdExts = extMem && extSem;
        g.xemuVk11 = g.xemuVk11 && s.props.apiVersion >= VK_API_VERSION_1_1;

        uint32_t qn = 0;
        vkGetPhysicalDeviceQueueFamilyProperties(s.handle, &qn, nullptr);
        std::vector<VkQueueFamilyProperties> q(qn);
        vkGetPhysicalDeviceQueueFamilyProperties(s.handle, &qn, q.data());
        for (uint32_t i = 0; i < qn; ++i) {
            if (q[i].queueCount && (q[i].queueFlags & (VK_QUEUE_GRAPHICS_BIT | VK_QUEUE_COMPUTE_BIT)) ==
                    (VK_QUEUE_GRAPHICS_BIT | VK_QUEUE_COMPUTE_BIT)) {
                g.queueFamily = i;
                g.graphicsComputeQueue = true;
                break;
            }
        }

        const VkPhysicalDeviceFeatures &f = s.features;
        std::ostringstream req;
        req << "{\"api_version_1_1\":{\"required\":true,\"available\":" << (s.props.apiVersion >= VK_API_VERSION_1_1 ? "true" : "false")
            << ",\"status\":" << quote(status(s.props.apiVersion >= VK_API_VERSION_1_1)) << "},\"features\":["
            << featureCheck("depthClamp", f.depthClamp, true, status(f.depthClamp)) << ','
            << featureCheck("fillModeNonSolid", f.fillModeNonSolid, true, status(f.fillModeNonSolid)) << ','
            << featureCheck("geometryShader", f.geometryShader, true, status(f.geometryShader)) << ','
            << featureCheck("occlusionQueryPrecise", f.occlusionQueryPrecise, true, status(f.occlusionQueryPrecise)) << ','
            << featureCheck("shaderClipDistance", f.shaderClipDistance, true, status(f.shaderClipDistance)) << ','
            << featureCheck("shaderTessellationAndGeometryPointSize", f.shaderTessellationAndGeometryPointSize, true, status(f.shaderTessellationAndGeometryPointSize)) << ','
            << featureCheck("samplerAnisotropy", f.samplerAnisotropy, false, "NOT_APPLICABLE") << ','
            << featureCheck("wideLines", f.wideLines, false, "NOT_APPLICABLE") << "],\"device_extensions\":["
            << extensionCheck(VK_KHR_EXTERNAL_MEMORY_FD_EXTENSION_NAME, extMem, true, "NOT_APPLICABLE",
                    "Native Android presentation need not export renderer images to desktop OpenGL") << ','
            << extensionCheck(VK_KHR_EXTERNAL_SEMAPHORE_FD_EXTENSION_NAME, extSem, true, "NOT_APPLICABLE",
                    "Native Android presentation can synchronize without desktop GL semaphore interop; opaque-FD export property is reported separately") << ','
            << extensionCheck(VK_KHR_SWAPCHAIN_EXTENSION_NAME, has(s.extensions, VK_KHR_SWAPCHAIN_EXTENSION_NAME), false,
                    has(s.extensions, VK_KHR_SWAPCHAIN_EXTENSION_NAME) ? "PASS" : "FAIL",
                    "Required by the standalone Android presenter") << "],\"external_fd\":{\"opaque_fd_image_export\":"
            << quote(extMem ? status(g.fdMemoryExport) : "UNKNOWN") << ",\"opaque_fd_semaphore_export\":"
            << quote(extSem ? status(g.fdSemaphoreExport) : "UNKNOWN") << ",\"sync_fd_semaphore_export\":"
            << quote(extSem ? status(g.syncFdSemaphoreExport) : "UNKNOWN") << "},\"graphics_compute_queue\":{\"status\":"
            << quote(status(g.graphicsComputeQueue)) << ",\"family_index\":" <<
                (g.graphicsComputeQueue ? std::to_string(g.queueFamily) : "null") << "}}";
        g.compatibilityJson = req.str();
    } else {
        g.compatibilityJson = "{\"api_version_1_1\":{\"status\":\"UNKNOWN\"},\"features\":[],\"device_extensions\":[]}";
    }

    std::ostringstream devices;
    devices << '[';
    for (size_t i = 0; i < snapshots.size(); ++i) {
        if (i) devices << ',';
        devices << snapshots[i].json;
    }
    devices << ']';

    std::ostringstream v;
    v << "{\"loader_api_version_raw\":" << loaderVersion
      << ",\"loader_api_version\":" << quote(versionString(loaderVersion))
      << ",\"instance_extensions\":" << stringsJson(instanceExts)
      << ",\"instance_extension_checks\":["
      << extensionCheck(VK_KHR_SURFACE_EXTENSION_NAME, surfaceExt, false, surfaceExt ? "PASS" : "FAIL", "Android WSI prerequisite") << ','
      << extensionCheck(VK_KHR_ANDROID_SURFACE_EXTENSION_NAME, g.androidSurfaceExt, false, g.androidSurfaceExt ? "PASS" : "FAIL", "Required to create VkSurfaceKHR from ANativeWindow")
      << "],\"vk_create_instance\":" << vkStep("vkCreateInstance", create)
      << ",\"physical_device_count\":" << snapshots.size()
      << ",\"selected_device_index\":" << (snapshots.empty() ? "null" : std::to_string(g.selectedDeviceIndex))
      << ",\"physical_devices\":" << devices.str()
      << ",\"xemu_requirements\":" << g.compatibilityJson << '}';
    g.vulkanJson = v.str();
}

void updateCompatibilityPresentation() {
    std::ostringstream o;
    o << "{\"current_xemu\":{\"vulkan_1_1\":" << quote(g.xemuVk11 ? "PASS" : "FAIL")
      << ",\"required_physical_features\":" << quote(g.currentRequiredFeatures ? "PASS" : "FAIL")
      << ",\"required_external_fd_extensions\":" << quote(g.currentRequiredFdExts ? "PASS" : "FAIL")
      << ",\"graphics_compute_queue\":" << quote(g.graphicsComputeQueue ? "PASS" : "FAIL")
      << "},\"future_android_native_path\":{\"android_surface\":" << quote(g.androidSurfaceExt ? "PASS" : "FAIL")
      << ",\"presentation\":" << quote(g.successfulFrames ? "PASS" : "UNKNOWN")
      << ",\"desktop_gl_external_fd_interop\":\"NOT_APPLICABLE\",\"executable_memory\":\"see executable_memory.checks\"}}";
    g.compatibilityJson = o.str();
}

void writeReport() {
    updateCompatibilityPresentation();
    struct utsname u{};
    uname(&u);
    time_t now = time(nullptr);
    struct tm utc{};
    gmtime_r(&now, &utc);
    char timestamp[32];
    strftime(timestamp, sizeof(timestamp), "%Y-%m-%dT%H:%M:%SZ", &utc);
    std::ostringstream report;
    report << "{\n  \"schema_version\": 1,\n  \"generated_utc\": " << quote(timestamp)
           << ",\n  \"probe\": {\"name\": \"BoxDroid M0 capability probe\", \"version\": \"0.1.0\"},"
           << "\n  \"device\": " << g.deviceJson
           << ",\n  \"cpu\": {\"machine\": " << quote(u.machine)
           << ", \"sysname\": " << quote(u.sysname) << ", \"release\": " << quote(u.release) << "},"
           << "\n  \"memory\": {\"page_size_bytes\": " << g.pageSize << "},"
           << "\n  \"vulkan\": " << g.vulkanJson
           << ",\n  \"presentation\": " << g.presentationJson
           << ",\n  \"executable_memory\": " << g.memoryJson
           << ",\n  \"xemu_compatibility\": " << g.compatibilityJson << "\n}\n";
    std::ofstream out(g.path, std::ios::binary | std::ios::trunc);
    if (!out) {
        logLine(ANDROID_LOG_ERROR, "Cannot write JSON report at " + g.path + ": " + strerror(errno));
        return;
    }
    out << report.str();
    out.flush();
    logLine(ANDROID_LOG_INFO, "JSON_REPORT_PATH=" + g.path);
    logLine(ANDROID_LOG_INFO, "M0 summary: Vulkan=" +
            std::string(g.vkCreateOk ? "instance-created" : "instance-failed") +
            ", executable checks=" + std::to_string(g.memoryChecks.size()) +
            ", presented frames=" + std::to_string(g.successfulFrames) +
            ", surface recreations=" + std::to_string(g.recreationCount));
}

void destroySwapchain() {
    if (g.device) vkDeviceWaitIdle(g.device);
    if (g.acquired) { vkDestroySemaphore(g.device, g.acquired, nullptr); g.acquired = VK_NULL_HANDLE; }
    if (g.rendered) { vkDestroySemaphore(g.device, g.rendered, nullptr); g.rendered = VK_NULL_HANDLE; }
    if (g.commandPool) { vkDestroyCommandPool(g.device, g.commandPool, nullptr); g.commandPool = VK_NULL_HANDLE; g.commandBuffer = VK_NULL_HANDLE; }
    if (g.swapchain) {
        vkDestroySwapchainKHR(g.device, g.swapchain, nullptr);
        g.swapchain = VK_NULL_HANDLE;
        g.swapchainDestructionCount++;
        recordStatus("swapchain_destruction", true, "vkDestroySwapchainKHR completed");
    }
}

void destroySurface() {
    destroySwapchain();
    if (g.surface) {
        vkDestroySurfaceKHR(g.instance, g.surface, nullptr);
        g.surface = VK_NULL_HANDLE;
        g.surfaceDestructionCount++;
        recordStatus("surface_destruction", true, "vkDestroySurfaceKHR completed");
    }
    if (g.window) {
        ANativeWindow_release(g.window);
        g.window = nullptr;
    }
    g.presentationJson = "{\"status\":\"UNKNOWN\",\"steps\":[]}";
}

bool pickSurfaceQueue() {
    if (!g.gpu || !g.surface) return false;
    uint32_t n = 0;
    vkGetPhysicalDeviceQueueFamilyProperties(g.gpu, &n, nullptr);
    std::vector<VkQueueFamilyProperties> q(n);
    vkGetPhysicalDeviceQueueFamilyProperties(g.gpu, &n, q.data());
    for (uint32_t i = 0; i < n; ++i) {
        VkBool32 present = VK_FALSE;
        VkResult r = vkGetPhysicalDeviceSurfaceSupportKHR(g.gpu, i, g.surface, &present);
        if (r != VK_SUCCESS) continue;
        if (q[i].queueCount && (q[i].queueFlags & (VK_QUEUE_GRAPHICS_BIT | VK_QUEUE_COMPUTE_BIT)) ==
                (VK_QUEUE_GRAPHICS_BIT | VK_QUEUE_COMPUTE_BIT) && present) {
            g.queueFamily = i;
            g.graphicsComputeQueue = true;
            return true;
        }
    }
    return false;
}

bool createLogicalDevice() {
    if (g.device) return true;
    if (!g.gpu || g.queueFamily == UINT32_MAX) return false;
    float priority = 1.0f;
    VkDeviceQueueCreateInfo q{};
    q.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    q.queueFamilyIndex = g.queueFamily;
    q.queueCount = 1;
    q.pQueuePriorities = &priority;
    std::vector<std::string> available = enumerateDeviceExtensions(g.gpu);
    std::vector<const char *> exts;
    if (has(available, VK_KHR_SWAPCHAIN_EXTENSION_NAME)) exts.push_back(VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    else {
        recordStatus("VK_KHR_swapchain", false, "device extension not advertised");
        return false;
    }
    VkDeviceCreateInfo ci{};
    ci.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    ci.queueCreateInfoCount = 1;
    ci.pQueueCreateInfos = &q;
    ci.enabledExtensionCount = static_cast<uint32_t>(exts.size());
    ci.ppEnabledExtensionNames = exts.data();
    VkResult r = vkCreateDevice(g.gpu, &ci, nullptr, &g.device);
    recordVk("vkCreateDevice", r);
    if (r != VK_SUCCESS) return false;
    vkGetDeviceQueue(g.device, g.queueFamily, 0, &g.queue);
    return true;
}

bool createSwapchain(uint32_t requestedWidth, uint32_t requestedHeight) {
    if (!g.surface || !createLogicalDevice()) return false;
    VkSurfaceCapabilitiesKHR caps{};
    VkResult r = vkGetPhysicalDeviceSurfaceCapabilitiesKHR(g.gpu, g.surface, &caps);
    recordVk("vkGetPhysicalDeviceSurfaceCapabilitiesKHR", r);
    if (r != VK_SUCCESS) return false;
    g.surfaceAvailable = true;
    g.swapchainTransferDst = (caps.supportedUsageFlags & VK_IMAGE_USAGE_TRANSFER_DST_BIT) != 0;
    {
        std::ostringstream c;
        c << "{\"min_image_count\":" << caps.minImageCount << ",\"max_image_count\":" << caps.maxImageCount
          << ",\"current_extent\":[" << caps.currentExtent.width << ',' << caps.currentExtent.height
          << "],\"min_image_extent\":[" << caps.minImageExtent.width << ',' << caps.minImageExtent.height
          << "],\"max_image_extent\":[" << caps.maxImageExtent.width << ',' << caps.maxImageExtent.height
          << "],\"max_image_array_layers\":" << caps.maxImageArrayLayers
          << ",\"supported_transforms\":" << caps.supportedTransforms
          << ",\"current_transform\":" << caps.currentTransform
          << ",\"supported_composite_alpha\":" << caps.supportedCompositeAlpha
          << ",\"supported_usage_flags\":" << caps.supportedUsageFlags << '}';
        g.surfaceCapabilitiesJson = c.str();
    }

    uint32_t formatCount = 0;
    r = vkGetPhysicalDeviceSurfaceFormatsKHR(g.gpu, g.surface, &formatCount, nullptr);
    recordVk("vkGetPhysicalDeviceSurfaceFormatsKHR(count)", r, "count=" + std::to_string(formatCount));
    if (r != VK_SUCCESS || formatCount == 0) return false;
    std::vector<VkSurfaceFormatKHR> formats(formatCount);
    r = vkGetPhysicalDeviceSurfaceFormatsKHR(g.gpu, g.surface, &formatCount, formats.data());
    recordVk("vkGetPhysicalDeviceSurfaceFormatsKHR", r);
    if (r != VK_SUCCESS) return false;
    VkSurfaceFormatKHR chosen = formats.front();
    for (const auto &f : formats) {
        if ((f.format == VK_FORMAT_R8G8B8A8_UNORM || f.format == VK_FORMAT_B8G8R8A8_UNORM) &&
            f.colorSpace == VK_COLOR_SPACE_SRGB_NONLINEAR_KHR) { chosen = f; break; }
    }
    {
        std::ostringstream fjson;
        fjson << '[';
        for (uint32_t i = 0; i < formatCount; ++i) {
            if (i) fjson << ',';
            fjson << "{\"format\":" << formats[i].format << ",\"color_space\":" << formats[i].colorSpace << '}';
        }
        fjson << ']';
        g.surfaceFormatsJson = fjson.str();
    }
    std::vector<std::string> formatsText;
    for (const auto &f : formats) formatsText.emplace_back("format=" + std::to_string(f.format) +
            ",colorSpace=" + std::to_string(f.colorSpace));

    uint32_t modeCount = 0;
    r = vkGetPhysicalDeviceSurfacePresentModesKHR(g.gpu, g.surface, &modeCount, nullptr);
    recordVk("vkGetPhysicalDeviceSurfacePresentModesKHR(count)", r, "count=" + std::to_string(modeCount));
    if (r != VK_SUCCESS || modeCount == 0) return false;
    std::vector<VkPresentModeKHR> modes(modeCount);
    r = vkGetPhysicalDeviceSurfacePresentModesKHR(g.gpu, g.surface, &modeCount, modes.data());
    recordVk("vkGetPhysicalDeviceSurfacePresentModesKHR", r);
    if (r != VK_SUCCESS) return false;
    {
        std::ostringstream mjson;
        mjson << '[';
        for (uint32_t i = 0; i < modeCount; ++i) {
            if (i) mjson << ',';
            mjson << "{\"mode\":" << modes[i] << ",\"name\":" << quote(presentModeName(modes[i])) << '}';
        }
        mjson << ']';
        g.surfacePresentModesJson = mjson.str();
    }

    VkExtent2D extent{};
    if (caps.currentExtent.width != UINT32_MAX) extent = caps.currentExtent;
    else {
        extent.width = std::clamp(requestedWidth, caps.minImageExtent.width, caps.maxImageExtent.width);
        extent.height = std::clamp(requestedHeight, caps.minImageExtent.height, caps.maxImageExtent.height);
    }
    if (!extent.width) extent.width = std::max(1u, caps.minImageExtent.width);
    if (!extent.height) extent.height = std::max(1u, caps.minImageExtent.height);
    uint32_t imageCount = caps.minImageCount + 1;
    if (caps.maxImageCount && imageCount > caps.maxImageCount) imageCount = caps.maxImageCount;
    VkImageUsageFlags usage = g.swapchainTransferDst ? VK_IMAGE_USAGE_TRANSFER_DST_BIT : 0;
    if (!usage) {
        recordStatus("swapchain_transfer_dst_usage", false,
                "surface lacks TRANSFER_DST; test frame clear cannot be recorded without a graphics pipeline");
        return false;
    }
    recordStatus("swapchain_transfer_dst_usage", true, "supportedUsageFlags=" + std::to_string(caps.supportedUsageFlags));
    VkPresentModeKHR mode = VK_PRESENT_MODE_FIFO_KHR;
    VkSwapchainCreateInfoKHR sci{};
    sci.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    sci.surface = g.surface;
    sci.minImageCount = imageCount;
    sci.imageFormat = chosen.format;
    sci.imageColorSpace = chosen.colorSpace;
    sci.imageExtent = extent;
    sci.imageArrayLayers = 1;
    sci.imageUsage = usage;
    sci.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    sci.preTransform = caps.currentTransform;
    sci.compositeAlpha = (caps.supportedCompositeAlpha & VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR)
            ? VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR : static_cast<VkCompositeAlphaFlagBitsKHR>(
                    __builtin_ctz(caps.supportedCompositeAlpha) ? (1u << __builtin_ctz(caps.supportedCompositeAlpha)) : 1u);
    sci.presentMode = mode;
    sci.clipped = VK_TRUE;
    r = vkCreateSwapchainKHR(g.device, &sci, nullptr, &g.swapchain);
    recordVk("vkCreateSwapchainKHR", r, std::to_string(extent.width) + "x" + std::to_string(extent.height) +
             ", images=" + std::to_string(imageCount) + ", mode=FIFO");
    if (r != VK_SUCCESS) return false;
    g.recreationCount++;

    uint32_t imageN = 0;
    r = vkGetSwapchainImagesKHR(g.device, g.swapchain, &imageN, nullptr);
    recordVk("vkGetSwapchainImagesKHR(count)", r, "count=" + std::to_string(imageN));
    if (r != VK_SUCCESS || imageN == 0) return false;
    std::vector<VkImage> images(imageN);
    r = vkGetSwapchainImagesKHR(g.device, g.swapchain, &imageN, images.data());
    recordVk("vkGetSwapchainImagesKHR", r);
    if (r != VK_SUCCESS) return false;

    VkCommandPoolCreateInfo pci{};
    pci.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
    pci.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
    pci.queueFamilyIndex = g.queueFamily;
    r = vkCreateCommandPool(g.device, &pci, nullptr, &g.commandPool);
    recordVk("vkCreateCommandPool", r);
    if (r != VK_SUCCESS) return false;
    VkCommandBufferAllocateInfo cai{};
    cai.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
    cai.commandPool = g.commandPool;
    cai.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
    cai.commandBufferCount = 1;
    r = vkAllocateCommandBuffers(g.device, &cai, &g.commandBuffer);
    recordVk("vkAllocateCommandBuffers", r);
    if (r != VK_SUCCESS) return false;
    VkSemaphoreCreateInfo sem{};
    sem.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
    r = vkCreateSemaphore(g.device, &sem, nullptr, &g.acquired);
    recordVk("vkCreateSemaphore(acquired)", r);
    if (r != VK_SUCCESS) return false;
    r = vkCreateSemaphore(g.device, &sem, nullptr, &g.rendered);
    recordVk("vkCreateSemaphore(rendered)", r);
    if (r != VK_SUCCESS) return false;

    uint32_t imageIndex = 0;
    r = vkAcquireNextImageKHR(g.device, g.swapchain, UINT64_MAX, g.acquired, VK_NULL_HANDLE, &imageIndex);
    recordVk("vkAcquireNextImageKHR", r, "image_index=" + std::to_string(imageIndex));
    if (r != VK_SUCCESS && r != VK_SUBOPTIMAL_KHR) return false;
    VkCommandBufferBeginInfo begin{};
    begin.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    begin.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    r = vkBeginCommandBuffer(g.commandBuffer, &begin);
    recordVk("vkBeginCommandBuffer", r);
    if (r != VK_SUCCESS) return false;
    VkImageMemoryBarrier toClear{};
    toClear.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
    toClear.srcAccessMask = 0;
    toClear.dstAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
    toClear.oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    toClear.newLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
    toClear.srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    toClear.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    toClear.image = images[imageIndex];
    toClear.subresourceRange = {VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1};
    vkCmdPipelineBarrier(g.commandBuffer, VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT,
                         0, 0, nullptr, 0, nullptr, 1, &toClear);
    VkClearColorValue color{{0.08f, 0.32f, 0.68f, 1.0f}};
    VkImageSubresourceRange range{VK_IMAGE_ASPECT_COLOR_BIT, 0, 1, 0, 1};
    vkCmdClearColorImage(g.commandBuffer, images[imageIndex], VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &color, 1, &range);
    VkImageMemoryBarrier toPresent = toClear;
    toPresent.srcAccessMask = VK_ACCESS_TRANSFER_WRITE_BIT;
    toPresent.dstAccessMask = 0;
    toPresent.oldLayout = VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL;
    toPresent.newLayout = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;
    vkCmdPipelineBarrier(g.commandBuffer, VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT,
                         0, 0, nullptr, 0, nullptr, 1, &toPresent);
    r = vkEndCommandBuffer(g.commandBuffer);
    recordVk("vkEndCommandBuffer", r);
    if (r != VK_SUCCESS) return false;
    VkPipelineStageFlags waitStage = VK_PIPELINE_STAGE_TRANSFER_BIT;
    VkSubmitInfo submit{};
    submit.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO;
    submit.waitSemaphoreCount = 1;
    submit.pWaitSemaphores = &g.acquired;
    submit.pWaitDstStageMask = &waitStage;
    submit.commandBufferCount = 1;
    submit.pCommandBuffers = &g.commandBuffer;
    submit.signalSemaphoreCount = 1;
    submit.pSignalSemaphores = &g.rendered;
    r = vkQueueSubmit(g.queue, 1, &submit, VK_NULL_HANDLE);
    recordVk("vkQueueSubmit", r, "clear blue test frame");
    if (r != VK_SUCCESS) return false;
    VkPresentInfoKHR pi{};
    pi.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
    pi.waitSemaphoreCount = 1;
    pi.pWaitSemaphores = &g.rendered;
    pi.swapchainCount = 1;
    pi.pSwapchains = &g.swapchain;
    pi.pImageIndices = &imageIndex;
    r = vkQueuePresentKHR(g.queue, &pi);
    recordVk("vkQueuePresentKHR", r);
    if (r != VK_SUCCESS && r != VK_SUBOPTIMAL_KHR) return false;
    r = vkQueueWaitIdle(g.queue);
    recordVk("vkQueueWaitIdle", r);
    if (r != VK_SUCCESS) return false;
    g.successfulFrames++;
    return true;
}

void updatePresentationJson() {
    bool pass = g.successfulFrames > 0 && g.surfaceCreationCount > 0 && g.recreationCount > 0;
    std::ostringstream o;
    o << "{\"status\":" << quote(pass ? "PASS" : "FAIL")
      << ",\"surface_extension\":" << quote(g.androidSurfaceExt ? "PASS" : "FAIL")
      << ",\"surface_created\":" << quote(g.surfaceCreationCount ? "PASS" : "FAIL")
      << ",\"surface_present_support\":" << quote(g.surfaceAvailable ? "PASS" : "FAIL")
      << ",\"current_surface_attached\":" << (g.surface ? "true" : "false")
      << ",\"surface_capabilities\":" << g.surfaceCapabilitiesJson
      << ",\"surface_formats\":" << g.surfaceFormatsJson
      << ",\"surface_present_modes\":" << g.surfacePresentModesJson
      << ",\"swapchain_transfer_dst_supported\":" << (g.swapchainTransferDst ? "true" : "false")
      << ",\"swapchain_created\":" << quote(g.recreationCount ? "PASS" : "FAIL")
      << ",\"current_swapchain_alive\":" << (g.swapchain ? "true" : "false")
      << ",\"successful_frames\":" << g.successfulFrames
      << ",\"recreation_count\":" << g.recreationCount
      << ",\"surface_creation_count\":" << g.surfaceCreationCount
      << ",\"surface_destruction_count\":" << g.surfaceDestructionCount
      << ",\"swapchain_destruction_count\":" << g.swapchainDestructionCount
      << ",\"steps\":[";
    for (size_t i = 0; i < g.presentationSteps.size(); ++i) {
        if (i) o << ',';
        o << g.presentationSteps[i];
    }
    o << "]}";
    g.presentationJson = o.str();
}

jstring javaString(JNIEnv *env, const std::string &s) { return env->NewStringUTF(s.c_str()); }

} // namespace

extern "C" JNIEXPORT jstring JNICALL
Java_org_boxdroid_m0probe_MainActivity_nativeInit(JNIEnv *env, jobject, jstring reportPath, jstring deviceJson) {
    const char *p = env->GetStringUTFChars(reportPath, nullptr);
    g.path = p ? p : "";
    if (p) env->ReleaseStringUTFChars(reportPath, p);
    const char *d = env->GetStringUTFChars(deviceJson, nullptr);
    g.deviceJson = d ? d : "{}";
    if (d) env->ReleaseStringUTFChars(deviceJson, d);
    g.memoryChecks.clear();
    g.presentationSteps.clear();
    g.pageSize = sysconf(_SC_PAGESIZE);
    logLine(ANDROID_LOG_INFO, "Probe starts. page_size=" + std::to_string(g.pageSize));
    executeMemoryChecks();
    runVulkanInventory();
    updatePresentationJson();
    writeReport();
    std::string summary = "Vulkan loader API " + quote(versionString(g.loaderApiVersion)) +
            "; physical device inventory recorded; executable memory " +
            std::to_string(g.memoryChecks.size()) + " checks; waiting for SurfaceView.";
    logLine(ANDROID_LOG_INFO, summary);
    return javaString(env, summary);
}

extern "C" JNIEXPORT jstring JNICALL
Java_org_boxdroid_m0probe_MainActivity_nativeSurfaceCreated(JNIEnv *env, jobject, jobject surface,
                                                            jint width, jint height) {
    g.presentationSteps.clear();
    if (g.surface || g.window) destroySurface();
    if (!g.instance || !g.androidSurfaceExt || !surface) {
        recordStatus("android_surface_prerequisites", false, "Vulkan instance, extension, or Java Surface unavailable");
        updatePresentationJson(); writeReport();
        return javaString(env, "Android Vulkan surface prerequisites failed");
    }
    if (g.window) ANativeWindow_release(g.window);
    g.window = ANativeWindow_fromSurface(env, surface);
    recordStatus("ANativeWindow_fromSurface", g.window != nullptr, "Surface converted to ANativeWindow");
    if (!g.window) { updatePresentationJson(); writeReport(); return javaString(env, "ANativeWindow conversion failed"); }

    VkAndroidSurfaceCreateInfoKHR sci{};
    sci.sType = VK_STRUCTURE_TYPE_ANDROID_SURFACE_CREATE_INFO_KHR;
    sci.window = g.window;
    VkResult r = vkCreateAndroidSurfaceKHR(g.instance, &sci, nullptr, &g.surface);
    recordVk("vkCreateAndroidSurfaceKHR", r);
    if (r != VK_SUCCESS) { updatePresentationJson(); writeReport(); return javaString(env, "vkCreateAndroidSurfaceKHR failed"); }
    g.surfaceCreationCount++;
    bool queue = pickSurfaceQueue();
    recordStatus("graphics_compute_present_queue", queue, queue ? "one family supports graphics, compute, and Android presentation" : "no common graphics+compute+present family");
    if (!queue) { updatePresentationJson(); writeReport(); return javaString(env, "No compatible graphics/compute/present queue family"); }
    bool ok = createSwapchain(static_cast<uint32_t>(std::max(1, width)), static_cast<uint32_t>(std::max(1, height)));
    updatePresentationJson(); writeReport();
    return javaString(env, ok ? "Vulkan test frame presented" : "Vulkan swapchain or test-frame operation failed");
}

extern "C" JNIEXPORT jstring JNICALL
Java_org_boxdroid_m0probe_MainActivity_nativeSurfaceChanged(JNIEnv *env, jobject, jobject surface,
                                                            jint width, jint height) {
    if (!g.surface) {
        return Java_org_boxdroid_m0probe_MainActivity_nativeSurfaceCreated(env, nullptr, surface, width, height);
    }
    g.presentationSteps.clear();
    destroySwapchain();
    if (!pickSurfaceQueue()) {
        recordStatus("graphics_compute_present_queue", false, "no common graphics+compute+present queue family");
        updatePresentationJson(); writeReport();
        return javaString(env, "No compatible graphics/compute/present queue family");
    }
    bool ok = createSwapchain(static_cast<uint32_t>(std::max(1, width)), static_cast<uint32_t>(std::max(1, height)));
    updatePresentationJson(); writeReport();
    return javaString(env, ok ? "Swapchain recreated and test frame presented" : "Swapchain recreation failed");
}

extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_m0probe_MainActivity_nativeSurfaceDestroyed(JNIEnv *, jobject) {
    destroySurface();
    updatePresentationJson();
    writeReport();
}

extern "C" JNIEXPORT void JNICALL
Java_org_boxdroid_m0probe_MainActivity_nativeShutdown(JNIEnv *, jobject) {
    destroySurface();
    if (g.device) { vkDeviceWaitIdle(g.device); vkDestroyDevice(g.device, nullptr); g.device = VK_NULL_HANDLE; }
    if (g.instance) { vkDestroyInstance(g.instance, nullptr); g.instance = VK_NULL_HANDLE; }
    g.gpu = VK_NULL_HANDLE;
    writeReport();
    logLine(ANDROID_LOG_INFO, "Probe native resources shut down cleanly");
}
