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
    // Follows the console's widescreen signal, as a TV would; the default.
    static final int ASPECT_AUTO = 3;
    // Scaling filters, matching the native presenter's.
    static final int FILTER_NEAREST = 0;
    static final int FILTER_BILINEAR = 1;
    static final int FILTER_SGSR = 2;
    private static final String SCALING_FILTER = "scaling_filter";
    static final int STATE_SLOTS = 3;
    private static final String SETTINGS = "boxdroid_settings";

    private GamepadInput physicalInput;
    private InGameMenu menu;
    private boolean quitting;
    private GameIdentity game;
    private int aspectMode = ASPECT_AUTO;
    // The widescreen setting the console booted with, and the one saved for the next start.
    private boolean bootWidescreen;
    private boolean widescreen;
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
                    .getInt(gameSetting("aspect"), ASPECT_AUTO);
            applyAspectMode(aspectMode);
            widescreen = bootWidescreen = getSharedPreferences(SETTINGS, MODE_PRIVATE)
                    .getBoolean(gameSetting("widescreen"), false);
            setConsoleWidescreen(widescreen);
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
        if (mode < ASPECT_4_3 || mode > ASPECT_AUTO || mode == aspectMode || game == null) return;
        aspectMode = mode;
        getSharedPreferences(SETTINGS, MODE_PRIVATE).edit().putInt(gameSetting("aspect"), mode).apply();
        applyAspectMode(mode);
        Log.i(TAG, "GAME_SETTING game=" + game.key + " aspect=" + mode);
    }

    @Override
    public boolean getWidescreen() {
        return widescreen;
    }

    /**
     * Saves the game's widescreen setting for its next start. A fixed aspect
     * ratio that would contradict it returns to Auto, which follows the
     * console's own widescreen signal.
     */
    @Override
    public void setWidescreen(boolean on) {
        if (on == widescreen || game == null) return;
        widescreen = on;
        getSharedPreferences(SETTINGS, MODE_PRIVATE).edit().putBoolean(gameSetting("widescreen"), on).apply();
        if ((on && aspectMode == ASPECT_4_3) || (!on && aspectMode == ASPECT_16_9)) setAspectMode(ASPECT_AUTO);
        Log.i(TAG, "GAME_SETTING game=" + game.key + " widescreen=" + on);
    }

    @Override
    public boolean widescreenNeedsRestart() {
        return widescreen != bootWidescreen;
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

    /** Save states are hard disk snapshots named after the game: "4D530004.1-slot1". */
    private String stateName(int slot) {
        return game.key + "-slot" + (slot + 1);
    }

    @Override
    public void listStates(java.util.function.Consumer<long[]> onResult) {
        if (game == null) {
            onResult.accept(null);
            return;
        }
        listGuestStates(game.key + "-slot", states -> {
            if (states == null) {
                onResult.accept(null);
                return;
            }
            long[] times = new long[STATE_SLOTS];
            for (int i = 0; i < STATE_SLOTS; i++) {
                Long time = states.get(stateName(i));
                times[i] = time == null ? 0 : Math.max(1, time);
            }
            onResult.accept(times);
        });
    }

    @Override
    public void saveState(int slot, java.util.function.IntConsumer onDone) {
        Log.i(TAG, "STATE_SAVE_REQUEST name=" + stateName(slot));
        saveGuestState(stateName(slot), onDone);
    }

    @Override
    public void loadState(int slot, java.util.function.IntConsumer onDone) {
        Log.i(TAG, "STATE_LOAD_REQUEST name=" + stateName(slot));
        loadGuestState(stateName(slot), onDone);
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
