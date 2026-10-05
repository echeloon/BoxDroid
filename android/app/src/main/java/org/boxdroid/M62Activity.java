package org.boxdroid;

import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;

import org.boxdroid.M61Activity;

/** M6.1 picker/game/audio baseline with Android physical input delivery. */
public final class M62Activity extends M61Activity {
    private static final String TAG = "BoxDroidM62";
    private M62Input physicalInput;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        physicalInput = new M62Input(this);
        physicalInput.start();
        Log.i(TAG, "INPUT_LAYER_READY host=Android_Gamepad_Joystick slots=4 guest=XID_Duke");
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (physicalInput != null) physicalInput.resume();
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
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (physicalInput != null && physicalInput.onKeyEvent(event)) return true;
        return super.dispatchKeyEvent(event);
    }

    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if (physicalInput != null && physicalInput.onMotionEvent(event)) return true;
        return super.dispatchGenericMotionEvent(event);
    }
}
