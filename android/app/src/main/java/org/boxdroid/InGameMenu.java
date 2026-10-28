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
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
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
        int getScalingFilter();
        void setScalingFilter(int filter);
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
    private final LinearLayout items;
    private final TextView hint;
    private final List<Row> rows = new ArrayList<>();
    private int selected;
    private boolean open;
    private boolean confirming;
    private int stickDirection;
    private long openedAt;

    InGameMenu(Activity activity, Listener listener) {
        this.activity = activity;
        this.listener = listener;

        root = new FrameLayout(activity);
        root.setBackgroundColor(SCRIM_COLOR);
        root.setVisibility(View.GONE);
        // Touches outside the panel resume the game; none reach the surface below.
        root.setClickable(true);
        root.setOnClickListener(view -> listener.onMenuResume());

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

        items = new LinearLayout(activity);
        items.setOrientation(LinearLayout.VERTICAL);
        panel.addView(items, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
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
        addChoice(R.string.menu_aspect, this::aspectLabel, direction ->
                listener.setAspectMode(Math.floorMod(listener.getAspectMode() + direction, 3)));
        addChoice(R.string.menu_filter, this::filterLabel, direction ->
                listener.setScalingFilter(Math.floorMod(listener.getScalingFilter() + direction, 2)));
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

    private void resetPage(int title, int message) {
        items.removeAllViews();
        rows.clear();
        confirming = message != 0;
        hint.setText(confirming ? R.string.menu_hint_back : R.string.menu_hint);
        TextView heading = text(title, 22, Color.WHITE);
        heading.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        heading.setPadding(0, 0, 0, dp(confirming ? 8 : 20));
        items.addView(heading);
        if (confirming) {
            TextView body = text(message, 15, SECONDARY_TEXT);
            body.setPadding(0, 0, 0, dp(20));
            items.addView(body);
        }
    }

    private String aspectLabel() {
        switch (listener.getAspectMode()) {
            case GameActivity.ASPECT_16_9: return activity.getString(R.string.aspect_16_9);
            case GameActivity.ASPECT_STRETCH: return activity.getString(R.string.aspect_stretch);
            default: return activity.getString(R.string.aspect_4_3);
        }
    }

    private String filterLabel() {
        return activity.getString(listener.getScalingFilter() == GameActivity.FILTER_BILINEAR
                ? R.string.filter_bilinear : R.string.filter_nearest);
    }

    private String metricsLabel() {
        switch (listener.getMetricsMode()) {
            case PerformanceActivity.METRICS_FPS: return activity.getString(R.string.metrics_fps);
            case PerformanceActivity.METRICS_FULL: return activity.getString(R.string.metrics_full);
            default: return activity.getString(R.string.metrics_off);
        }
    }

    private void addAction(int label, Runnable action) {
        addRow(label, null, action, null);
    }

    /** A value cycled with left/right; activating it (A or tap) moves to the next value. */
    private void addChoice(int label, Supplier<String> value, IntConsumer step) {
        TextView valueView = text(0, 17, SECONDARY_TEXT);
        Runnable refresh = () -> valueView.setText("‹ " + value.get() + " ›");
        refresh.run();
        addRow(label, valueView, () -> { step.accept(1); refresh.run(); },
                direction -> { step.accept(direction); refresh.run(); });
    }

    private void addRow(int label, TextView value, Runnable action, IntConsumer step) {
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setMinimumHeight(dp(52));

        View indicator = new View(activity);
        line.addView(indicator, new LinearLayout.LayoutParams(dp(3), dp(24)));

        TextView name = text(label, 17, Color.WHITE);
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
     * B and Back leave the confirmation page first, then resume the game. Also the
     * entry point for system Back delivered to onBackPressed() instead of as a key.
     */
    void back() {
        long sinceOpen = SystemClock.uptimeMillis() - openedAt;
        if (sinceOpen < BACK_DEBOUNCE_MS) {
            Log.i("BoxDroid_Game", "MENU_BACK_IGNORED since_open_ms=" + sinceOpen);
            return;
        }
        if (confirming) showMainPage();
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
        boolean down = event.getAction() == KeyEvent.ACTION_DOWN;
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

    /** Maps the D-pad hat and left stick to single navigation steps; consumes all motion while open. */
    boolean onMotionEvent(MotionEvent event) {
        if (!open) return false;
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
