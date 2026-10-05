package org.boxdroid.m3;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public final class MainActivity extends Activity {
    private static final String TAG = "BoxDroidM4";
    private static final String M3_TAG = "BoxDroidM3";
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static boolean m3Started;
    private FrameLayout root;
    private SurfaceView currentSurfaceView;
    private int generation;
    private int generationFrames;
    private boolean nativeSurfaceReady;
    private boolean transitionPending;
    private boolean visibleMarkerWritten;
    private boolean failed;
    private boolean m4Mode;
    private volatile boolean nativeM4ShutdownComplete;

    static {
        System.loadLibrary("boxdroid");
        Log.i(TAG, "LIBRARY_LOAD_OK libboxdroid.so");
    }

    private native int nativeRunTcgTest(String guestPath, String serialPath, String tracePath);
    private native boolean nativeM4SurfaceCreated(Surface surface, int width, int height, int generation);
    private native boolean nativeM4SurfaceChanged(int width, int height);
    private native boolean nativeM4PresentFrame();
    private native void nativeM4SurfaceDestroyed();
    private native String nativeM4Diagnostics();
    private native void nativeM4Shutdown();

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        if ("m3".equals(getIntent().getStringExtra("boxdroid.mode"))) {
            runM3();
        } else {
            m4Mode = true;
            runM4();
        }
    }

    @Override
    protected void onDestroy() {
        if (m4Mode && !nativeM4ShutdownComplete) {
            try {
                Future<?> shutdown = EXECUTOR.submit(this::nativeM4Shutdown);
                shutdown.get(15, TimeUnit.SECONDS);
                nativeM4ShutdownComplete = true;
            } catch (Exception e) {
                Log.e(TAG, "VULKAN_SHUTDOWN_FAILED", e);
            }
        }
        super.onDestroy();
    }

    private void runM3() {
        setTitle("BoxDroid M3 headless regression");
        TextView status = new TextView(this);
        status.setPadding(32, 32, 32, 32);
        status.setTextSize(18);
        status.setText("BoxDroid M3: starting headless AArch64 TCG test…");
        setContentView(status);
        synchronized (MainActivity.class) {
            if (m3Started) {
                status.setText("M3 test already ran in this process; force-stop and relaunch to repeat.");
                return;
            }
            m3Started = true;
        }
        EXECUTOR.execute(() -> {
            int result = runTcgTest();
            String summary = "M3_RESULT=" + (result == 0 ? "PASS" : "FAIL") + " native_result=" + result;
            try { write(new File(getFilesDir(), "m3-result.txt"), summary + "\n"); }
            catch (IOException e) { Log.e(M3_TAG, "RESULT_WRITE_FAIL", e); }
            Log.i(M3_TAG, summary);
            runOnUiThread(() -> status.setText(summary + "\nDetails: app-private files"));
        });
    }

    private int runTcgTest() {
        File guest = new File(getFilesDir(), "guest.elf");
        File serial = new File(getFilesDir(), "guest-uart.log");
        File trace = new File(getFilesDir(), "qemu-tcg.log");
        try (InputStream in = getAssets().open("guest.elf"); FileOutputStream out = new FileOutputStream(guest, false)) {
            byte[] buffer = new byte[8192];
            int n;
            while ((n = in.read(buffer)) != -1) out.write(buffer, 0, n);
            out.getFD().sync();
            serial.delete();
            trace.delete();
            new File(getFilesDir(), "m3-result.txt").delete();
        } catch (IOException e) {
            Log.e(M3_TAG, "GUEST_ASSET_COPY_FAIL", e);
            return -100;
        }
        Log.i(M3_TAG, "NATIVE_TEST_START guest=" + guest.getAbsolutePath());
        return nativeRunTcgTest(guest.getAbsolutePath(), serial.getAbsolutePath(), trace.getAbsolutePath());
    }

    private void runM4() {
        setTitle("BoxDroid M4 Vulkan presentation diagnostic");
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
                View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
        root = new FrameLayout(this);
        setContentView(root);
        new File(getFilesDir(), "m4-result.json").delete();
        new File(getFilesDir(), "m4-visible.ready").delete();
        Log.i(TAG, "M4_START bounded clear-frame test; two real SurfaceView generations");
        installSurface(1);
    }

    private void installSurface(int nextGeneration) {
        generation = nextGeneration;
        generationFrames = 0;
        nativeSurfaceReady = false;
        transitionPending = false;
        visibleMarkerWritten = false;
        SurfaceView view = new SurfaceView(this);
        currentSurfaceView = view;
        view.getHolder().addCallback(new SurfaceHolder.Callback() {
            private boolean initialized;
            private int lastWidth;
            private int lastHeight;

            @Override public void surfaceCreated(SurfaceHolder holder) {
                Log.i(TAG, "JAVA_SURFACE_CREATED generation=" + generation + " valid=" + holder.getSurface().isValid());
            }

            @Override public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
                if (initialized) {
                    if (width == lastWidth && height == lastHeight) return;
                    lastWidth = width;
                    lastHeight = height;
                    Log.i(TAG, "JAVA_SURFACE_RESIZED generation=" + generation + " extent=" + width + "x" + height);
                    EXECUTOR.execute(() -> {
                        boolean ok = nativeM4SurfaceChanged(width, height);
                        if (!ok) runOnUiThread(() -> fail("native_swapchain_resize_failed"));
                    });
                    return;
                }
                initialized = true;
                lastWidth = width;
                lastHeight = height;
                final int callbackGeneration = generation;
                final Surface surface = holder.getSurface();
                Log.i(TAG, "JAVA_SURFACE_CHANGED generation=" + callbackGeneration + " extent=" + width + "x" + height);
                EXECUTOR.execute(() -> {
                    boolean ok = nativeM4SurfaceCreated(surface, width, height, callbackGeneration);
                    runOnUiThread(() -> {
                        if (callbackGeneration != generation) return;
                        if (!ok) { fail("native_surface_create_failed"); return; }
                        nativeSurfaceReady = true;
                        scheduleFrame(callbackGeneration);
                    });
                });
            }

            @Override public void surfaceDestroyed(SurfaceHolder holder) {
                Log.i(TAG, "JAVA_SURFACE_DESTROYED generation=" + generation);
                try {
                    Future<?> teardown = EXECUTOR.submit(() -> nativeM4SurfaceDestroyed());
                    teardown.get(15, TimeUnit.SECONDS);
                } catch (Exception e) {
                    fail("native_surface_teardown_failed:" + e.getClass().getSimpleName());
                }
                nativeSurfaceReady = false;
                if (generation == 1 && !failed) {
                    MAIN.post(() -> installSurface(2));
                } else if (generation == 2) {
                    EXECUTOR.execute(thisActivityResultTask());
                }
            }
        });
        root.addView(view, new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT));
    }

    private Runnable thisActivityResultTask() {
        return () -> {
            String json = nativeM4Diagnostics();
            try { write(new File(getFilesDir(), "m4-result.json"), json + "\n"); }
            catch (IOException e) { Log.e(TAG, "RESULT_WRITE_FAIL", e); }
            Log.i(TAG, "M4_RESULT=" + json);
            nativeM4Shutdown();
            nativeM4ShutdownComplete = true;
        };
    }

    private void scheduleFrame(int callbackGeneration) {
        MAIN.postDelayed(() -> {
            if (failed || callbackGeneration != generation || !nativeSurfaceReady || transitionPending) return;
            EXECUTOR.execute(() -> {
                boolean ok = nativeM4PresentFrame();
                runOnUiThread(() -> {
                    if (callbackGeneration != generation || failed) return;
                    if (!ok) { fail("vk_frame_present_failed generation=" + callbackGeneration); return; }
                    generationFrames++;
                    if (callbackGeneration == 2 && generationFrames >= 60 && !visibleMarkerWritten) {
                        visibleMarkerWritten = true;
                        try { write(new File(getFilesDir(), "m4-visible.ready"), "generation=2 frames=" + generationFrames + "\n"); }
                        catch (IOException e) { fail("visible_marker_write_failed"); return; }
                        Log.i(TAG, "VISIBLE_FRAME_READY generation=2 frames=" + generationFrames + " color=cyan");
                    }
                    if (generationFrames >= 75) {
                        transitionPending = true;
                        if (callbackGeneration == 1) {
                            Log.i(TAG, "SURFACE_RECREATION_REQUEST frames_before=" + generationFrames);
                            root.removeView(currentSurfaceView);
                        } else {
                            Log.i(TAG, "PRESENTATION_COMPLETE frames_after=" + generationFrames);
                            MAIN.postDelayed(() -> root.removeView(currentSurfaceView), 1800);
                        }
                    } else {
                        scheduleFrame(callbackGeneration);
                    }
                });
            });
        }, 33);
    }

    private void fail(String reason) {
        failed = true;
        Log.e(TAG, "M4_RESULT=FAIL reason=" + reason);
        try { write(new File(getFilesDir(), "m4-result.json"), "{\"status\":\"FAIL\",\"reason\":\"" + reason + "\"}\n"); }
        catch (IOException e) { Log.e(TAG, "RESULT_WRITE_FAIL", e); }
    }

    private static void write(File file, String text) throws IOException {
        try (FileOutputStream out = new FileOutputStream(file, false)) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
            out.getFD().sync();
        }
    }
}
