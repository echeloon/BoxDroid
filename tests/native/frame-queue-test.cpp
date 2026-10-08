#include "../../native/android/core/boxdroid-frame-queue.h"

#include <cassert>
#include <future>
#include <iostream>

int main()
{
    std::vector<uint8_t> seen;
    boxdroid::FrameQueue ordered([&](const auto &frame) {
        seen.push_back(frame.pixels[0]);
        return true;
    });
    assert(ordered.start());
    for (unsigned i = 0; i < 10000; ++i) {
        uint8_t pixels[4] = { static_cast<uint8_t>(i), 0, 0, 255 };
        assert(ordered.push(pixels, 1, 1, 4));
    }
    ordered.drain();
    assert(ordered.snapshot().completed == 10000);
    ordered.stop();
    assert(seen.size() == 10000);
    for (unsigned i = 0; i < seen.size(); ++i)
        assert(seen[i] == static_cast<uint8_t>(i));
    assert(ordered.snapshot().maxDepth <= 2);
    assert(ordered.snapshot().canceled == 0);

    std::promise<void> entered, release;
    auto released = release.get_future().share();
    boxdroid::FrameQueue retiring([&](const auto &) {
        entered.set_value();
        released.wait();
        return true;
    });
    retiring.start();
    uint8_t pixels[4] = { 42, 0, 0, 255 };
    assert(retiring.push(pixels, 1, 1, 4));
    entered.get_future().wait();
    assert(retiring.push(pixels, 1, 1, 4));
    auto producer = std::async(std::launch::async,
                               [&] { return retiring.push(pixels, 1, 1, 4); });
    assert(producer.wait_for(std::chrono::milliseconds(20)) ==
           std::future_status::timeout);
    auto stop = std::async(std::launch::async, [&] { retiring.stop(); });
    assert(producer.wait_for(std::chrono::seconds(1)) ==
           std::future_status::ready);
    assert(!producer.get());
    release.set_value();
    stop.get();
    assert(retiring.snapshot().completed == 1);
    assert(retiring.snapshot().canceled == 1);

    for (unsigned cycle = 0; cycle < 100; ++cycle) {
        assert(ordered.start());
        assert(ordered.push(pixels, 1, 1, 4));
        ordered.drain();
        assert(ordered.snapshot().completed == 10001 + cycle);
        ordered.stop();
    }
    std::cout << "Frame queue: FIFO, owned snapshots, bounded backpressure, "
                 "cancellation and restart passed\n";
}
