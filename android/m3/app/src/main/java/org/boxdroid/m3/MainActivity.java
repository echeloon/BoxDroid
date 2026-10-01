package org.boxdroid.m3;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public final class MainActivity extends Activity {
    private static final String TAG = "BoxDroidM3";
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static boolean started;

    static {
        System.loadLibrary("boxdroid");
        Log.i(TAG, "LIBRARY_LOAD_OK libboxdroid.so");
    }

    private native int nativeRunTcgTest(String guestPath, String serialPath, String tracePath);

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        TextView status = new TextView(this);
        status.setPadding(32, 32, 32, 32);
        status.setTextSize(18);
        status.setText("BoxDroid M3: starting headless AArch64 TCG test…");
        setContentView(status);

        synchronized (MainActivity.class) {
            if (started) {
                status.setText("M3 test already ran in this process; force-stop and relaunch to repeat.");
                return;
            }
            started = true;
        }
        EXECUTOR.execute(() -> {
            int result = runTest();
            String outcome = result == 0 ? "PASS" : "FAIL";
            String summary = "M3_RESULT=" + outcome + " native_result=" + result;
            try {
                write(new File(getFilesDir(), "m3-result.txt"), summary + "\n");
            } catch (IOException e) {
                Log.e(TAG, "RESULT_WRITE_FAIL", e);
            }
            Log.i(TAG, summary);
            runOnUiThread(() -> status.setText(summary + "\nDetails: app-private files"));
        });
    }

    private int runTest() {
        File guest = new File(getFilesDir(), "guest.elf");
        File serial = new File(getFilesDir(), "guest-uart.log");
        File trace = new File(getFilesDir(), "qemu-tcg.log");
        try (InputStream in = getAssets().open("guest.elf");
             FileOutputStream out = new FileOutputStream(guest, false)) {
            byte[] buffer = new byte[8192];
            int n;
            while ((n = in.read(buffer)) != -1) out.write(buffer, 0, n);
            out.getFD().sync();
            serial.delete();
            trace.delete();
            new File(getFilesDir(), "m3-result.txt").delete();
        } catch (IOException e) {
            Log.e(TAG, "GUEST_ASSET_COPY_FAIL", e);
            return -100;
        }
        Log.i(TAG, "NATIVE_TEST_START guest=" + guest.getAbsolutePath());
        return nativeRunTcgTest(guest.getAbsolutePath(), serial.getAbsolutePath(),
                trace.getAbsolutePath());
    }

    private static void write(File file, String text) throws IOException {
        try (FileOutputStream out = new FileOutputStream(file, false)) {
            out.write(text.getBytes(StandardCharsets.UTF_8));
            out.getFD().sync();
        }
    }
}
