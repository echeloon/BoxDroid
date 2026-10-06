package org.boxdroid;

import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.SystemClock;
import android.system.Os;
import android.system.OsConstants;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/** Android-only diagnostic overlay. MainActivity continues to own the Xbox runtime. */
public final class OverlayActivity extends MainActivity {
    private static final String TAG = "BoxDroid_";
    private static final long SAMPLE_MS = 500;
    private final Object samplerLock = new Object();
    private ScheduledExecutorService sampler;
    private MetricsSampler currentSampler;
    private TextView metrics;

    // Returns the presenter's completed, successful queue-present count.
    private native long nativePresentedFrames();

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        FrameLayout content = findViewById(android.R.id.content);
        metrics = new TextView(this);
        metrics.setText("FPS: 0.0\nRAM: 0 MB\nCPU: 0%\nGPU: N/A");
        metrics.setTextColor(Color.rgb(115, 255, 85));
        metrics.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        metrics.setTypeface(Typeface.MONOSPACE);
        metrics.setGravity(Gravity.START);
        metrics.setBackgroundColor(Color.argb(176, 20, 20, 20));
        int pad = dp(8);
        metrics.setPadding(pad, pad, pad, pad);
        metrics.setClickable(false);
        metrics.setFocusable(false);
        FrameLayout.LayoutParams position = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.END);
        position.topMargin = pad;
        position.rightMargin = pad;
        content.addView(metrics, position);
        metrics.setOnApplyWindowInsetsListener((View view, WindowInsets insets) -> {
            FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) view.getLayoutParams();
            lp.topMargin = pad + insets.getStableInsetTop();
            lp.rightMargin = pad + insets.getStableInsetRight();
            view.setLayoutParams(lp);
            return insets;
        });
        metrics.requestApplyInsets();
        Log.i(TAG, "OVERLAY_READY alpha=176/255 position=top-right interval_ms=" + SAMPLE_MS);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    @Override
    protected void onStart() {
        super.onStart();
        synchronized (samplerLock) {
            if (sampler != null) return;
            sampler = Executors.newSingleThreadScheduledExecutor();
            currentSampler = new MetricsSampler();
            sampler.scheduleAtFixedRate(currentSampler, 0, SAMPLE_MS, TimeUnit.MILLISECONDS);
        }
    }

    @Override
    protected void onStop() {
        synchronized (samplerLock) {
            if (sampler != null) {
                MetricsSampler closing = currentSampler;
                sampler.execute(closing::close);
                sampler.shutdown();
                sampler = null;
                currentSampler = null;
            }
        }
        super.onStop();
    }

    private final class MetricsSampler implements Runnable {
        private final long clockTicksPerSecond = Os.sysconf(OsConstants._SC_CLK_TCK);
        private final long pageBytes = Os.sysconf(OsConstants._SC_PAGESIZE);
        private long previousNanos;
        private long previousTicks;
        private long previousPresents;
        private double smoothFps;
        private int samples;
        private RandomAccessFile stat;
        private RandomAccessFile statm;
        private RandomAccessFile gpu;
        private boolean gpuUnavailable;
        private String gpuRaw = "unavailable";

        // KGSL reports busy_old / total_old for its last kernel window.
        // These are not cumulative counters; do not subtract successive values.
        private String gpuPercent() {
            if (gpuUnavailable) return "N/A";
            try {
                if (gpu == null) gpu = new RandomAccessFile(
                        "/sys/class/kgsl/kgsl-3d0/gpu_busy_percentage", "r");
                gpuRaw = read(gpu).trim();
                int percent = Integer.parseInt(gpuRaw.replace("%", "").trim());
                return percent >= 0 && percent <= 100 ? percent + "%" : "N/A";
            } catch (IOException | RuntimeException error) {
                gpuUnavailable = true;
                Log.w(TAG, "GPU_UNAVAILABLE source=gpu_busy_percentage", error);
                return "N/A";
            }
        }
        private long totalSampleMicros;
        private long maxSampleMicros;

        private void close() {
            try {
                if (stat != null) stat.close();
                if (statm != null) statm.close();
                if (gpu != null) gpu.close();
            } catch (IOException error) {
                Log.w(TAG, "OVERLAY_SAMPLE_CLOSE_FAILED", error);
            }
        }

        private String read(RandomAccessFile file) throws IOException {
            file.seek(0);
            return file.readLine();
        }

        @Override
        public void run() {
            long sampleStart = SystemClock.elapsedRealtimeNanos();
            try {
                if (stat == null) {
                    stat = new RandomAccessFile("/proc/self/stat", "r");
                    statm = new RandomAccessFile("/proc/self/statm", "r");
                }
                long now = SystemClock.elapsedRealtimeNanos();
                long presented = nativePresentedFrames();
                String proc = read(stat);
                String[] fields = proc.substring(proc.lastIndexOf(')') + 1).trim().split("\\s+");
                long ticks = Long.parseLong(fields[11]) + Long.parseLong(fields[12]);
                String[] pages = read(statm).split("\\s+");
                long rssMb = Math.round(Double.parseDouble(pages[1]) * pageBytes / 1048576.0);
                long onlineCpus = Os.sysconf(OsConstants._SC_NPROCESSORS_ONLN);
                double cpu = 0;
                if (previousNanos > 0 && now > previousNanos && clockTicksPerSecond > 0) {
                    double seconds = (now - previousNanos) / 1e9;
                    double intervalFps = Math.max(0, presented - previousPresents) / seconds;
                    smoothFps = samples == 0 ? intervalFps : 0.5 * intervalFps + 0.5 * smoothFps;
                    cpu = Math.max(0, ticks - previousTicks) / (clockTicksPerSecond * seconds * Math.max(1, onlineCpus)) * 100;
                    cpu = Math.min(100, cpu);
                    ++samples;
                }
                previousNanos = now;
                previousPresents = presented;
                previousTicks = ticks;
                String gpuValue = gpuPercent();
                String value = String.format(Locale.US, "FPS: %.1f\nRAM: %d MB\nCPU: %.0f%%\nGPU: %s",
                        smoothFps, rssMb, cpu, gpuValue);
                runOnUiThread(() -> metrics.setText(value));
                long sampleMicros = (SystemClock.elapsedRealtimeNanos() - sampleStart) / 1000;
                totalSampleMicros += sampleMicros;
                maxSampleMicros = Math.max(maxSampleMicros, sampleMicros);
                if (samples <= 2 || samples % 8 == 0) {
                    Log.i(TAG, "OVERLAY_SAMPLE fps=" + String.format(Locale.US, "%.1f", smoothFps)
                            + " rss_mb=" + rssMb + " cpu_pct=" + Math.round(cpu)
                            + " online_cpus=" + onlineCpus + " gpu=" + gpuValue + " gpu_raw=" + gpuRaw
                            + " presents=" + presented + " sample_us=" + sampleMicros
                            + " average_sample_us=" + (totalSampleMicros / (samples + 1))
                            + " max_sample_us=" + maxSampleMicros);
                }
            } catch (IOException | RuntimeException error) {
                Log.e(TAG, "OVERLAY_SAMPLE_FAILED", error);
            }
        }
    }
}
