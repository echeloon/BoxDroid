package org.boxdroid;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowInsets;

import org.boxdroid.BootEmulatorActivity;


public class GameActivity extends BootEmulatorActivity implements InGameMenu.Listener {
    private static final String TAG = "BoxDroid_Game";
    private static final int REQUEST_XISO = 6101;
    // Display aspect modes, matching the native presenter's.
    static final int ASPECT_4_3 = 0;
    static final int ASPECT_16_9 = 1;
    static final int ASPECT_STRETCH = 2;
    // Scaling filters, matching the native presenter's.
    static final int FILTER_NEAREST = 0;
    static final int FILTER_BILINEAR = 1;
    static final int FILTER_SGSR = 2;
    private static final String SCALING_FILTER = "scaling_filter";
    private static final String SETTINGS = "boxdroid_settings";

    private GamepadInput physicalInput;
    private InGameMenu menu;
    private boolean quitting;
    private GameIdentity game;
    private int aspectMode = ASPECT_4_3;
    private int scalingFilter = FILTER_NEAREST;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        physicalInput = new GamepadInput(this);
        physicalInput.start();
        Log.i(TAG, "INPUT_LAYER_READY host=Android_Gamepad_Joystick slots=4 guest=XID_Duke");

        scalingFilter = getSharedPreferences(SETTINGS, MODE_PRIVATE).getInt(SCALING_FILTER, FILTER_NEAREST);
        applyScalingFilter(scalingFilter);

        menu = new InGameMenu(this, this);
        menu.attach(findViewById(android.R.id.content));
        // In immersive mode the first edge swipe only reveals the system bars and
        // sends no Back. Treat that reveal as the request to open the menu; this
        // needs plain (non-sticky) immersive, see stickyImmersive().
        View content = findViewById(android.R.id.content);
        content.setOnApplyWindowInsetsListener((View view, WindowInsets insets) -> {
            boolean barsVisible = insets.isVisible(WindowInsets.Type.navigationBars());
            if (barsVisible && hasWindowFocus() && isGuestRunning() && !menu.isOpen() && !quitting) {
                Log.i(TAG, "MENU_OPEN_REQUEST source=system_bars");
                openMenu();
            }
            return view.onApplyWindowInsets(insets);
        });

        Uri uri = getIntent().getData();
        if (uri != null) {
            Log.i(TAG, "Received game URI: " + uri);
            game = GameIdentity.of(this, uri);
            aspectMode = getSharedPreferences(SETTINGS, MODE_PRIVATE)
                    .getInt(gameSetting("aspect"), ASPECT_4_3);
            applyAspectMode(aspectMode);
            Intent fakeResult = new Intent();
            fakeResult.setData(uri);
            fakeResult.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

            // This tricks BootEmulatorActivity into thinking the picker just returned
            onActivityResult(REQUEST_XISO, Activity.RESULT_OK, fakeResult);
        } else {
            Log.e(TAG, "No game URI provided, finishing");
            finish();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        // While the menu is open the guest stays paused and receives no input.
        if (physicalInput != null && !menu.isOpen()) physicalInput.resume();
    }

    @Override
    protected void onPause() {
        if (physicalInput != null) physicalInput.pause();
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        if (physicalInput != null) {
            physicalInput.close();
            physicalInput = null;
        }
        super.onDestroy();
        // Since the native emulator is not re-entrant, we must kill the emulator process
        // when the activity is destroyed to ensure a clean slate for the next game.
        System.exit(0);
    }

    /** System Back (navigation button or edge swipe) toggles the menu once the game runs. */
    @Override
    public void onBackPressed() {
        if (quitting) return;
        if (menu.isOpen()) {
            menu.back();
        } else if (isGuestRunning()) {
            openMenu();
        } else {
            // Still booting: keep the previous behaviour and leave cleanly.
            super.onBackPressed();
        }
    }

    private void openMenu() {
        menu.open();
        physicalInput.pause();
        setAudioSuspended(true);
        Log.i(TAG, "MENU_OPEN");
        setGuestPaused(true, result -> {
            if (result != 0 && menu.isOpen()) {
                Log.e(TAG, "MENU_PAUSE_FAILED result=" + result);
                onMenuResume();
            }
        });
    }

    @Override
    protected boolean stickyImmersive() {
        return false;
    }

    @Override
    public void onMenuResume() {
        if (!menu.isOpen()) return;
        menu.close();
        configurePresentationWindow();
        setGuestPaused(false, null);
        setAudioSuspended(false);
        // Restart from a neutral controller: the button that closed the menu never reaches the guest.
        physicalInput.resume();
        Log.i(TAG, "MENU_RESUME");
    }

    @Override
    public void onMenuQuit() {
        if (quitting) return;
        quitting = true;
        Log.i(TAG, "MENU_QUIT");
        requestCleanShutdown();
    }

    /** Per-game settings are keyed by the disc's title ID and version. */
    private String gameSetting(String name) {
        return "game." + game.key + "." + name;
    }

    @Override
    public int getAspectMode() {
        return aspectMode;
    }

    @Override
    public void setAspectMode(int mode) {
        if (mode < ASPECT_4_3 || mode > ASPECT_STRETCH || mode == aspectMode || game == null) return;
        aspectMode = mode;
        getSharedPreferences(SETTINGS, MODE_PRIVATE).edit().putInt(gameSetting("aspect"), mode).apply();
        applyAspectMode(mode);
        Log.i(TAG, "GAME_SETTING game=" + game.key + " aspect=" + mode);
    }

    @Override
    public int getScalingFilter() {
        return scalingFilter;
    }

    /** The scaling filter is a global display preference, not a per-game one. */
    @Override
    public void setScalingFilter(int filter) {
        if (filter < FILTER_NEAREST || filter > FILTER_SGSR || filter == scalingFilter) return;
        scalingFilter = filter;
        getSharedPreferences(SETTINGS, MODE_PRIVATE).edit().putInt(SCALING_FILTER, filter).apply();
        applyScalingFilter(filter);
        Log.i(TAG, "SETTING scaling_filter=" + filter);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (menu != null && menu.onKeyEvent(event)) return true;
        if (physicalInput != null && physicalInput.onKeyEvent(event)) return true;
        return super.dispatchKeyEvent(event);
    }

    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if (menu != null && menu.onMotionEvent(event)) return true;
        if (physicalInput != null && physicalInput.onMotionEvent(event)) return true;
        return super.dispatchGenericMotionEvent(event);
    }
}
