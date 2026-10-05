package org.boxdroid.m61;

import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.provider.OpenableColumns;
import android.system.ErrnoException;
import android.system.Os;
import android.system.StructStat;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.boxdroid.m6.M6Activity;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;

/** Picker-gated Xbox game boot validation. No guest runtime starts before a selected DVD is ready. */
public class M61Activity extends M6Activity {
    private static final String TAG = "BoxDroidM61";
    private static final int REQUEST_XISO = 6101;
    private static final String[] MIME_TYPES = {
            "application/x-iso9660-image", "application/x-cd-image",
            "application/x-iso-image", "application/octet-stream"
    };

    private FrameLayout controls;
    private TextView stateText;
    private Button chooseButton;
    private File runtimeDirectory;
    private ParcelFileDescriptor dvdDescriptor;
    private Uri selectedUri;
    private String selectedName = "(unknown)";
    private String selectedMime = "(unknown)";
    private long selectedSize;
    private boolean persistablePermission;
    private boolean presenterReady;
    private boolean pickerInFlight;
    private boolean pickerShownThisLaunch;
    private boolean startRequested;
    private boolean runtimeStarted;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        addSelectionControls();
        Log.i(TAG, "M61_STATE_IDLE emulator=stopped mcpx=stopped bios=stopped dvd=none");
        Log.i(TAG, "M61_EMULATOR_NOT_STARTED reason=awaiting_user_selected_dvd");
    }

    private void addSelectionControls() {
        FrameLayout content = findViewById(android.R.id.content);
        controls = new FrameLayout(this);
        controls.setBackgroundColor(0xB0202020);
        LinearLayout stack = new LinearLayout(this);
        stack.setOrientation(LinearLayout.VERTICAL);
        stack.setGravity(Gravity.CENTER);
        int pad = dp(12);
        stack.setPadding(pad, pad, pad, pad);
        stateText = new TextView(this);
        stateText.setTextColor(0xffffffff);
        stateText.setText("Waiting for display surface; emulator is stopped.");
        chooseButton = new Button(this);
        chooseButton.setText("Choose Xbox XISO");
        chooseButton.setOnClickListener(view -> launchPicker("button"));
        stack.addView(stateText);
        stack.addView(chooseButton);
        controls.addView(stack, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER));
        FrameLayout.LayoutParams placement = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT);
        content.addView(controls, placement);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    @Override
    protected void onVideoPresenterReady(File directory) {
        runtimeDirectory = directory;
        runOnUiThread(() -> {
            presenterReady = true;
            Log.i(TAG, "M61_PRESENTER_READY guest_runtime=stopped");
            if (dvdDescriptor != null) {
                maybeStartAfterSelection();
            } else if (!pickerShownThisLaunch) {
                pickerShownThisLaunch = true;
                launchPicker("presenter_ready");
            } else {
                showIdle("No image selected. Choose an Xbox XISO to continue.");
            }
        });
    }

    @Override
    protected void onVideoPresenterUnavailable() {
        runOnUiThread(() -> presenterReady = false);
    }

    private void launchPicker(String reason) {
        if (pickerInFlight || startRequested || runtimeStarted) return;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        picker.addCategory(Intent.CATEGORY_OPENABLE);
        picker.setType("*/*");
        picker.putExtra(Intent.EXTRA_MIME_TYPES, MIME_TYPES);
        picker.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, false);
        pickerInFlight = true;
        pickerShownThisLaunch = true;
        chooseButton.setEnabled(false);
        stateText.setText("Select an Xbox game image. The emulator is stopped.");
        Log.i(TAG, "M61_PICKER_LAUNCHED action=ACTION_OPEN_DOCUMENT multiple=0 reason=" + reason);
        try {
            startActivityForResult(picker, REQUEST_XISO);
        } catch (RuntimeException error) {
            pickerInFlight = false;
            Log.e(TAG, "M61_PICKER_LAUNCH_FAILED", error);
            showIdle("Picker could not be opened. Tap to retry.");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_XISO) return;
        pickerInFlight = false;
        Uri uri = data == null ? null : data.getData();
        if (resultCode != RESULT_OK || uri == null) {
            Log.i(TAG, "M61_PICKER_CANCELLED emulator=stopped");
            showIdle("No game selected. Tap to choose an Xbox XISO.");
            return;
        }
        selectedUri = uri;
        Log.i(TAG, "M61_URI_SELECTED uri=" + uri);
        validateSelectedDocument(data);
    }

    private void validateSelectedDocument(Intent result) {
        String displayName = queryDisplayName(selectedUri);
        long providerSize = querySize(selectedUri);
        String mime = queryMime(selectedUri);
        if (mime != null) selectedMime = mime;
        if (displayName != null && !displayName.isEmpty()) selectedName = displayName;

        int grantFlags = result.getFlags();
        int readFlag = grantFlags & Intent.FLAG_GRANT_READ_URI_PERMISSION;
        boolean persistable = (grantFlags & Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION) != 0;
        if (persistable && readFlag != 0) {
            try {
                getContentResolver().takePersistableUriPermission(selectedUri, readFlag);
                persistablePermission = true;
            } catch (SecurityException error) {
                Log.w(TAG, "M61_URI_PERSIST_PERMISSION_UNAVAILABLE; retaining open descriptor");
            }
        }

        ParcelFileDescriptor opened = null;
        try {
            opened = getContentResolver().openFileDescriptor(selectedUri, "r");
            if (opened == null) throw new IOException("provider returned no file descriptor");
            StructStat stat = Os.fstat(opened.getFileDescriptor());
            long fdSize = stat.st_size;
            if (fdSize < 2048) throw new IOException("image is empty or too small for a disc image");
            ByteBuffer first = ByteBuffer.allocate(1);
            ByteBuffer last = ByteBuffer.allocate(1);
            int firstCount = Os.pread(opened.getFileDescriptor(), first, 0);
            int lastCount = Os.pread(opened.getFileDescriptor(), last, fdSize - 1);
            if (firstCount != 1 || lastCount != 1) {
                throw new IOException("document does not support random-access reads");
            }
            selectedSize = fdSize;
            dvdDescriptor = opened;
            opened = null;
            Log.i(TAG, "M61_URI_VALIDATED uri=" + selectedUri + " name=" + selectedName
                    + " provider_size=" + providerSize + " fd_size=" + selectedSize
                    + " mime=" + selectedMime + " read=1 random_access=1 fd="
                    + dvdDescriptor.getFd() + " persistable=" + persistablePermission);
            stateText.setText("Selected: " + selectedName + " (" + selectedSize
                    + " bytes). Preparing the Xbox DVD.");
            chooseButton.setVisibility(View.GONE);
            maybeStartAfterSelection();
        } catch (IOException | ErrnoException | RuntimeException error) {
            closeQuietly(opened);
            releasePersistedPermission();
            Log.e(TAG, "M61_URI_VALIDATION_FAILED uri=" + selectedUri + " name="
                    + selectedName + " mime=" + selectedMime + " provider_size="
                    + providerSize + " reason=" + error.getClass().getSimpleName(), error);
            Toast.makeText(this, "Selected document is unreadable or not seekable.",
                    Toast.LENGTH_LONG).show();
            resetSelection();
            showIdle("Image access failed. Choose another Xbox XISO.");
        }
    }

    private String queryDisplayName(Uri uri) {
        try (Cursor cursor = getContentResolver().query(uri,
                new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                int column = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                if (column >= 0) return cursor.getString(column);
            }
        } catch (RuntimeException error) {
            Log.w(TAG, "M61_URI_NAME_UNAVAILABLE");
        }
        return null;
    }

    private long querySize(Uri uri) {
        try (Cursor cursor = getContentResolver().query(uri,
                new String[]{OpenableColumns.SIZE}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                int column = cursor.getColumnIndex(OpenableColumns.SIZE);
                if (column >= 0 && !cursor.isNull(column)) return cursor.getLong(column);
            }
        } catch (RuntimeException error) {
            Log.w(TAG, "M61_URI_SIZE_UNAVAILABLE");
        }
        return -1;
    }

    private String queryMime(Uri uri) {
        try {
            return getContentResolver().getType(uri);
        } catch (RuntimeException error) {
            Log.w(TAG, "M61_URI_MIME_UNAVAILABLE");
            return null;
        }
    }

    private void maybeStartAfterSelection() {
        if (!presenterReady || dvdDescriptor == null || startRequested || runtimeStarted) return;
        startRequested = true;
        chooseButton.setEnabled(false);
        stateText.setText("Attaching selected DVD and starting Xbox boot…");
        Log.i(TAG, "M61_DVD_ATTACH_REQUEST uri=" + selectedUri + " fd="
                + dvdDescriptor.getFd() + " bytes=" + selectedSize);
        startXboxWithDvd(runtimeDirectory, dvdDescriptor.getFd(), selectedSize);
    }

    @Override
    protected void onSelectedDvdStartResult(int result) {
        if (result == 0) {
            runtimeStarted = true;
            controls.setVisibility(View.GONE);
            Log.i(TAG, "M61_GAME_BOOT_ATTEMPT start_result=0 dvd_selected=1");
            return;
        }
        startRequested = false;
        Log.e(TAG, "M61_EMULATOR_START_FAILED result=" + result + " emulator_stopped=1");
        Toast.makeText(this, "Xbox startup failed. Select the image again to retry.",
                Toast.LENGTH_LONG).show();
        resetSelection();
        showIdle("DVD attachment/start failed. Choose an Xbox XISO to retry.");
    }

    @Override
    protected boolean stopRuntimeOnActivityStop() {
        // Preserve the selected FD and guest if Android temporarily backgrounds the validation app.
        return false;
    }

    @Override
    protected void afterNativeRuntimeStop() {
        super.afterNativeRuntimeStop();
        closeQuietly(dvdDescriptor);
        dvdDescriptor = null;
        releasePersistedPermission();
        runtimeStarted = false;
    }

    private void showIdle(String message) {
        if (stateText != null) stateText.setText(message);
        if (chooseButton != null) {
            chooseButton.setVisibility(View.VISIBLE);
            chooseButton.setEnabled(true);
        }
        if (controls != null) controls.setVisibility(View.VISIBLE);
        Log.i(TAG, "M61_STATE_IDLE emulator=stopped dvd=none");
    }

    private void resetSelection() {
        closeQuietly(dvdDescriptor);
        dvdDescriptor = null;
        selectedUri = null;
        selectedName = "(unknown)";
        selectedMime = "(unknown)";
        selectedSize = 0;
        startRequested = false;
        releasePersistedPermission();
    }

    private void releasePersistedPermission() {
        if (persistablePermission && selectedUri != null) {
            try {
                getContentResolver().releasePersistableUriPermission(
                        selectedUri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
            } catch (SecurityException error) {
                Log.w(TAG, "M61_URI_PERSIST_PERMISSION_RELEASE_FAILED");
            }
        }
        persistablePermission = false;
    }

    private static void closeQuietly(ParcelFileDescriptor descriptor) {
        if (descriptor == null) return;
        try {
            descriptor.close();
        } catch (IOException ignored) {
            // A failed close cannot make the selected media safe to reuse.
        }
    }
}
