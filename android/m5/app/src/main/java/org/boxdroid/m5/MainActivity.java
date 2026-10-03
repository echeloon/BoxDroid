package org.boxdroid.m5;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.widget.FrameLayout;

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
        configurePresentationWindow();
        logDisplayGeometry("ACTIVITY_CREATE", 0, 0, 0, 0);
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(Color.BLACK);
        SurfaceView surfaceView = new SurfaceView(this);
        // Let Android size the surface buffers to the actual available view.
        // Guest aspect fitting belongs to the native presenter, not this view.
        surfaceView.getHolder().setSizeFromLayout();
        root.addView(surfaceView, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
        setContentView(root);
        File directory = new File(getExternalFilesDir(null), "m5");
        Log.i(TAG, "M5_PATHS directory=" + directory.getAbsolutePath());
        surfaceView.getHolder().addCallback(new SurfaceHolder.Callback() {
            private boolean created;
            private int generation;

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
                final int currentGeneration = ++generation;
                Surface surface = holder.getSurface();
                NATIVE.execute(() -> {
                    boolean ready = nativeM4SurfaceCreated(surface, width, height, currentGeneration);
                    if (!ready) {
                        Log.e(TAG, "ANDROID_WSI_INIT_FAIL");
                        return;
                    }
                    surfaceReady = true;
                    Log.i(TAG, "M5_VIDEO_PRESENTER_READY surface_generation=" + currentGeneration);
                    startXbox(directory);
                });
            }

            @Override public void surfaceDestroyed(SurfaceHolder holder) {
                Log.i(TAG, "ANDROID_SURFACE_DESTROYED");
                created = false;
                NATIVE.execute(() -> {
                    nativeM4SurfaceDestroyed();
                    surfaceReady = false;
                });
            }
        });
    }

    private void configurePresentationWindow() {
        getWindow().getDecorView().setBackgroundColor(Color.BLACK);
        getWindow().setStatusBarColor(Color.BLACK);
        getWindow().setNavigationBarColor(Color.BLACK);
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
                View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY | View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
    }

    @Override
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        configurePresentationWindow();
        logDisplayGeometry("CONFIGURATION_CHANGED", 0, 0, 0, 0);
        // SurfaceHolder delivers the new dimensions; keep the native guest alive.
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
