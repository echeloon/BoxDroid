package org.boxdroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import java.io.File;

/** Never load imported native code in the frontend process. One probe per fresh process. */
public final class GraphicsDriverProbe extends Activity {
    static { System.loadLibrary("boxdroid_driver"); }
    private static native String nativeProbe(String hooks, String directory, String library, String temporary);
    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            setResult(RESULT_CANCELED, new Intent().putExtra("error", "Driver validation timed out"));
            finish();
        }, 30000);
        new Thread(() -> {
            String error;
            try {
                File directory = new File(getIntent().getStringExtra("directory"));
                GraphicsDriverStore store = new GraphicsDriverStore(this);
                if (!directory.getCanonicalFile().getParentFile().equals(store.installed().getCanonicalFile().getParentFile()) || !directory.getName().startsWith("staging-")) throw new Exception("Invalid probe directory");
                String library = store.metadata(directory).getString("libraryName");
                error = nativeProbe(getApplicationInfo().nativeLibraryDir, directory.getAbsolutePath(), library, getCacheDir().getAbsolutePath());
            } catch (Exception e) { error = e.getMessage(); }
            final String result = error;
            runOnUiThread(() -> { setResult(result.isEmpty() ? RESULT_OK : RESULT_CANCELED, new Intent().putExtra("error", result)); finish(); });
        }, "DriverValidation").start();
    }
    @Override public void onDestroy() { super.onDestroy(); android.os.Process.killProcess(android.os.Process.myPid()); }
}
