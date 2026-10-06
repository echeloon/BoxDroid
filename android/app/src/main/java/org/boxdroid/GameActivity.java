package org.boxdroid;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;

import org.boxdroid.BootEmulatorActivity;


public class GameActivity extends BootEmulatorActivity {
    private static final String TAG = "BoxDroid_Game";
    private static final int REQUEST_XISO = 6101;
    
    private GamepadInput physicalInput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        physicalInput = new GamepadInput(this);
        physicalInput.start();
        Log.i(TAG, "INPUT_LAYER_READY host=Android_Gamepad_Joystick slots=4 guest=XID_Duke");
        
        Uri uri = getIntent().getData();
        if (uri != null) {
            Log.i(TAG, "Received game URI: " + uri);
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
        // Since the native emulator is not re-entrant, we must kill the emulator process
        // when the activity is destroyed to ensure a clean slate for the next game.
        System.exit(0);
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
