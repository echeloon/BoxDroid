package org.boxdroid.m0probe;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONObject;

import java.io.File;

public final class MainActivity extends Activity implements SurfaceHolder.Callback {
    private static final String TAG = "BoxDroidM0";
    static {
        System.loadLibrary("boxdroid_m0");
    }

    private TextView statusView;
    private boolean nativeStarted;

    private native String nativeInit(String reportPath, String deviceJson);
    private native String nativeSurfaceCreated(Surface surface, int width, int height);
    private native String nativeSurfaceChanged(Surface surface, int width, int height);
    private native void nativeSurfaceDestroyed();
    private native void nativeShutdown();

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(24, 24, 24, 24);

        TextView title = new TextView(this);
        title.setText("BoxDroid M0 capability probe\nVulkan · Android WSI · executable memory");
        title.setTextSize(18);
        root.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        statusView = new TextView(this);
        statusView.setText("Collecting device and Vulkan capabilities…");
        statusView.setTextIsSelectable(true);
        root.addView(statusView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        SurfaceView surfaceView = new SurfaceView(this);
        root.addView(surfaceView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));
        surfaceView.getHolder().addCallback(this);
        setContentView(root);

        File report = new File(getExternalFilesDir(null), "m0-report.json");
        try {
            JSONObject device = new JSONObject();
            device.put("manufacturer", Build.MANUFACTURER);
            device.put("model", Build.MODEL);
            device.put("device", Build.DEVICE);
            device.put("product", Build.PRODUCT);
            device.put("hardware", Build.HARDWARE);
            device.put("build_fingerprint", Build.FINGERPRINT);
            device.put("soc_manufacturer", Build.VERSION.SDK_INT >= 31 ? Build.SOC_MANUFACTURER : "unavailable_before_api_31");
            device.put("soc_model", Build.VERSION.SDK_INT >= 31 ? Build.SOC_MODEL : "unavailable_before_api_31");
            device.put("android_release", Build.VERSION.RELEASE);
            device.put("api_level", Build.VERSION.SDK_INT);
            device.put("abi", Build.SUPPORTED_ABIS.length == 0 ? "unknown" : Build.SUPPORTED_ABIS[0]);
            device.put("supported_abis", new org.json.JSONArray(Build.SUPPORTED_ABIS));
            device.put("java_os_arch", System.getProperty("os.arch", "unknown"));
            device.put("available_processors", Runtime.getRuntime().availableProcessors());
            String summary = nativeInit(report.getAbsolutePath(), device.toString());
            nativeStarted = true;
            statusView.setText(summary);
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize probe", e);
            statusView.setText("Probe initialization failed: " + e);
        }
    }

    private void showNativeSummary(String prefix, String summary) {
        if (summary != null) {
            statusView.setText(prefix + "\n" + summary + "\nReport: "
                    + new File(getExternalFilesDir(null), "m0-report.json").getAbsolutePath());
        }
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        if (!nativeStarted) return;
        Surface surface = holder.getSurface();
        android.graphics.Rect frame = holder.getSurfaceFrame();
        String summary = nativeSurfaceCreated(surface, Math.max(1, frame.width()), Math.max(1, frame.height()));
        showNativeSummary("Vulkan surface created", summary);
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        if (!nativeStarted) return;
        String summary = nativeSurfaceChanged(holder.getSurface(), width, height);
        showNativeSummary("Surface changed / swapchain recreated", summary);
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        if (nativeStarted) {
            nativeSurfaceDestroyed();
            statusView.setText("Surface destroyed; Vulkan surface and swapchain released.\n"
                    + new File(getExternalFilesDir(null), "m0-report.json").getAbsolutePath());
        }
    }

    @Override
    protected void onDestroy() {
        if (nativeStarted) {
            nativeShutdown();
            nativeStarted = false;
        }
        super.onDestroy();
    }
}
