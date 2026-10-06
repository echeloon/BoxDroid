package org.boxdroid;

import android.app.Activity;
import android.hardware.input.InputManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;

import java.util.Locale;

/** Android-standard gamepad event adapter. All host devices update fixed native slots. */
final class GamepadInput implements InputManager.InputDeviceListener {
    private static final String TAG = "BoxDroidGamepadInput";
    private static final int SLOT_COUNT = 4;
    private static final int DIAGNOSTIC_LIMIT = 256;
    private static final float FALLBACK_STICK_FLAT = 0.08f;

    private static final int A = 1 << 0;
    private static final int B = 1 << 1;
    private static final int X = 1 << 2;
    private static final int Y = 1 << 3;
    private static final int DPAD_LEFT = 1 << 4;
    private static final int DPAD_UP = 1 << 5;
    private static final int DPAD_RIGHT = 1 << 6;
    private static final int DPAD_DOWN = 1 << 7;
    private static final int BACK = 1 << 8;
    private static final int START = 1 << 9;
    private static final int WHITE = 1 << 10;
    private static final int BLACK = 1 << 11;
    private static final int L3 = 1 << 12;
    private static final int R3 = 1 << 13;

    private static final class AxisRange {
        final int axis;
        final float min;
        final float max;
        final float center;
        final float negativeSpan;
        final float positiveSpan;
        final float flat;
        final float triggerFlatFraction;

        AxisRange(int axis, InputDevice.MotionRange range) {
            this.axis = axis;
            min = range.getMin();
            max = range.getMax();
            center = (min + max) * 0.5f;
            negativeSpan = center - min;
            positiveSpan = max - center;
            float span = Math.max(negativeSpan, positiveSpan);
            flat = span > 0 ? range.getFlat() / span : 0;
            triggerFlatFraction = max > min ? range.getFlat() / (max - min) : 0;
        }

        boolean valid() {
            return negativeSpan > 0 && positiveSpan > 0;
        }

        float centered(float value) {
            float result = value >= center
                    ? (positiveSpan > 0 ? (value - center) / positiveSpan : 0)
                    : (negativeSpan > 0 ? (value - center) / negativeSpan : 0);
            return clamp(result, -1, 1);
        }

    }

    private static final class Slot {
        final int slot;
        int deviceId;
        String name;
        InputDevice device;
        AxisRange leftX, leftY, rightX, rightY, leftTrigger, rightTrigger;
        AxisRange hatXRange, hatYRange;
        int keyButtons;
        boolean dpadKeyUp, dpadKeyDown, dpadKeyLeft, dpadKeyRight;
        boolean digitalLeftTrigger, digitalRightTrigger;
        float hatX, hatY;
        float leftXRaw, leftYRaw, rightXRaw, rightYRaw;
        float leftXValue, leftYValue, rightXValue, rightYValue;
        float leftTriggerValue, rightTriggerValue;
        int lastDiagnosticBucket = Integer.MIN_VALUE;

        Slot(int slot, InputDevice device) {
            this.slot = slot;
            updateDevice(device);
        }

        void updateDevice(InputDevice nextDevice) {
            device = nextDevice;
            deviceId = nextDevice.getId();
            name = nextDevice.getName();
            leftX = findRange(device, MotionEvent.AXIS_X);
            leftY = findRange(device, MotionEvent.AXIS_Y);
            rightX = firstRange(device, MotionEvent.AXIS_RX, MotionEvent.AXIS_Z);
            rightY = firstRange(device, MotionEvent.AXIS_RY, MotionEvent.AXIS_RZ);
            leftTrigger = firstRange(device, MotionEvent.AXIS_LTRIGGER, MotionEvent.AXIS_BRAKE);
            rightTrigger = firstRange(device, MotionEvent.AXIS_RTRIGGER, MotionEvent.AXIS_GAS);
            hatXRange = findRange(device, MotionEvent.AXIS_HAT_X);
            hatYRange = findRange(device, MotionEvent.AXIS_HAT_Y);
        }

        boolean hasAnalogLeftTrigger() { return leftTrigger != null; }
        boolean hasAnalogRightTrigger() { return rightTrigger != null; }

        void reset() {
            keyButtons = 0;
            dpadKeyUp = dpadKeyDown = dpadKeyLeft = dpadKeyRight = false;
            digitalLeftTrigger = digitalRightTrigger = false;
            hatX = hatY = 0;
            leftXRaw = leftYRaw = rightXRaw = rightYRaw = 0;
            leftXValue = leftYValue = rightXValue = rightYValue = 0;
            leftTriggerValue = rightTriggerValue = 0;
            lastDiagnosticBucket = Integer.MIN_VALUE;
        }

        int buttons() {
            int result = keyButtons;
            if (dpadKeyUp || hatY < -0.5f) result |= DPAD_UP;
            if (dpadKeyDown || hatY > 0.5f) result |= DPAD_DOWN;
            if (dpadKeyLeft || hatX < -0.5f) result |= DPAD_LEFT;
            if (dpadKeyRight || hatX > 0.5f) result |= DPAD_RIGHT;
            return result;
        }

        float leftTrigger() {
            return hasAnalogLeftTrigger() ? leftTriggerValue : (digitalLeftTrigger ? 1 : 0);
        }

        float rightTrigger() {
            return hasAnalogRightTrigger() ? rightTriggerValue : (digitalRightTrigger ? 1 : 0);
        }
    }

    private final InputManager inputManager;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final Slot[] slots = new Slot[SLOT_COUNT];
    private boolean registered;
    private boolean foreground;
    private int primarySlot = -1;
    private int diagnosticCount;

    private static native void nativeSetState(int slot, int deviceId, boolean connected,
            int buttons, float leftX, float leftY, float rightX, float rightY,
            float leftTrigger, float rightTrigger);
    private static native void nativeSelectPrimary(int slot);
    private static native void nativeClearAll();

    GamepadInput(Activity activity) {
        inputManager = activity.getSystemService(InputManager.class);
    }

    void start() {
        if (inputManager == null) {
            Log.e(TAG, "INPUT_MANAGER_UNAVAILABLE");
            return;
        }
        if (!registered) {
            inputManager.registerInputDeviceListener(this, mainHandler);
            registered = true;
        }
        foreground = true;
        refreshDevices();
    }

    void resume() {
        foreground = true;
        refreshDevices();
        Log.i(TAG, "INPUT_FOREGROUND state=active devices=" + connectedCount());
    }

    void pause() {
        foreground = false;
        for (Slot slot : slots) {
            if (slot == null) continue;
            slot.reset();
            publish(slot);
        }
        nativeClearAll();
        primarySlot = -1;
        Log.i(TAG, "INPUT_FOREGROUND state=neutralized");
    }

    void close() {
        pause();
        if (registered && inputManager != null) {
            inputManager.unregisterInputDeviceListener(this);
            registered = false;
        }
    }

    boolean onKeyEvent(KeyEvent event) {
        if (!foreground || (event.getAction() != KeyEvent.ACTION_DOWN &&
                            event.getAction() != KeyEvent.ACTION_UP)) return false;
        int key = event.getKeyCode();
        Slot slot = slotForKeyEvent(event, key);
        if (slot == null) return false;
        boolean pressed = event.getAction() == KeyEvent.ACTION_DOWN;
        switch (key) {
            case KeyEvent.KEYCODE_BUTTON_A: return setButton(slot, A, pressed, "A");
            case KeyEvent.KEYCODE_BUTTON_B: return setButton(slot, B, pressed, "B");
            case KeyEvent.KEYCODE_BUTTON_X: return setButton(slot, X, pressed, "X");
            case KeyEvent.KEYCODE_BUTTON_Y: return setButton(slot, Y, pressed, "Y");
            case KeyEvent.KEYCODE_BUTTON_L1: return setButton(slot, WHITE, pressed, "LB/WHITE");
            case KeyEvent.KEYCODE_BUTTON_R1: return setButton(slot, BLACK, pressed, "RB/BLACK");
            case KeyEvent.KEYCODE_BUTTON_THUMBL: return setButton(slot, L3, pressed, "L3");
            case KeyEvent.KEYCODE_BUTTON_THUMBR: return setButton(slot, R3, pressed, "R3");
            case KeyEvent.KEYCODE_BUTTON_START:
            case KeyEvent.KEYCODE_MENU: return setButton(slot, START, pressed, "START");
            case KeyEvent.KEYCODE_BUTTON_SELECT:
            case KeyEvent.KEYCODE_BACK: return setButton(slot, BACK, pressed, "BACK/VIEW");
            case KeyEvent.KEYCODE_DPAD_UP:
                slot.dpadKeyUp = pressed; return afterInput(slot, "DPAD_UP");
            case KeyEvent.KEYCODE_DPAD_DOWN:
                slot.dpadKeyDown = pressed; return afterInput(slot, "DPAD_DOWN");
            case KeyEvent.KEYCODE_DPAD_LEFT:
                slot.dpadKeyLeft = pressed; return afterInput(slot, "DPAD_LEFT");
            case KeyEvent.KEYCODE_DPAD_RIGHT:
                slot.dpadKeyRight = pressed; return afterInput(slot, "DPAD_RIGHT");
            case KeyEvent.KEYCODE_BUTTON_L2:
                if (!slot.hasAnalogLeftTrigger()) slot.digitalLeftTrigger = pressed;
                return afterInput(slot, "LT_DIGITAL_FALLBACK");
            case KeyEvent.KEYCODE_BUTTON_R2:
                if (!slot.hasAnalogRightTrigger()) slot.digitalRightTrigger = pressed;
                return afterInput(slot, "RT_DIGITAL_FALLBACK");
            case KeyEvent.KEYCODE_BUTTON_MODE:
                // Android guide/system button has no original Xbox guest equivalent.
                return true;
            default:
                return false;
        }
    }

    boolean onMotionEvent(MotionEvent event) {
        if (!foreground || event.getAction() != MotionEvent.ACTION_MOVE) return false;
        if (!isControllerSource(event.getSource())) return false;
        Slot slot = findSlot(event.getDeviceId());
        if (slot == null) {
            InputDevice device = InputDevice.getDevice(event.getDeviceId());
            if (device == null) return false;
            slot = addEventDevice(device);
            if (slot == null) return false;
        }
        slot.leftXRaw = axisValue(event, slot.leftX, 0);
        // Android joystick Y grows down; canonical BoxDroid/Xbox Y grows up.
        slot.leftYRaw = -axisValue(event, slot.leftY, 0);
        slot.rightXRaw = axisValue(event, slot.rightX, 0);
        slot.rightYRaw = -axisValue(event, slot.rightY, 0);
        slot.hatX = axisValue(event, slot.hatXRange, 0);
        slot.hatY = axisValue(event, slot.hatYRange, 0);
        slot.leftTriggerValue = triggerValue(event, slot.leftTrigger);
        slot.rightTriggerValue = triggerValue(event, slot.rightTrigger);
        applyRadialDeadzone(slot);
        return afterInput(slot, "MOTION");
    }

    @Override public void onInputDeviceAdded(int deviceId) {
        InputDevice device = InputDevice.getDevice(deviceId);
        if (isControllerDevice(device)) addDevice(device);
    }

    @Override public void onInputDeviceRemoved(int deviceId) {
        Slot slot = findSlot(deviceId);
        if (slot == null) return;
        logConnection("DISCONNECTED", slot);
        slot.reset();
        nativeSetState(slot.slot, slot.deviceId, false, 0, 0, 0, 0, 0, 0, 0);
        slots[slot.slot] = null;
        if (primarySlot == slot.slot) {
            primarySlot = -1;
            selectAvailablePrimary();
        }
    }

    @Override public void onInputDeviceChanged(int deviceId) {
        InputDevice device = InputDevice.getDevice(deviceId);
        Slot slot = findSlot(deviceId);
        if (!isControllerDevice(device)) {
            onInputDeviceRemoved(deviceId);
            return;
        }
        if (slot == null) addDevice(device);
        else {
            slot.reset();
            slot.updateDevice(device);
            publish(slot);
            logConnection("CAPABILITIES_CHANGED", slot);
        }
    }

    private void refreshDevices() {
        if (inputManager == null) return;
        int[] ids = inputManager.getInputDeviceIds();
        for (int id : ids) {
            InputDevice device = InputDevice.getDevice(id);
            if (isControllerDevice(device) && findSlot(id) == null) addDevice(device);
        }
        for (Slot slot : slots) {
            if (slot == null) continue;
            slot.reset();
            publish(slot);
        }
        if (primarySlot < 0) selectAvailablePrimary();
    }

    private Slot addDevice(InputDevice device) {
        if (device == null || !isControllerDevice(device)) return null;
        return addEventDevice(device);
    }

    private Slot addEventDevice(InputDevice device) {
        if (device == null || device.isVirtual()) return null;
        Slot existing = findSlot(device.getId());
        if (existing != null) return existing;
        for (int i = 0; i < slots.length; i++) {
            if (slots[i] == null) {
                slots[i] = new Slot(i, device);
                publish(slots[i]);
                if (primarySlot < 0) selectPrimary(slots[i]);
                logConnection("CONNECTED", slots[i]);
                return slots[i];
            }
        }
        log("DEVICE_IGNORED reason=maximum_slots device_id=" + device.getId());
        return null;
    }

    private Slot slotForKeyEvent(KeyEvent event, int key) {
        Slot slot = findSlot(event.getDeviceId());
        if (slot != null) return slot;
        InputDevice device = event.getDevice();
        boolean source = isControllerSource(event.getSource());
        boolean standardButton = key >= KeyEvent.KEYCODE_BUTTON_A &&
                                 key <= KeyEvent.KEYCODE_BUTTON_MODE;
        if (isControllerDevice(device)) return addDevice(device);
        if ((source || (standardButton && device != null && !device.isVirtual())) &&
            device != null) {
            return addEventDevice(device);
        }
        return null;
    }

    private static boolean isControllerDevice(InputDevice device) {
        return device != null && !device.isVirtual() &&
               isControllerSource(device.getSources());
    }

    private static boolean isControllerSource(int sources) {
        return isSource(sources, InputDevice.SOURCE_GAMEPAD) ||
               isSource(sources, InputDevice.SOURCE_JOYSTICK) ||
               isSource(sources, InputDevice.SOURCE_DPAD);
    }

    private static boolean isSource(int sources, int source) {
        return (sources & source) == source;
    }

    private Slot findSlot(int deviceId) {
        for (Slot slot : slots) {
            if (slot != null && slot.deviceId == deviceId) return slot;
        }
        return null;
    }

    private int connectedCount() {
        int count = 0;
        for (Slot slot : slots) if (slot != null) count++;
        return count;
    }

    private boolean setButton(Slot slot, int bit, boolean pressed, String label) {
        int previous = slot.keyButtons;
        if (pressed) slot.keyButtons |= bit;
        else slot.keyButtons &= ~bit;
        if (previous != slot.keyButtons) log("BUTTON device_id=" + slot.deviceId +
                " slot=" + slot.slot + " control=" + label + " pressed=" + pressed);
        selectPrimary(slot);
        publish(slot);
        return true;
    }

    private boolean afterInput(Slot slot, String source) {
        selectPrimary(slot);
        publish(slot);
        int bucket = diagnosticBucket(slot);
        if (bucket != slot.lastDiagnosticBucket) {
            slot.lastDiagnosticBucket = bucket;
            log(String.format(Locale.US,
                    "STATE source=%s device_id=%d slot=%d buttons=0x%04x " +
                    "lx=%.2f ly=%.2f rx=%.2f ry=%.2f lt=%.2f rt=%.2f",
                    source, slot.deviceId, slot.slot, slot.buttons(), slot.leftXValue,
                    slot.leftYValue, slot.rightXValue, slot.rightYValue,
                    slot.leftTrigger(), slot.rightTrigger()));
        }
        return true;
    }

    private static int diagnosticBucket(Slot slot) {
        int result = slot.buttons();
        result = result * 31 + direction(slot.leftXValue);
        result = result * 31 + direction(slot.leftYValue);
        result = result * 31 + direction(slot.rightXValue);
        result = result * 31 + direction(slot.rightYValue);
        result = result * 31 + triggerLevel(slot.leftTrigger());
        result = result * 31 + triggerLevel(slot.rightTrigger());
        return result;
    }

    private static int direction(float value) {
        return value < -0.5f ? -1 : value > 0.5f ? 1 : 0;
    }

    private static int triggerLevel(float value) {
        return value <= 0.05f ? 0 : value >= 0.95f ? 2 : 1;
    }

    private void publish(Slot slot) {
        boolean connected = foreground && slot.device != null;
        nativeSetState(slot.slot, slot.deviceId, connected, slot.buttons(),
                connected ? slot.leftXValue : 0,
                connected ? slot.leftYValue : 0,
                connected ? slot.rightXValue : 0,
                connected ? slot.rightYValue : 0,
                connected ? slot.leftTrigger() : 0,
                connected ? slot.rightTrigger() : 0);
    }

    private void selectPrimary(Slot slot) {
        if (slot == null || primarySlot == slot.slot) return;
        primarySlot = slot.slot;
        nativeSelectPrimary(primarySlot);
        log("PRIMARY_CONTROLLER device_id=" + slot.deviceId + " slot=" + slot.slot);
    }

    private void selectAvailablePrimary() {
        for (Slot slot : slots) {
            if (slot != null) {
                selectPrimary(slot);
                return;
            }
        }
    }

    private void logConnection(String action, Slot slot) {
        log("DEVICE_" + action + " name=" + slot.name + " device_id=" + slot.deviceId +
                " slot=" + slot.slot + " axes=" + axisName(slot.leftX) + "/" +
                axisName(slot.leftY) + "," + axisName(slot.rightX) + "/" +
                axisName(slot.rightY) + " triggers=" + axisName(slot.leftTrigger) + "/" +
                axisName(slot.rightTrigger));
    }

    private void log(String message) {
        if (diagnosticCount++ < DIAGNOSTIC_LIMIT) Log.i(TAG, message);
    }

    private static String axisName(AxisRange axis) {
        return axis == null ? "none" : MotionEvent.axisToString(axis.axis);
    }

    private static AxisRange firstRange(InputDevice device, int primary, int fallback) {
        AxisRange range = findRange(device, primary);
        return range != null ? range : findRange(device, fallback);
    }

    private static AxisRange findRange(InputDevice device, int axis) {
        InputDevice.MotionRange range = device.getMotionRange(axis, InputDevice.SOURCE_JOYSTICK);
        if (range == null) range = device.getMotionRange(axis, InputDevice.SOURCE_GAMEPAD);
        if (range == null) range = device.getMotionRange(axis);
        if (range == null || range.getMax() <= range.getMin()) return null;
        AxisRange result = new AxisRange(axis, range);
        return result.valid() ? result : null;
    }

    private static float axisValue(MotionEvent event, AxisRange range, float fallback) {
        return range == null ? fallback : range.centered(event.getAxisValue(range.axis));
    }

    private static float triggerValue(MotionEvent event, AxisRange range) {
        if (range == null) return 0;
        float value = clamp((event.getAxisValue(range.axis) - range.min) /
                (range.max - range.min), 0, 1);
        float flat = clamp(range.triggerFlatFraction, 0, 0.95f);
        return value <= flat ? 0 : (value - flat) / (1 - flat);
    }

    private static void applyRadialDeadzone(Slot slot) {
        float flatX = slot.leftX == null ? 0 : slot.leftX.flat;
        float flatY = slot.leftY == null ? 0 : slot.leftY.flat;
        applyRadial(slot, Math.max(flatX, flatY), true);
        flatX = slot.rightX == null ? 0 : slot.rightX.flat;
        flatY = slot.rightY == null ? 0 : slot.rightY.flat;
        applyRadial(slot, Math.max(flatX, flatY), false);
    }

    private static void applyRadial(Slot slot, float deadzone, boolean left) {
        if (deadzone <= 0) deadzone = FALLBACK_STICK_FLAT;
        deadzone = Math.min(deadzone, 0.95f);
        float x = left ? slot.leftXRaw : slot.rightXRaw;
        float y = left ? slot.leftYRaw : slot.rightYRaw;
        float magnitude = (float)Math.sqrt(x * x + y * y);
        if (magnitude <= deadzone) {
            x = y = 0;
        } else {
            float scaledMagnitude = Math.min(1, (magnitude - deadzone) / (1 - deadzone));
            float scale = scaledMagnitude / magnitude;
            x = clamp(x * scale, -1, 1);
            y = clamp(y * scale, -1, 1);
        }
        if (left) {
            slot.leftXValue = x;
            slot.leftYValue = y;
        } else {
            slot.rightXValue = x;
            slot.rightYValue = y;
        }
    }

    private static float clamp(float value, float min, float max) {
        return value < min ? min : value > max ? max : value;
    }
}
