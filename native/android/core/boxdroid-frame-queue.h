#ifndef BOXDROID_FRAME_QUEUE_H
#define BOXDROID_FRAME_QUEUE_H

#include <algorithm>
#include <array>
#include <chrono>
#include <condition_variable>
#include <cstdint>
#include <exception>
#include <functional>
#include <mutex>
#include <thread>
#include <utility>
#include <vector>

namespace boxdroid {

// Two owned snapshots, including the frame being consumed. The producer never
// exposes guest memory to the worker. Full queues apply backpressure rather
// than dropping or reordering frames. stop() cancels only work for a retired
// surface, wakes blocked producers, and joins before Vulkan resources are
// freed.
class FrameQueue {
public:
    using Clock = std::chrono::steady_clock;
    struct Frame {
        std::vector<uint8_t> pixels;
        uint32_t width = 0, height = 0, stride = 0;
        Clock::time_point queued;
    };
    struct Stats {
        uint64_t submitted = 0, completed = 0, failed = 0, canceled = 0;
        uint64_t blockedUs = 0, idleUs = 0, maxDepth = 0;
    };
    using Consumer = std::function<bool(const Frame &)>;

    explicit FrameQueue(Consumer consumer) : consume(std::move(consumer))
    {
    }
    ~FrameQueue()
    {
        stop();
    }
    FrameQueue(const FrameQueue &) = delete;
    FrameQueue &operator=(const FrameQueue &) = delete;

    bool start()
    {
        std::lock_guard<std::mutex> guard(lock);
        if (worker.joinable())
            return true;
        closed = false;
        head = tail = count = 0;
        try {
            worker = std::thread([this] { run(); });
        } catch (const std::exception &) {
            closed = true;
            return false;
        }
        return true;
    }

    bool push(const uint8_t *pixels, uint32_t width, uint32_t height,
              uint32_t stride)
    {
        std::unique_lock<std::mutex> guard(lock);
        if (closed)
            return false;
        if (count == frames.size()) {
            const auto begin = Clock::now();
            available.wait(guard,
                           [this] { return closed || count < frames.size(); });
            stats.blockedUs += micros(begin, Clock::now());
        }
        if (closed)
            return false;
        Frame &frame = frames[tail];
        frame.pixels.assign(pixels,
                            pixels + static_cast<size_t>(stride) * height);
        frame.width = width;
        frame.height = height;
        frame.stride = stride;
        frame.queued = Clock::now();
        tail = (tail + 1) % frames.size();
        ++count;
        ++stats.submitted;
        stats.maxDepth = std::max(stats.maxDepth, static_cast<uint64_t>(count));
        pending.notify_one();
        return true;
    }

    void stop()
    {
        {
            std::lock_guard<std::mutex> guard(lock);
            closed = true;
            pending.notify_all();
            available.notify_all();
        }
        if (worker.joinable())
            worker.join();
    }

    void drain()
    {
        std::unique_lock<std::mutex> guard(lock);
        available.wait(guard, [this] { return closed || !count; });
    }

    Stats snapshot()
    {
        std::lock_guard<std::mutex> guard(lock);
        return stats;
    }

    static uint64_t micros(Clock::time_point begin, Clock::time_point end)
    {
        return std::chrono::duration_cast<std::chrono::microseconds>(end -
                                                                     begin)
            .count();
    }

private:
    void run()
    {
        std::unique_lock<std::mutex> guard(lock);
        while (!closed) {
            if (!count) {
                const auto begin = Clock::now();
                pending.wait(guard, [this] { return closed || count; });
                stats.idleUs += micros(begin, Clock::now());
            }
            if (closed)
                break;
            const Frame &frame = frames[head];
            guard.unlock();
            const bool ok = consume(frame);
            guard.lock();
            if (ok)
                ++stats.completed;
            else
                ++stats.failed;
            head = (head + 1) % frames.size();
            --count;
            available.notify_all();
        }
        stats.canceled += count;
        count = 0;
    }

    Consumer consume;
    std::array<Frame, 2> frames;
    std::mutex lock;
    std::condition_variable pending, available;
    std::thread worker;
    size_t head = 0, tail = 0, count = 0;
    bool closed = true;
    Stats stats;
};

} // namespace boxdroid
#endif
