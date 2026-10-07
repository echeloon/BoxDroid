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

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences("boxdroid_games", Context.MODE_PRIVATE);
        loadGames();

        android.widget.FrameLayout container = new android.widget.FrameLayout(this);
        container.setBackgroundColor(android.graphics.Color.BLUE); // Blue background to test
        
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
            public void onPageFinished(WebView view, String url) {
                view.evaluateJavascript("window.boxDroidController = function(action) {"
                        + "var allItems = Array.from(document.querySelectorAll('a[href], button:not(:disabled), [role=button], input:not(:disabled), select:not(:disabled), textarea:not(:disabled)'));"
                        + "var selectedItem = allItems.find(function(item) { return item.classList.contains('controller-selected'); });"
                        + "if (!allItems.length) return;"
                        + "if (action === 'activate') { var target = selectedItem || allItems[0];"
                        + "document.querySelectorAll('.controller-selected').forEach(function(item) { item.classList.remove('controller-selected'); }); target.click(); return; }"
                        + "var vertical = action === 'up' || action === 'down';"
                        + "var items = vertical ? allItems.filter(function(item) { var row = item.closest('.neon-card--row'); return !row || item.matches('.neon-card__row-select'); }) : allItems;"
                        + "var currentItem = selectedItem;"
                        + "if (vertical && currentItem) { var currentRow = currentItem.closest('.neon-card--row');"
                        + "if (currentRow && !currentItem.matches('.neon-card__row-select')) currentItem = currentRow.querySelector('.neon-card__row-select') || currentItem; }"
                        + "var currentIndex = items.indexOf(currentItem);"
                        + "var forward = action === 'down' || action === 'right';"
                        + "var next = currentIndex < 0 ? (forward ? 0 : items.length - 1)"
                        + ": (currentIndex + (forward ? 1 : items.length - 1)) % items.length;"
                        + "document.querySelectorAll('.controller-selected').forEach(function(item) { item.classList.remove('controller-selected'); });"
                        + "var target = items[next]; target.classList.add('controller-selected');"
                        + "var card = target.closest('.neon-card--row') || target.closest('.neon-card'); if (card) card.classList.add('controller-selected');"
                        + "};", null);
            }

            @Override
            public android.webkit.WebResourceResponse shouldInterceptRequest(WebView view, android.webkit.WebResourceRequest request) {
                Uri url = request.getUrl();
                if ("http".equals(url.getScheme()) && "boxdroid.local".equals(url.getHost())) {
                    android.util.Log.e("BoxDroid-WebView", "Intercepting virtual host request: " + url.toString());
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
                android.util.Log.e("BoxDroid-WebView", consoleMessage.message() + " -- From line "
                        + consoleMessage.lineNumber() + " of "
                        + consoleMessage.sourceId());
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
            if (event.getAction() == KeyEvent.ACTION_DOWN) {
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
                        if (webView.canGoBack()) webView.goBack();
                        else onBackPressed();
                        return true;
                    default: return super.dispatchKeyEvent(event);
                }
                final String controllerAction = action;
                webView.evaluateJavascript("window.boxDroidController && window.boxDroidController('"
                        + controllerAction + "')", null);
            }
            return true;
        }
        return super.dispatchKeyEvent(event);
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
        if (requestCode == REQUEST_CODE_START_GAME) {
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
    public void onBackPressed() {
        if (webView.canGoBack()) {
            webView.goBack();
        } else {
            super.onBackPressed();
        }
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
