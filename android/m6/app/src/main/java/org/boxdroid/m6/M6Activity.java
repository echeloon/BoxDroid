package org.boxdroid.m6;

import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.boxdroid.m5.PerformanceActivity;

/** M6-only Android focus/lifecycle owner for the native AAudio output stream. */
public final class M6Activity extends PerformanceActivity {
    private static final String TAG = "BoxDroidM6";

    private AudioManager audioManager;
    private AudioFocusRequest focusRequest;
    private boolean focusGranted;
    private boolean resumed;

    private native int nativeM6AudioInitialize();
    private native void nativeM6AudioSetFocus(boolean focused);
    private native void nativeM6AudioSetForeground(boolean foreground);
    private native String nativeM6AudioOverlayMetrics();
    private native void nativeM6AudioShutdown();

    private final AudioManager.OnAudioFocusChangeListener focusListener = change -> {
        if (change == AudioManager.AUDIOFOCUS_GAIN) {
            focusGranted = true;
            Log.i(TAG, "AUDIO_FOCUS_GAIN");
        } else {
            // Transient loss, duck request, and permanent loss all mute the
            // one native stream. The emulated APU and its state keep running.
            focusGranted = false;
            Log.i(TAG, "AUDIO_FOCUS_LOSS change=" + change);
        }
        nativeM6AudioSetFocus(focusGranted);
        nativeM6AudioSetForeground(resumed);
    };

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        audioManager = getSystemService(AudioManager.class);
        AudioAttributes attributes = new AudioAttributes.Builder()
                .setUsage(AudioAttributes.USAGE_GAME)
                .setContentType(AudioAttributes.CONTENT_TYPE_MUSIC)
                .build();
        focusRequest = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN)
                .setAudioAttributes(attributes)
                .setWillPauseWhenDucked(true)
                .setAcceptsDelayedFocusGain(false)
                .setOnAudioFocusChangeListener(focusListener, new Handler(Looper.getMainLooper()))
                .build();
    }

    @Override
    protected void beforeNativeRuntimeStart() {
        int result = nativeM6AudioInitialize();
        Log.i(TAG, "AAUDIO_INITIALIZE result=" + result);
        nativeM6AudioSetFocus(focusGranted);
        nativeM6AudioSetForeground(resumed);
    }

    @Override
    protected boolean stopRuntimeOnActivityStop() {
        // Keep the guest/APU instance alive across ordinary backgrounding;
        // native output is muted and incoming PCM is discarded while away.
        return false;
    }

    @Override
    protected void onStart() {
        super.onStart();
        int result = audioManager.requestAudioFocus(focusRequest);
        focusGranted = result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED;
        Log.i(TAG, "AUDIO_FOCUS_REQUEST result=" + result);
        nativeM6AudioSetFocus(focusGranted);
    }

    @Override
    protected void onResume() {
        super.onResume();
        resumed = true;
        nativeM6AudioSetForeground(true);
    }

    @Override
    protected void onPause() {
        resumed = false;
        nativeM6AudioSetForeground(false);
        super.onPause();
    }

    @Override
    protected void onStop() {
        resumed = false;
        nativeM6AudioSetForeground(false);
        focusGranted = false;
        nativeM6AudioSetFocus(false);
        if (audioManager != null && focusRequest != null) {
            audioManager.abandonAudioFocusRequest(focusRequest);
        }
        super.onStop();
    }

    @Override
    protected void afterNativeRuntimeStop() {
        // MainActivity invokes this on its serialized native executor only
        // after nativeXboxStop() has joined the QEMU/APU threads.
        Log.i(TAG, "AAUDIO_SHUTDOWN_BEGIN");
        nativeM6AudioShutdown();
        Log.i(TAG, "AAUDIO_SHUTDOWN_COMPLETE");
    }

    @Override
    public void onBackPressed() {
        Log.i(TAG, "CLEAN_SHUTDOWN_REQUEST");
        resumed = false;
        focusGranted = false;
        nativeM6AudioSetForeground(false);
        nativeM6AudioSetFocus(false);
        if (audioManager != null && focusRequest != null) {
            audioManager.abandonAudioFocusRequest(focusRequest);
        }
        shutdownNativeRuntimeAndFinish();
    }

    @Override
    protected String additionalOverlayMetrics() {
        return nativeM6AudioOverlayMetrics();
    }
}
