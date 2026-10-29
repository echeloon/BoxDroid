package org.boxdroid;

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

public class MainActivity extends Activity {
    private static final String TAG = "BoxDroid_";
    private static final ExecutorService NATIVE = Executors.newSingleThreadExecutor();
    private boolean surfaceReady;
    private boolean graphicsConfigured;
    private boolean customGraphics;
    private GraphicsDriverStore graphicsDrivers;
    private native String nativeConfigureGraphicsDriver(String hooks, String directory, String library, String temporary);

    private void configureGraphicsDriver() {
        if (graphicsConfigured) return;
        graphicsConfigured = true;
        graphicsDrivers = new GraphicsDriverStore(this);
        org.json.JSONObject choice = graphicsDrivers.read();
        if (!choice.optString("mode", "SYSTEM").equals("CUSTOM")) {
            Log.i("BoxDroid-Driver", "LOADER_SELECTED mode=SYSTEM override=none");
            return;
        }
        try {
            graphicsDrivers.startupMarker().createNewFile();
            org.json.JSONObject metadata = graphicsDrivers.metadata(graphicsDrivers.installed());
            String error = nativeConfigureGraphicsDriver(getApplicationInfo().nativeLibraryDir,
                graphicsDrivers.installed().getAbsolutePath(), metadata.getString("libraryName"), getCacheDir().getAbsolutePath());
            if (!error.isEmpty()) throw new Exception(error);
            customGraphics = true;
            Log.i("BoxDroid-Driver", "LOADER_SELECTED mode=CUSTOM before=presenter-instance-and-xemu-instance");
        } catch (Exception e) { graphicsDrivers.fallback(e.getMessage()); }
    }

    private void graphicsStartResult(int result) {
        if (!customGraphics) return;
        if (result == 0) graphicsDrivers.startupMarker().delete();
        else graphicsDrivers.fallback("Custom Vulkan runtime initialization failed: " + result);
    }
    private boolean xboxStarted;
    private boolean stopping;
    private android.os.ParcelFileDescriptor biosFd;
    private android.os.ParcelFileDescriptor mcpxFd;
    private android.os.ParcelFileDescriptor hddFd;

    static {
        System.loadLibrary("boxdroid");
        Log.i(TAG, "LIBRARY_LOAD_OK libboxdroid.so");
    }

    private native int nativeXboxStart(String bios, String mcpx, String hdd, String log);
    /** Android-only entry point: the selected document FD is passed into QEMU's DVD block path. */
    protected native int nativeXboxStartWithDvd(String bios, String mcpx, String hdd, String log,
                                                 int dvdFd, long dvdSize);
    private native int nativeXboxStop();
    private native int nativeXboxSetPaused(boolean paused);
    private native int nativeXboxSaveState(String name);
    private native int nativeXboxLoadState(String name);
    private native String nativeXboxListStates(String prefix);
    private native void nativeXboxSetWidescreen(boolean widescreen);
    private native void nativeXboxSetConsoleSettings(int language, int videoMode);

    /**
     * Console language and video mode chosen in the frontend's settings, written
     * to the EEPROM at start; -1 keeps the EEPROM's own value. Runs on the
     * native executor just before the runtime starts.
     */
    private void applyConsoleSettings() {
        android.content.SharedPreferences prefs = getSharedPreferences("boxdroid_games", MODE_PRIVATE);
        nativeXboxSetConsoleSettings(prefs.getInt("console_language", -1), prefs.getInt("video_mode", -1));
    }
    private native boolean nativeSurfaceCreated(Surface surface, int width, int height, int generation);
    private native boolean nativeSurfaceChanged(int width, int height);
    private native void nativeSurfaceDestroyed();
    private native String nativeDiagnostics();
    private native void nativeShutdown();
    private native void nativeSetAspectMode(int mode);
    private native void nativeSetScalingFilter(int filter);

    /** Hook for isolated milestone apps that need host setup before QEMU starts. */
    protected void beforeNativeRuntimeStart() { }

    /** Called after the Android surface/presenter is ready; overrides this to wait for SAF. */
    protected void onVideoPresenterReady(File directory) { startXbox(directory); }

    /** Called after the Android surface is destroyed. */
    protected void onVideoPresenterUnavailable() { }

    /** Existing milestone apps stop QEMU when backgrounded. */
    protected boolean stopRuntimeOnActivityStop() { return true; }

    /** Runs on the native executor after QEMU has stopped. */
    protected void afterNativeRuntimeStop() {
        if (biosFd != null) { try { biosFd.close(); } catch (Exception e) {} biosFd = null; }
        if (mcpxFd != null) { try { mcpxFd.close(); } catch (Exception e) {} mcpxFd = null; }
        if (hddFd != null) { try { hddFd.close(); } catch (Exception e) {} hddFd = null; }
    }

    /** True once the guest has started and no shutdown has been requested. */
    protected final boolean isGuestRunning() {
        return xboxStarted && !stopping;
    }

    /**
     * Pauses or resumes the guest. Runs on the native executor, so it is
     * ordered with start and stop; the callback runs on the UI thread.
     */
    protected final void setGuestPaused(boolean paused, java.util.function.IntConsumer onResult) {
        NATIVE.execute(() -> {
            int result = xboxStarted && !stopping ? nativeXboxSetPaused(paused) : -1;
            if (onResult != null) runOnUiThread(() -> onResult.accept(result));
        });
    }

    /**
     * Saves the paused guest into the hard disk snapshot {@code name}, replacing
     * one with the same name. Runs on the native executor; the callback runs on
     * the UI thread with 0 on success.
     */
    protected final void saveGuestState(String name, java.util.function.IntConsumer onResult) {
        NATIVE.execute(() -> {
            int result = xboxStarted && !stopping ? nativeXboxSaveState(name) : -1;
            runOnUiThread(() -> onResult.accept(result));
        });
    }

    /** Loads snapshot {@code name} into the paused guest; resuming continues from it. */
    protected final void loadGuestState(String name, java.util.function.IntConsumer onResult) {
        NATIVE.execute(() -> {
            int result = xboxStarted && !stopping ? nativeXboxLoadState(name) : -1;
            runOnUiThread(() -> onResult.accept(result));
        });
    }

    /**
     * Lists the snapshots whose name starts with {@code prefix} as name to Unix
     * time in seconds; the callback receives null when they can't be read.
     */
    protected final void listGuestStates(String prefix,
                                         java.util.function.Consumer<java.util.Map<String, Long>> onResult) {
        NATIVE.execute(() -> {
            String listing = xboxStarted && !stopping ? nativeXboxListStates(prefix) : null;
            java.util.Map<String, Long> states = null;
            if (listing != null) {
                states = new java.util.HashMap<>();
                for (String line : listing.split("\n")) {
                    int tab = line.indexOf('\t');
                    if (tab > 0) states.put(line.substring(0, tab), Long.parseLong(line.substring(tab + 1)));
                }
            }
            java.util.Map<String, Long> result = states;
            runOnUiThread(() -> onResult.accept(result));
        });
    }

    /**
     * Sets how the presenter fits the guest frame to the screen; ordered with
     * start and shutdown on the native executor.
     */
    protected final void applyAspectMode(int mode) {
        NATIVE.execute(() -> nativeSetAspectMode(mode));
    }

    /**
     * Sets the console's widescreen video setting in its EEPROM before the next
     * start; the guest reads it at boot.
     */
    protected final void setConsoleWidescreen(boolean widescreen) {
        NATIVE.execute(() -> nativeXboxSetWidescreen(widescreen));
    }

    /** Sets the filter the presenter scales the guest frame with. */
    protected final void applyScalingFilter(int filter) {
        NATIVE.execute(() -> nativeSetScalingFilter(filter));
    }

    /** Stop the native runtime in order before closing this milestone app. */
    protected final void shutdownNativeRuntimeAndFinish() {
        if (stopping) return;
        stopping = true;
        NATIVE.execute(() -> {
            if (xboxStarted) Log.i(TAG, "XBOX_STOP_RESULT=" + nativeXboxStop());
            Log.i(TAG, "VULKAN_DIAGNOSTICS=" + nativeDiagnostics());
            afterNativeRuntimeStop();
            nativeShutdown();
            Log.i(TAG, "SHUTDOWN_COMPLETE");
            runOnUiThread(this::finish);
        });
    }

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
        File directory = getExternalFilesDir(null);
        Log.i(TAG, "PATHS directory=" + directory.getAbsolutePath());
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
                        if (!nativeSurfaceChanged(width, height)) Log.e(TAG, "VULKAN_RESIZE_FAIL");
                    });
                    return;
                }
                created = true;
                final int currentGeneration = ++generation;
                Surface surface = holder.getSurface();
                NATIVE.execute(() -> {
                    configureGraphicsDriver();
                    boolean ready = nativeSurfaceCreated(surface, width, height, currentGeneration);
                    if (!ready) {
                        Log.e(TAG, "ANDROID_WSI_INIT_FAIL");
                        if (customGraphics) graphicsDrivers.fallback("Custom Vulkan Android surface initialization failed; next launch uses System Driver");
                        runOnUiThread(thisActivity()::finish);
                        return;
                    }
                    surfaceReady = true;
                    Log.i(TAG, "VIDEO_PRESENTER_READY surface_generation=" + currentGeneration);
                    onVideoPresenterReady(directory);
                });
            }

            @Override public void surfaceDestroyed(SurfaceHolder holder) {
                Log.i(TAG, "ANDROID_SURFACE_DESTROYED");
                created = false;
                NATIVE.execute(() -> {
                    nativeSurfaceDestroyed();
                    surfaceReady = false;
                    onVideoPresenterUnavailable();
                });
            }
        });
    }

    private MainActivity thisActivity() { return this; }

    /**
     * Sticky immersive lets an edge swipe show the bars only transiently, without
     * telling the app. Return false to use plain immersive, where the revealed bars
     * stay visible and are reported through window insets.
     */
    protected boolean stickyImmersive() { return true; }

    /** Hides the system bars again, e.g. after an edge swipe revealed them. */
    protected final void configurePresentationWindow() {
        getWindow().getDecorView().setBackgroundColor(Color.BLACK);
        getWindow().setStatusBarColor(Color.BLACK);
        getWindow().setNavigationBarColor(Color.BLACK);
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
                (stickyImmersive() ? View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY : View.SYSTEM_UI_FLAG_IMMERSIVE) |
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
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
        
        android.content.SharedPreferences prefs = getSharedPreferences("boxdroid_games", android.content.Context.MODE_PRIVATE);
        String biosUriStr = prefs.getString("bios_uri", null);
        String mcpxUriStr = prefs.getString("mcpx_uri", null);
        String hddUriStr = prefs.getString("hdd_uri", null);
        File log = new File(getFilesDir(), "qemu.log");

        String biosPath;
        String mcpxPath;
        String hddPath;

        if (biosUriStr != null && mcpxUriStr != null && hddUriStr != null) {
            try {
                biosFd = getContentResolver().openFileDescriptor(android.net.Uri.parse(biosUriStr), "r");
                mcpxFd = getContentResolver().openFileDescriptor(android.net.Uri.parse(mcpxUriStr), "r");
                hddFd = getContentResolver().openFileDescriptor(android.net.Uri.parse(hddUriStr), "rw");
                
                biosPath = "/proc/self/fd/" + biosFd.getFd();
                mcpxPath = "/proc/self/fd/" + mcpxFd.getFd();
                hddPath = "/proc/self/fd/" + hddFd.getFd();
            } catch (Exception e) {
                Log.e(TAG, "Failed to open system files", e);
                return;
            }
        } else {
            File bios = new File(directory, "bios.bin");
            File mcpx = new File(directory, "mcpx.bin");
            File hdd = new File(directory, "hdd.qcow2");
            if (!bios.canRead() || !mcpx.canRead() || !hdd.canRead()) {
                Log.e(TAG, "FIRMWARE_STAGE_MISSING bios=" + bios.canRead() +
                        " mcpx=" + mcpx.canRead() + " hdd=" + hdd.canRead());
                return;
            }
            biosPath = bios.getAbsolutePath();
            mcpxPath = mcpx.getAbsolutePath();
            hddPath = hdd.getAbsolutePath();
        }

        xboxStarted = true;
        Log.i(TAG, "XBOX_START_REQUEST machine=xbox target=tcg guest=i386 host=aarch64");
        NATIVE.execute(() -> {
            beforeNativeRuntimeStart();
            applyConsoleSettings();
            int result = nativeXboxStart(biosPath, mcpxPath,
                    hddPath, log.getAbsolutePath());
            graphicsStartResult(result);
            Log.i(TAG, "XBOX_INIT_RESULT=" + result + " qemu_log=" + log.getAbsolutePath());
        });
    }

    /** Starts the existing Xbox runtime only after a caller has validated a selected DVD FD. */
    protected final void startXboxWithDvd(File directory, int dvdFd, long dvdSize) {
        if (xboxStarted || stopping) return;
        
        android.content.SharedPreferences prefs = getSharedPreferences("boxdroid_games", android.content.Context.MODE_PRIVATE);
        String biosUriStr = prefs.getString("bios_uri", null);
        String mcpxUriStr = prefs.getString("mcpx_uri", null);
        String hddUriStr = prefs.getString("hdd_uri", null);
        File log = new File(getFilesDir(), "qemu.log");

        String biosPath;
        String mcpxPath;
        String hddPath;

        if (biosUriStr != null && mcpxUriStr != null && hddUriStr != null) {
            try {
                biosFd = getContentResolver().openFileDescriptor(android.net.Uri.parse(biosUriStr), "r");
                mcpxFd = getContentResolver().openFileDescriptor(android.net.Uri.parse(mcpxUriStr), "r");
                hddFd = getContentResolver().openFileDescriptor(android.net.Uri.parse(hddUriStr), "rw");
                
                long biosSize = biosFd.getStatSize();
                long mcpxSize = mcpxFd.getStatSize();
                long hddSize = hddFd.getStatSize();

                
                biosPath = "/proc/self/fd/" + biosFd.getFd();
                mcpxPath = "/proc/self/fd/" + mcpxFd.getFd();
                hddPath = "/proc/self/fd/" + hddFd.getFd();
            } catch (Exception e) {
                Log.e(TAG, "Failed to open system files", e);
                onSelectedDvdStartResult(-1);
                return;
            }
        } else {
            File bios = new File(directory, "bios.bin");
            File mcpx = new File(directory, "mcpx.bin");
            File hdd = new File(directory, "hdd.qcow2");
            if (!bios.canRead() || !mcpx.canRead() || !hdd.canRead() || dvdFd < 0) {
                Log.e(TAG, "START_REJECTED bios=" + bios.canRead() + " mcpx=" + mcpx.canRead()
                        + " hdd=" + hdd.canRead() + " fd_valid=" + (dvdFd >= 0));
                onSelectedDvdStartResult(-1);
                return;
            }
            biosPath = bios.getAbsolutePath();
            mcpxPath = mcpx.getAbsolutePath();
            hddPath = hdd.getAbsolutePath();
        }

        xboxStarted = true;
        NATIVE.execute(() -> {
            beforeNativeRuntimeStart();
            applyConsoleSettings();
            Log.i(TAG, "EMULATOR_START_REQUEST dvd_fd_validated=1 dvd_size=" + dvdSize);
            int result = nativeXboxStartWithDvd(biosPath, mcpxPath,
                    hddPath, log.getAbsolutePath(), dvdFd, dvdSize);
            graphicsStartResult(result);
            Log.i(TAG, "EMULATOR_START_RESULT=" + result);
            if (result != 0) xboxStarted = false;
            final int startResult = result;
            runOnUiThread(() -> onSelectedDvdStartResult(startResult));
        });
    }

    /** Result hook for isolated flows that provide startup media themselves. */
    protected void onSelectedDvdStartResult(int result) { }

    @Override
    protected void onStop() {
        super.onStop();
        if (stopRuntimeOnActivityStop() && xboxStarted && !stopping) {
            stopping = true;
            NATIVE.execute(() -> {
                Log.i(TAG, "XBOX_STOP_RESULT=" + nativeXboxStop());
                Log.i(TAG, "VULKAN_DIAGNOSTICS=" + nativeDiagnostics());
                afterNativeRuntimeStop();
                nativeShutdown();
                Log.i(TAG, "SHUTDOWN_COMPLETE");
            });
        }
    }

    @Override
    protected void onDestroy() {
        if (!stopping) {
            stopping = true;
            NATIVE.execute(() -> {
                if (xboxStarted) Log.i(TAG, "XBOX_STOP_RESULT=" + nativeXboxStop());
                Log.i(TAG, "VULKAN_DIAGNOSTICS=" + nativeDiagnostics());
                afterNativeRuntimeStop();
                nativeShutdown();
                Log.i(TAG, "SHUTDOWN_COMPLETE");
            });
        }
        super.onDestroy();
    }
}
