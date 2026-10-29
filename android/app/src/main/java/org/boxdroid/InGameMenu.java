package org.boxdroid;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.IntConsumer;
import java.util.function.Supplier;

/**
 * In-game pause menu: a translucent panel on the left edge, driven by a gamepad
 * or touch. It only renders and routes input; GameActivity owns pausing the
 * guest, audio and controller input through {@link Listener}.
 */
final class InGameMenu {
    interface Listener {
        void onMenuResume();
        void onMenuQuit();
        int getMetricsMode();
        void setMetricsMode(int mode);
        int getAspectMode();
        void setAspectMode(int mode);
        boolean getWidescreen();
        void setWidescreen(boolean on);
        /** True when the saved widescreen setting differs from the one the console booted with. */
        boolean widescreenNeedsRestart();
        int getScalingFilter();
        void setScalingFilter(int filter);
        /** Each slot's save time in Unix seconds, 0 when empty; null when unreadable. */
        void listStates(Consumer<long[]> onResult);
        /** The callbacks receive 0 on success. */
        void saveState(int slot, IntConsumer onDone);
        void loadState(int slot, IntConsumer onDone);
    }

    private static final int PANEL_COLOR = Color.argb(0xCC, 0x0E, 0x0E, 0x0E);
    private static final int SCRIM_COLOR = Color.argb(0x66, 0x00, 0x00, 0x00);
    private static final int SELECTED_COLOR = Color.argb(0x1F, 0xFF, 0xFF, 0xFF);
    private static final int SECONDARY_TEXT = Color.argb(0xB3, 0xFF, 0xFF, 0xFF);
    private static final int HINT_TEXT = Color.argb(0x99, 0xFF, 0xFF, 0xFF);
    private static final int DIVIDER_COLOR = Color.argb(0x33, 0xFF, 0xFF, 0xFF);
    private static final long ANIMATION_MS = 150;
    private static final float STICK_THRESHOLD = 0.5f;
    // A habitual second edge swipe arrives as Back right after the menu opened.
    private static final long BACK_DEBOUNCE_MS = 1000;
    private static final long STATUS_MS = 2500;
    private static final int[] ASPECT_ORDER = {GameActivity.ASPECT_AUTO, GameActivity.ASPECT_4_3,
            GameActivity.ASPECT_16_9, GameActivity.ASPECT_STRETCH};

    /** One selectable line. {@code step} is null for plain actions. */
    private static final class Row {
        final View view;
        final View indicator;
        final Runnable activate;
        final IntConsumer step;

        Row(View view, View indicator, Runnable activate, IntConsumer step) {
            this.view = view;
            this.indicator = indicator;
            this.activate = activate;
            this.step = step;
        }
    }

    private final Activity activity;
    private final Listener listener;
    private final FrameLayout root;
    private final LinearLayout panel;
    private final ScrollView scroll;
    private final LinearLayout items;
    private final TextView hint;
    private final List<Row> rows = new ArrayList<>();
    private int selected;
    private boolean open;
    // Any page but the main one: B and Back return to the main page.
    private boolean subPage;
    // A save state operation is running: input is ignored until it reports back.
    private boolean busy;
    private int stickDirection;
    private final android.util.SparseLongArray pressDownTimes = new android.util.SparseLongArray();
    private long openedAt;

    InGameMenu(Activity activity, Listener listener) {
        this.activity = activity;
        this.listener = listener;

        root = new FrameLayout(activity);
        root.setBackgroundColor(SCRIM_COLOR);
        root.setVisibility(View.GONE);
        // Touches outside the panel resume the game; none reach the surface below.
        root.setClickable(true);
        root.setOnClickListener(view -> { if (!busy) listener.onMenuResume(); });

        panel = new LinearLayout(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setBackgroundColor(PANEL_COLOR);
        panel.setClickable(true);
        int pad = dp(24);
        panel.setPadding(pad, pad, pad, pad);
        panel.setOnApplyWindowInsetsListener((View view, WindowInsets insets) -> {
            view.setPadding(pad + insets.getStableInsetLeft(), pad + insets.getStableInsetTop(),
                    pad, pad + insets.getStableInsetBottom());
            return insets;
        });

        // Pages taller than the screen scroll; select() keeps the selected row in view.
        items = new LinearLayout(activity);
        items.setOrientation(LinearLayout.VERTICAL);
        scroll = new ScrollView(activity);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.addView(items, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        panel.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        hint = text(R.string.menu_hint, 13, HINT_TEXT);
        panel.addView(hint);

        int width = Math.max(dp(320),
                Math.round(activity.getResources().getDisplayMetrics().widthPixels * 0.40f));
        root.addView(panel, new FrameLayout.LayoutParams(width, ViewGroup.LayoutParams.MATCH_PARENT,
                Gravity.START));
    }

    /** Adds the menu above every other view in the activity content. */
    void attach(FrameLayout content) {
        content.addView(root, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        panel.requestApplyInsets();
    }

    boolean isOpen() {
        return open;
    }

    void open() {
        if (open) return;
        open = true;
        openedAt = SystemClock.uptimeMillis();
        stickDirection = 0;
        showMainPage();
        root.setVisibility(View.VISIBLE);
        root.bringToFront();
        root.setAlpha(0f);
        root.animate().alpha(1f).setDuration(ANIMATION_MS).start();
        panel.setTranslationX(-panel.getLayoutParams().width);
        panel.animate().translationX(0f).setDuration(ANIMATION_MS).start();
    }

    void close() {
        if (!open) return;
        open = false;
        root.animate().alpha(0f).setDuration(ANIMATION_MS).start();
        panel.animate().translationX(-panel.getWidth()).setDuration(ANIMATION_MS)
                .withEndAction(() -> { if (!open) root.setVisibility(View.GONE); }).start();
    }

    private void showMainPage() {
        resetPage(R.string.menu_title, 0);
        addAction(R.string.menu_resume, listener::onMenuResume);
        addAction(R.string.menu_save_state, () -> showStatesPage(true));
        addAction(R.string.menu_load_state, () -> showStatesPage(false));
        addChoice(R.string.menu_aspect, this::aspectLabel, direction -> {
            int position = Math.floorMod(indexOf(ASPECT_ORDER, listener.getAspectMode()) + direction,
                    ASPECT_ORDER.length);
            listener.setAspectMode(ASPECT_ORDER[position]);
        });
        addChoice(R.string.menu_widescreen, this::widescreenLabel, direction -> {
            listener.setWidescreen(!listener.getWidescreen());
            // Widescreen also changes the aspect ratio: rebuild the page, keeping the row.
            int row = selected;
            hint.post(() -> {
                showMainPage();
                select(row);
                if (listener.widescreenNeedsRestart()) {
                    showStatus(activity.getString(R.string.widescreen_restart));
                }
            });
        });
        addChoice(R.string.menu_filter, this::filterLabel, direction ->
                listener.setScalingFilter(Math.floorMod(listener.getScalingFilter() + direction, 3)));
        addChoice(R.string.menu_metrics, this::metricsLabel, direction ->
                listener.setMetricsMode(Math.floorMod(listener.getMetricsMode() + direction, 3)));
        addDivider();
        addAction(R.string.menu_quit, this::showQuitConfirmation);
        select(0);
    }

    private void showQuitConfirmation() {
        resetPage(R.string.quit_confirm_title, R.string.quit_confirm_message);
        addAction(R.string.quit_cancel, this::showMainPage);
        addAction(R.string.menu_quit, listener::onMenuQuit);
        select(0);
    }

    /** Lists the slots; saving to an occupied slot asks first, empty slots can't be loaded. */
    private void showStatesPage(boolean save) {
        int title = save ? R.string.menu_save_state : R.string.menu_load_state;
        showBusy(title);
        listener.listStates(times -> {
            busy = false;
            if (!open) return;
            if (times == null) {
                showMessage(R.string.state_list_failed);
                return;
            }
            resetPage(activity.getString(title), null, true);
            DateFormat format = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.SHORT);
            for (int i = 0; i < times.length; i++) {
                int slot = i;
                boolean empty = times[i] == 0;
                TextView value = text(0, 15, SECONDARY_TEXT);
                value.setText(empty ? activity.getString(R.string.state_empty)
                        : format.format(new Date(times[i] * 1000)));
                Runnable action = save ? (empty ? () -> saveState(slot) : () -> showOverwrite(slot))
                        : (empty ? null : () -> loadState(slot));
                addRow(activity.getString(R.string.state_slot, slot + 1), value, action, null);
            }
            select(0);
        });
    }

    private void showOverwrite(int slot) {
        resetPage(activity.getString(R.string.state_overwrite_title, slot + 1),
                activity.getString(R.string.state_overwrite_message), true);
        addAction(R.string.quit_cancel, () -> showStatesPage(true));
        addAction(R.string.state_overwrite, () -> saveState(slot));
        select(0);
    }

    private void saveState(int slot) {
        showBusy(R.string.state_saving);
        listener.saveState(slot, result -> {
            busy = false;
            if (!open) return;
            if (result != 0) {
                showMessage(R.string.state_save_failed);
                return;
            }
            showMainPage();
            showStatus(activity.getString(R.string.state_saved, slot + 1));
        });
    }

    /** A loaded state continues as soon as the menu closes. */
    private void loadState(int slot) {
        showBusy(R.string.state_loading);
        listener.loadState(slot, result -> {
            busy = false;
            if (!open) return;
            if (result == 0) listener.onMenuResume();
            else showMessage(R.string.state_load_failed);
        });
    }

    /** A short message in place of the main page's hint. */
    private void showStatus(String status) {
        hint.setText(status);
        hint.postDelayed(() -> {
            if (open && !subPage && status.contentEquals(hint.getText())) hint.setText(R.string.menu_hint);
        }, STATUS_MS);
    }

    private void showBusy(int title) {
        resetPage(activity.getString(title), null, true);
        hint.setText("");
        busy = true;
    }

    private void showMessage(int message) {
        resetPage(activity.getString(message), null, true);
        addAction(R.string.state_ok, this::showMainPage);
        select(0);
    }

    private void resetPage(int title, int message) {
        resetPage(activity.getString(title), message == 0 ? null : activity.getString(message), message != 0);
    }

    private void resetPage(CharSequence title, CharSequence message, boolean sub) {
        items.removeAllViews();
        rows.clear();
        scroll.scrollTo(0, 0);
        subPage = sub;
        hint.setText(subPage ? R.string.menu_hint_back : R.string.menu_hint);
        TextView heading = text(0, 22, Color.WHITE);
        heading.setText(title);
        heading.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        heading.setPadding(0, 0, 0, dp(message != null ? 8 : 20));
        items.addView(heading);
        if (message != null) {
            TextView body = text(0, 15, SECONDARY_TEXT);
            body.setText(message);
            body.setPadding(0, 0, 0, dp(20));
            items.addView(body);
        }
    }

    private static int indexOf(int[] values, int value) {
        for (int i = 0; i < values.length; i++) if (values[i] == value) return i;
        return 0;
    }

    private String aspectLabel() {
        switch (listener.getAspectMode()) {
            case GameActivity.ASPECT_AUTO: return activity.getString(R.string.aspect_auto);
            case GameActivity.ASPECT_16_9: return activity.getString(R.string.aspect_16_9);
            case GameActivity.ASPECT_STRETCH: return activity.getString(R.string.aspect_stretch);
            default: return activity.getString(R.string.aspect_4_3);
        }
    }

    private String widescreenLabel() {
        return activity.getString(listener.getWidescreen() ? R.string.widescreen_on : R.string.widescreen_off);
    }

    private String filterLabel() {
        switch (listener.getScalingFilter()) {
            case GameActivity.FILTER_BILINEAR: return activity.getString(R.string.filter_bilinear);
            case GameActivity.FILTER_SGSR: return activity.getString(R.string.filter_sgsr);
            default: return activity.getString(R.string.filter_nearest);
        }
    }

    private String metricsLabel() {
        switch (listener.getMetricsMode()) {
            case PerformanceActivity.METRICS_FPS: return activity.getString(R.string.metrics_fps);
            case PerformanceActivity.METRICS_FULL: return activity.getString(R.string.metrics_full);
            default: return activity.getString(R.string.metrics_off);
        }
    }

    private void addAction(int label, Runnable action) {
        addRow(activity.getString(label), null, action, null);
    }

    /** A value cycled with left/right; activating it (A or tap) moves to the next value. */
    private void addChoice(int label, Supplier<String> value, IntConsumer step) {
        TextView valueView = text(0, 17, SECONDARY_TEXT);
        Runnable refresh = () -> valueView.setText("‹ " + value.get() + " ›");
        refresh.run();
        addRow(activity.getString(label), valueView, () -> { step.accept(1); refresh.run(); },
                direction -> { step.accept(direction); refresh.run(); });
    }

    private void addRow(CharSequence label, TextView value, Runnable action, IntConsumer step) {
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setMinimumHeight(dp(52));

        View indicator = new View(activity);
        line.addView(indicator, new LinearLayout.LayoutParams(dp(3), dp(24)));

        TextView name = text(0, 17, Color.WHITE);
        name.setText(label);
        name.setPadding(dp(14), 0, dp(12), 0);
        line.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        if (value != null) line.addView(value);

        rows.add(new Row(line, indicator, action, step));
        int index = rows.size() - 1;
        line.setOnClickListener(view -> {
            select(index);
            activateSelected();
        });
        items.addView(line, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void addDivider() {
        View divider = new View(activity);
        divider.setBackgroundColor(DIVIDER_COLOR);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1) / 2));
        params.topMargin = dp(12);
        params.bottomMargin = dp(12);
        items.addView(divider, params);
    }

    private void select(int index) {
        if (rows.isEmpty()) return;
        selected = Math.floorMod(index, rows.size());
        for (int i = 0; i < rows.size(); i++) {
            boolean on = i == selected;
            rows.get(i).view.setBackgroundColor(on ? SELECTED_COLOR : Color.TRANSPARENT);
            rows.get(i).indicator.setBackgroundColor(on ? Color.WHITE : Color.TRANSPARENT);
        }
        View row = rows.get(selected).view;
        // After layout, so a page that was just built has its row positions.
        scroll.post(() -> {
            int top = row.getTop();
            int bottom = row.getBottom();
            int visible = scroll.getHeight();
            if (selected == 0) scroll.smoothScrollTo(0, 0);
            else if (bottom > scroll.getScrollY() + visible) scroll.smoothScrollTo(0, bottom - visible);
            else if (top < scroll.getScrollY()) scroll.smoothScrollTo(0, top);
        });
    }

    private void activateSelected() {
        Row row = rows.get(selected);
        if (row.activate != null) row.activate.run();
    }

    private void stepSelected(int direction) {
        Row row = rows.get(selected);
        if (row.step != null) row.step.accept(direction);
    }

    /**
     * B and Back return to the main page first, then resume the game. Also the
     * entry point for system Back delivered to onBackPressed() instead of as a key.
     */
    void back() {
        long sinceOpen = SystemClock.uptimeMillis() - openedAt;
        if (sinceOpen < BACK_DEBOUNCE_MS) {
            Log.i("BoxDroid_Game", "MENU_BACK_IGNORED since_open_ms=" + sinceOpen);
            return;
        }
        if (busy) return;
        if (subPage) showMainPage();
        else listener.onMenuResume();
    }

    /** Consumes every key while open, except volume keys. */
    boolean onKeyEvent(KeyEvent event) {
        if (!open) return false;
        int key = event.getKeyCode();
        if (key == KeyEvent.KEYCODE_VOLUME_UP || key == KeyEvent.KEYCODE_VOLUME_DOWN
                || key == KeyEvent.KEYCODE_VOLUME_MUTE) {
            return false;
        }
        if (busy) return true;
        boolean down = pressStarts(event);
        boolean up = event.getAction() == KeyEvent.ACTION_UP;
        switch (key) {
            case KeyEvent.KEYCODE_DPAD_UP:
                if (down) select(selected - 1);
                return true;
            case KeyEvent.KEYCODE_DPAD_DOWN:
                if (down) select(selected + 1);
                return true;
            case KeyEvent.KEYCODE_DPAD_LEFT:
                if (down) stepSelected(-1);
                return true;
            case KeyEvent.KEYCODE_DPAD_RIGHT:
                if (down) stepSelected(1);
                return true;
            case KeyEvent.KEYCODE_BUTTON_A:
            case KeyEvent.KEYCODE_DPAD_CENTER:
            case KeyEvent.KEYCODE_ENTER:
                if (down && event.getRepeatCount() == 0) activateSelected();
                return true;
            case KeyEvent.KEYCODE_BUTTON_B:
            case KeyEvent.KEYCODE_BACK:
                // Act on release so the press that opened the menu cannot also close it.
                if (up && !event.isCanceled()) back();
                return true;
            default:
                return true;
        }
    }

    /**
     * True for each press. Leaving touch mode (the edge swipe that opened the
     * menu is a touch) consumes the next key press, so only its release
     * arrives: a release whose press began while the menu was open, but was
     * never seen, counts as the press. A key held since before the menu opened
     * (A as a racing game's throttle) does not.
     */
    private boolean pressStarts(KeyEvent event) {
        int key = event.getKeyCode();
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            pressDownTimes.put(key, event.getDownTime());
            return true;
        }
        return event.getAction() == KeyEvent.ACTION_UP && event.getDownTime() >= openedAt
                && pressDownTimes.get(key, -1) != event.getDownTime();
    }

    /** Maps the D-pad hat and left stick to single navigation steps; consumes all motion while open. */
    boolean onMotionEvent(MotionEvent event) {
        if (!open) return false;
        if (busy) return true;
        if ((event.getSource() & InputDevice.SOURCE_CLASS_JOYSTICK) == 0
                || event.getAction() != MotionEvent.ACTION_MOVE) {
            return true;
        }
        float x = event.getAxisValue(MotionEvent.AXIS_HAT_X);
        float y = event.getAxisValue(MotionEvent.AXIS_HAT_Y);
        if (Math.abs(x) < STICK_THRESHOLD && Math.abs(y) < STICK_THRESHOLD) {
            x = event.getAxisValue(MotionEvent.AXIS_X);
            y = event.getAxisValue(MotionEvent.AXIS_Y);
        }
        int direction = 0;
        if (y <= -STICK_THRESHOLD) direction = 1;
        else if (y >= STICK_THRESHOLD) direction = 2;
        else if (x <= -STICK_THRESHOLD) direction = 3;
        else if (x >= STICK_THRESHOLD) direction = 4;
        if (direction != stickDirection) {
            stickDirection = direction;
            switch (direction) {
                case 1: select(selected - 1); break;
                case 2: select(selected + 1); break;
                case 3: stepSelected(-1); break;
                case 4: stepSelected(1); break;
                default: break;
            }
        }
        return true;
    }

    private TextView text(int resource, int sp, int color) {
        TextView view = new TextView(activity);
        if (resource != 0) view.setText(resource);
        view.setTextColor(color);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        return view;
    }

    private int dp(int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }
}
