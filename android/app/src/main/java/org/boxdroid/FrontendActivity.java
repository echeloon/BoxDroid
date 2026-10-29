package org.boxdroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class FrontendActivity extends Activity {

    private SharedPreferences prefs;
    private List<Game> gameList = new ArrayList<>();
    private WebView webView;

    private static final int REQUEST_CODE_ADD_GAME = 1001;
    private static final int REQUEST_CODE_SELECT_MCPX = 1002;
    private static final int REQUEST_CODE_SELECT_BIOS = 1003;
    private static final int REQUEST_CODE_SELECT_HDD = 1004;
    private static final int REQUEST_CODE_START_GAME = 1005;
    private long gameStartTime;
    private GraphicsDriverStore drivers;
    private volatile java.io.File driverStage;
    private volatile boolean driverBusy;
    private static final int REQUEST_DRIVER_ZIP = 1006;
    private static final int REQUEST_DRIVER_PROBE = 1007;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences("boxdroid_games", Context.MODE_PRIVATE);
        loadGames();
        drivers = new GraphicsDriverStore(this);
        drivers.recoverInterruptedStartup();
        if (savedInstanceState != null && savedInstanceState.containsKey("driverStage")) {
            driverStage = new java.io.File(savedInstanceState.getString("driverStage"));
            driverBusy = true;
        }

        drivers.cleanupInterruptedImport(driverStage);

        android.widget.FrameLayout container = new android.widget.FrameLayout(this);
        container.setBackgroundColor(android.graphics.Color.BLUE); // Blue background to test
        
        if ((getApplicationInfo().flags & android.content.pm.ApplicationInfo.FLAG_DEBUGGABLE) != 0) WebView.setWebContentsDebuggingEnabled(true);
        webView = new WebView(this);
        webView.setDefaultFocusHighlightEnabled(false);
        android.widget.FrameLayout.LayoutParams params = new android.widget.FrameLayout.LayoutParams(
                android.view.ViewGroup.LayoutParams.MATCH_PARENT,
                android.view.ViewGroup.LayoutParams.MATCH_PARENT);
        webView.setLayoutParams(params);
        container.addView(webView);
        setContentView(container);

        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setDomStorageEnabled(true);
        webSettings.setAllowFileAccessFromFileURLs(true);
        webSettings.setAllowUniversalAccessFromFileURLs(true);

        webView.setWebViewClient(new WebViewClient() {
            @Override
            public android.webkit.WebResourceResponse shouldInterceptRequest(WebView view, android.webkit.WebResourceRequest request) {
                Uri url = request.getUrl();
                if ("http".equals(url.getScheme()) && "boxdroid.local".equals(url.getHost())) {
                    android.util.Log.d("BoxDroid-WebView", "Intercepting virtual host request: " + url.toString());
                    String path = url.getPath();
                    if (path == null || path.isEmpty() || path.equals("/")) path = "/index.html";
                    
                    try {
                        String assetPath = "www" + path;
                        java.io.InputStream is = null;
                        try {
                            is = getAssets().open(assetPath);
                        } catch (java.io.IOException e) {
                            // SPA Fallback
                            is = getAssets().open("www/index.html");
                            path = "/index.html";
                        }
                        
                        String mimeType = "text/html";
                        if (path.endsWith(".css")) mimeType = "text/css";
                        else if (path.endsWith(".js")) mimeType = "text/javascript";
                        else if (path.endsWith(".svg")) mimeType = "image/svg+xml";
                        else if (path.endsWith(".png")) mimeType = "image/png";
                        
                        // Add CORS headers to allow module scripts
                        java.util.Map<String, String> headers = new java.util.HashMap<>();
                        headers.put("Access-Control-Allow-Origin", "*");
                        return new android.webkit.WebResourceResponse(mimeType, "UTF-8", 200, "OK", headers, is);
                    } catch (java.io.IOException e) {
                        e.printStackTrace();
                    }
                }
                return super.shouldInterceptRequest(view, request);
            }
        });
        webView.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onConsoleMessage(android.webkit.ConsoleMessage consoleMessage) {
                String message = consoleMessage.message() + " -- From line "
                        + consoleMessage.lineNumber() + " of "
                        + consoleMessage.sourceId();
                switch (consoleMessage.messageLevel()) {
                    case ERROR: android.util.Log.e("BoxDroid-WebView", message); break;
                    case WARNING: android.util.Log.w("BoxDroid-WebView", message); break;
                    default: android.util.Log.d("BoxDroid-WebView", message); break;
                }
                return super.onConsoleMessage(consoleMessage);
            }
        });
        webView.addJavascriptInterface(new WebAppBridge(), "BoxDroidBridge");

        // Assuming you have built the React app into assets/www
        webView.loadUrl("http://boxdroid.local/");
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (webView != null && isControllerEvent(event)) {
            int keyCode = event.getKeyCode();
            String action = null;
            if (pressStarts(event)) {
                switch (keyCode) {
                    case KeyEvent.KEYCODE_DPAD_UP: action = "up"; break;
                    case KeyEvent.KEYCODE_DPAD_DOWN: action = "down"; break;
                    case KeyEvent.KEYCODE_DPAD_LEFT: action = "left"; break;
                    case KeyEvent.KEYCODE_DPAD_RIGHT: action = "right"; break;
                    case KeyEvent.KEYCODE_DPAD_CENTER:
                    case KeyEvent.KEYCODE_BUTTON_A:
                    case KeyEvent.KEYCODE_ENTER: action = "activate"; break;
                    case KeyEvent.KEYCODE_BUTTON_B:
                    case KeyEvent.KEYCODE_BACK:
                        onBackPressed();
                        return true;
                    default: return super.dispatchKeyEvent(event);
                }
                sendControllerAction(action);
            }
            return true;
        }
        return super.dispatchKeyEvent(event);
    }

    /** Navigation lives in the web app (app/controller.ts). */
    private void sendControllerAction(String action) {
        webView.evaluateJavascript("window.boxDroidController && window.boxDroidController('" + action + "')", null);
    }

    /**
     * Many controllers report the D-pad as a hat axis. Android only turns it
     * into D-pad keys when no view consumes the motion, and the WebView may,
     * so hat and left stick are read here, one step per push.
     */
    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if (webView == null || (event.getSource() & InputDevice.SOURCE_CLASS_JOYSTICK) == 0
                || event.getAction() != MotionEvent.ACTION_MOVE) {
            return super.dispatchGenericMotionEvent(event);
        }
        float x = event.getAxisValue(MotionEvent.AXIS_HAT_X);
        float y = event.getAxisValue(MotionEvent.AXIS_HAT_Y);
        if (Math.abs(x) < STICK_THRESHOLD && Math.abs(y) < STICK_THRESHOLD) {
            x = event.getAxisValue(MotionEvent.AXIS_X);
            y = event.getAxisValue(MotionEvent.AXIS_Y);
        }
        String direction = null;
        if (y <= -STICK_THRESHOLD) direction = "up";
        else if (y >= STICK_THRESHOLD) direction = "down";
        else if (x <= -STICK_THRESHOLD) direction = "left";
        else if (x >= STICK_THRESHOLD) direction = "right";
        if (!java.util.Objects.equals(direction, stickDirection)) {
            stickDirection = direction;
            if (direction != null) sendControllerAction(direction);
        }
        return true;
    }

    private static final float STICK_THRESHOLD = 0.5f;
    private String stickDirection;
    private final android.util.SparseLongArray pressDownTimes = new android.util.SparseLongArray();
    private long resumedAt;

    /**
     * True once per press. Leaving touch mode consumes the first key press
     * after a touch, so only its release arrives: a release whose press was
     * never seen counts as the press, unless the press began before this
     * screen returned (the A that confirmed Quit to menu in a game).
     */
    private boolean pressStarts(KeyEvent event) {
        int key = event.getKeyCode();
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            pressDownTimes.put(key, event.getDownTime());
            return true;
        }
        return event.getAction() == KeyEvent.ACTION_UP && event.getDownTime() >= resumedAt
                && pressDownTimes.get(key, -1) != event.getDownTime();
    }

    private boolean isControllerEvent(KeyEvent event) {
        int keyCode = event.getKeyCode();
        if (keyCode == KeyEvent.KEYCODE_DPAD_UP || keyCode == KeyEvent.KEYCODE_DPAD_DOWN
                || keyCode == KeyEvent.KEYCODE_DPAD_LEFT || keyCode == KeyEvent.KEYCODE_DPAD_RIGHT
                || keyCode == KeyEvent.KEYCODE_DPAD_CENTER || keyCode == KeyEvent.KEYCODE_BUTTON_A
                || keyCode == KeyEvent.KEYCODE_BUTTON_B || keyCode == KeyEvent.KEYCODE_ENTER) {
            return true;
        }
        InputDevice device = InputDevice.getDevice(event.getDeviceId());
        if (device == null) return false;
        int sources = device.getSources();
        return (sources & InputDevice.SOURCE_GAMEPAD) == InputDevice.SOURCE_GAMEPAD
                || (sources & InputDevice.SOURCE_DPAD) == InputDevice.SOURCE_DPAD;
    }

    private class WebAppBridge {
        @JavascriptInterface
        public String getGames() {
            return prefs.getString("games", "[]");
        }

        @JavascriptInterface
        public String getSettings() {
            JSONObject obj = new JSONObject();
            try {
                obj.put("mcpx_uri", getFileRef("mcpx_uri", "Select MCPX"));
                obj.put("bios_uri", getFileRef("bios_uri", "Select BIOS"));
                obj.put("hdd_uri", getFileRef("hdd_uri", "Select HDD Image"));
                JSONObject driver = drivers.frontendState();
                driver.put("busy", driverBusy);
                obj.put("graphicsDriver", driver);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return obj.toString();
        }

        private JSONObject getFileRef(String key, String defaultName) throws JSONException {
            JSONObject ref = new JSONObject();
            String uriString = prefs.getString(key, null);
            if (uriString != null) {
                String name = getFileNameFromUri(Uri.parse(uriString));
                if (name == null || name.isEmpty()) name = defaultName + " (Loaded)";
                ref.put("isSet", true);
                ref.put("name", name);
            } else {
                ref.put("isSet", false);
                ref.put("name", defaultName);
            }
            return ref;
        }

        @JavascriptInterface
        public void loadGraphicsDriver() {
            runOnUiThread(() -> {
                if (driverBusy) return;
                Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                intent.addCategory(Intent.CATEGORY_OPENABLE);
                intent.setType("*/*");
                intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                startActivityForResult(intent, REQUEST_DRIVER_ZIP);
            });
        }

        @JavascriptInterface
        public void selectGraphicsDriver(String mode) {
            runOnUiThread(() -> {
                if (driverBusy) return;
                try {
                    if (!mode.equals("SYSTEM") && !mode.equals("CUSTOM")) throw new Exception("Invalid driver mode");
                    drivers.select(mode.equals("CUSTOM"));
                } catch (Exception e) { drivers.error(e.getMessage()); }
                notifyWeb("settings_changed");
            });
        }

        @JavascriptInterface
        public void deleteGraphicsDriver() {
            runOnUiThread(() -> {
                if (driverBusy) return;
                try { drivers.remove(); } catch (Exception e) { drivers.error(e.getMessage()); }
                notifyWeb("settings_changed");
            });
        }

        @JavascriptInterface
        public void addGame() {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/octet-stream");
            startActivityForResult(intent, REQUEST_CODE_ADD_GAME);
        }

        @JavascriptInterface
        public void selectMcpx() {
            selectFile(REQUEST_CODE_SELECT_MCPX);
        }

        @JavascriptInterface
        public void selectBios() {
            selectFile(REQUEST_CODE_SELECT_BIOS);
        }

        @JavascriptInterface
        public void selectHdd() {
            selectFile(REQUEST_CODE_SELECT_HDD);
        }

        private void selectFile(int requestCode) {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            startActivityForResult(intent, requestCode);
        }

        @JavascriptInterface
        public void deleteGame(int position) {
            if (position >= 0 && position < gameList.size()) {
                gameList.remove(position);
                saveGames();
                notifyWeb("games_changed");
            }
        }

        @JavascriptInterface
        public void clearSetting(String key) {
            prefs.edit().remove(key).apply();
            notifyWeb("settings_changed");
        }

        @JavascriptInterface
        public void startGame(String uriString) {
            Intent intent = new Intent(FrontendActivity.this, org.boxdroid.GameActivity.class);
            intent.setData(Uri.parse(uriString));
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            gameStartTime = System.currentTimeMillis();
            startActivityForResult(intent, REQUEST_CODE_START_GAME);
        }
    }

    private void notifyWeb(String eventName) {
        runOnUiThread(() -> {
            webView.evaluateJavascript("window.dispatchEvent(new Event('" + eventName + "'))", null);
        });
    }

    private String getFileNameFromUri(Uri uri) {
        String name = null;
        try (android.database.Cursor cursor = getContentResolver().query(uri, null, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                int index = cursor.getColumnIndex(android.provider.OpenableColumns.DISPLAY_NAME);
                if (index != -1) {
                    name = cursor.getString(index);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_DRIVER_PROBE) {
            try {
                if (resultCode != RESULT_OK) throw new Exception(data == null ? "Driver validation process failed" : data.getStringExtra("error"));
                if (driverStage == null) throw new Exception("Driver import state was lost");
                drivers.commit(driverStage);
            } catch (Exception e) { drivers.error("Driver import failed: " + e.getMessage()); }
            finally {
                if (driverStage != null) try { GraphicsDriverStore.deleteTree(driverStage); } catch (Exception e) { android.util.Log.e("BoxDroid-Driver", "Staging cleanup failed", e); }
                driverStage = null; driverBusy = false; notifyWeb("settings_changed");
            }
            return;
        }
        if (requestCode == REQUEST_DRIVER_ZIP) {
            if (resultCode == RESULT_OK && data != null && data.getData() != null) {
                final Uri selected = data.getData();
                driverBusy = true; notifyWeb("settings_changed");
                new Thread(() -> {
                    try {
                        driverStage = drivers.importZip(this, selected);
                        runOnUiThread(() -> {
                            Intent probe = new Intent(this, GraphicsDriverProbe.class);
                            probe.putExtra("directory", driverStage.getAbsolutePath());
                            startActivityForResult(probe, REQUEST_DRIVER_PROBE);
                        });
                    } catch (Exception e) {
                        drivers.error("Driver import failed: " + e.getMessage());
                        driverBusy = false; notifyWeb("settings_changed");
                    }
                }, "DriverImport").start();
            }
            return;
        }
        if (requestCode == REQUEST_CODE_START_GAME) {
            drivers.recoverInterruptedStartup();
            notifyWeb("settings_changed");
            if (resultCode == RESULT_CANCELED && (System.currentTimeMillis() - gameStartTime) < 5000) {
                android.widget.Toast.makeText(this, "Could Not Load Game, Check your system files again", android.widget.Toast.LENGTH_LONG).show();
            }
            return;
        }

        if (resultCode == Activity.RESULT_OK && data != null) {
            Uri uri = data.getData();
            if (uri != null) {
                if (requestCode == REQUEST_CODE_ADD_GAME) {
                    getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    
                    String name = "Unknown Game";
                    name = getFileNameFromUri(uri);

                    gameList.add(new Game(name, uri.toString()));
                    saveGames();
                    notifyWeb("games_changed");
                } else if (requestCode == REQUEST_CODE_SELECT_MCPX) {
                    getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    prefs.edit().putString("mcpx_uri", uri.toString()).apply();
                    notifyWeb("settings_changed");
                } else if (requestCode == REQUEST_CODE_SELECT_BIOS) {
                    getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    prefs.edit().putString("bios_uri", uri.toString()).apply();
                    notifyWeb("settings_changed");
                } else if (requestCode == REQUEST_CODE_SELECT_HDD) {
                    getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                    prefs.edit().putString("hdd_uri", uri.toString()).apply();
                    notifyWeb("settings_changed");
                }
            }
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    @Override
    protected void onSaveInstanceState(Bundle out) {
        if (driverStage != null) out.putString("driverStage", driverStage.getAbsolutePath());
        super.onSaveInstanceState(out);
    }

    @Override
    protected void onResume() {
        super.onResume();
        resumedAt = android.os.SystemClock.uptimeMillis();
        if (webView != null) notifyWeb("settings_changed");
    }

    @Override
    public void onBackPressed() {
        webView.evaluateJavascript("(function(){var back=Array.from(document.querySelectorAll('a[href]')).find(function(item){return item.textContent.trim()==='Back';});if(back){back.click();return true;}return false;})()",
            handled -> { if (!"true".equals(handled)) finish(); });
    }

    private void loadGames() {
        gameList.clear();
        String json = prefs.getString("games", "[]");
        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.getJSONObject(i);
                gameList.add(new Game(obj.getString("name"), obj.getString("uri")));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void saveGames() {
        JSONArray array = new JSONArray();
        for (Game g : gameList) {
            JSONObject obj = new JSONObject();
            try {
                obj.put("name", g.name);
                obj.put("uri", g.uri);
                array.put(obj);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        prefs.edit().putString("games", array.toString()).apply();
    }

    private class Game {
        String name;
        String uri;

        Game(String name, String uri) {
            this.name = name;
            this.uri = uri;
        }
    }
}
