package org.boxdroid.m5;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;
import android.view.Gravity;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.io.File;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public final class MainActivity extends Activity {
    private static final String TAG = "BoxDroidM5";
    private static final ExecutorService NATIVE = Executors.newSingleThreadExecutor();
    private boolean surfaceReady;
    private boolean xboxStarted;
    private boolean stopping;

    static {
        System.loadLibrary("boxdroid");
        Log.i(TAG, "LIBRARY_LOAD_OK libboxdroid.so");
    }

    private native int nativeXboxStart(String bios, String mcpx, String hdd, String log);
    private native int nativeXboxStop();
    private native boolean nativeM4SurfaceCreated(Surface surface, int width, int height, int generation);
    private native boolean nativeM4SurfaceChanged(int width, int height);
    private native void nativeM4SurfaceDestroyed();
    private native String nativeM4Diagnostics();
    private native void nativeM4Shutdown();

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
                View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
        logDisplayGeometry("ACTIVITY_CREATE", 0, 0, 0, 0);
        FrameLayout root = new FrameLayout(this);
        TextView status = new TextView(this);
        status.setText("BoxDroid M5 Xbox boot diagnostic\nWaiting for Android surface…");
        status.setPadding(24, 24, 24, 24);
        root.addView(status);
        SurfaceView surfaceView = new SurfaceView(this);
        // Keep the diagnostic swapchain moderate while Android scales its
        // buffers to the physical display. Xbox scanout is only 640x480.
        surfaceView.getHolder().setFixedSize(1280, 720);
        root.addView(surfaceView, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
        setContentView(root);
        root.post(() -> {
            int areaWidth = root.getWidth();
            int areaHeight = root.getHeight();
            if (areaWidth <= 0 || areaHeight <= 0) return;
            int viewWidth = areaWidth;
            int viewHeight = areaHeight;
            if ((long) areaWidth * 9 > (long) areaHeight * 16) {
                viewWidth = areaHeight * 16 / 9;
            } else {
                viewHeight = areaWidth * 9 / 16;
            }
            FrameLayout.LayoutParams surfaceParams = new FrameLayout.LayoutParams(
                    viewWidth, viewHeight, Gravity.CENTER);
            surfaceView.setLayoutParams(surfaceParams);
            Log.i(TAG, "ANDROID_PRESENTATION_VIEW area=" + areaWidth + "x" + areaHeight
                    + " fitted=" + viewWidth + "x" + viewHeight + " aspect=16:9");
        });
        File directory = new File(getExternalFilesDir(null), "m5");
        Log.i(TAG, "M5_PATHS directory=" + directory.getAbsolutePath());
        surfaceView.getHolder().addCallback(new SurfaceHolder.Callback() {
            private boolean created;

            @Override public void surfaceCreated(SurfaceHolder holder) {
                Log.i(TAG, "ANDROID_SURFACE_CREATED valid=" + holder.getSurface().isValid());
            }

            @Override public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
                Rect frame = holder.getSurfaceFrame();
                logDisplayGeometry("SURFACE_CHANGED", width, height,
                        surfaceView.getWidth(), surfaceView.getHeight());
                Log.i(TAG, "ANDROID_SURFACE_FRAME rect=" + frame.flattenToString()
                        + " format=" + format + " valid=" + holder.getSurface().isValid());
                if (created) {
                    NATIVE.execute(() -> {
                        if (!nativeM4SurfaceChanged(width, height)) Log.e(TAG, "VULKAN_RESIZE_FAIL");
                    });
                    return;
                }
                created = true;
                Surface surface = holder.getSurface();
                NATIVE.execute(() -> {
                    boolean ready = nativeM4SurfaceCreated(surface, width, height, 1);
                    if (!ready) {
                        Log.e(TAG, "ANDROID_WSI_INIT_FAIL");
                        return;
                    }
                    surfaceReady = true;
                    startXbox(directory);
                });
            }

            @Override public void surfaceDestroyed(SurfaceHolder holder) {
                Log.i(TAG, "ANDROID_SURFACE_DESTROYED");
                NATIVE.execute(() -> {
                    nativeM4SurfaceDestroyed();
                    surfaceReady = false;
                });
            }
        });
    }

    private void logDisplayGeometry(String event, int surfaceWidth, int surfaceHeight,
                                    int viewWidth, int viewHeight) {
        Display display = getWindowManager().getDefaultDisplay();
        Display.Mode mode = display.getMode();
        int orientation = getResources().getConfiguration().orientation;
        String orientationName = orientation == Configuration.ORIENTATION_LANDSCAPE
                ? "LANDSCAPE" : orientation == Configuration.ORIENTATION_PORTRAIT
                ? "PORTRAIT" : "UNDEFINED";
        Log.i(TAG, "ANDROID_GEOMETRY event=" + event + " display_rotation="
                + display.getRotation() + " config_orientation=" + orientationName
                + " requested_orientation=" + getRequestedOrientation()
                + " mode=" + mode.getPhysicalWidth() + "x" + mode.getPhysicalHeight()
                + " holder=" + surfaceWidth + "x" + surfaceHeight
                + " surfaceView=" + viewWidth + "x" + viewHeight);
    }

    private void startXbox(File directory) {
        if (xboxStarted) return;
        File bios = new File(directory, "bios.bin");
        File mcpx = new File(directory, "mcpx.bin");
        File hdd = new File(directory, "hdd.qcow2");
        File log = new File(getFilesDir(), "m5-qemu.log");
        if (!bios.canRead() || !mcpx.canRead() || !hdd.canRead()) {
            Log.e(TAG, "FIRMWARE_STAGE_MISSING bios=" + bios.canRead() +
                    " mcpx=" + mcpx.canRead() + " hdd=" + hdd.canRead());
            return;
        }
        xboxStarted = true;
        Log.i(TAG, "XBOX_START_REQUEST machine=xbox target=tcg guest=i386 host=aarch64");
        NATIVE.execute(() -> {
            int result = nativeXboxStart(bios.getAbsolutePath(), mcpx.getAbsolutePath(),
                    hdd.getAbsolutePath(), log.getAbsolutePath());
            Log.i(TAG, "XBOX_INIT_RESULT=" + result + " qemu_log=" + log.getAbsolutePath());
        });
    }

    @Override
    protected void onStop() {
        super.onStop();
        if (xboxStarted && !stopping) {
            stopping = true;
            NATIVE.execute(() -> {
                Log.i(TAG, "XBOX_STOP_RESULT=" + nativeXboxStop());
                Log.i(TAG, "VULKAN_DIAGNOSTICS=" + nativeM4Diagnostics());
                nativeM4Shutdown();
                Log.i(TAG, "M5_SHUTDOWN_COMPLETE");
            });
        }
    }

    @Override
    protected void onDestroy() {
        if (!stopping) {
            stopping = true;
            NATIVE.execute(() -> {
                if (xboxStarted) Log.i(TAG, "XBOX_STOP_RESULT=" + nativeXboxStop());
                Log.i(TAG, "VULKAN_DIAGNOSTICS=" + nativeM4Diagnostics());
                nativeM4Shutdown();
                Log.i(TAG, "M5_SHUTDOWN_COMPLETE");
            });
        }
        super.onDestroy();
    }
}
