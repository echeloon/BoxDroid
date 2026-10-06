package org.boxdroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.ImageButton;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class FrontendActivity extends Activity {

    private enum State {
        WELCOME,
        MAIN_MENU,
        GAME_LIBRARY,
        SETTINGS,
        FILE_SYSTEM_SETTINGS
    }

    private State currentState = State.WELCOME;
    private SharedPreferences prefs;
    private List<Game> gameList = new ArrayList<>();
    private GameAdapter adapter;

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

        showWelcomeScreen();
    }

    private void showWelcomeScreen() {
        currentState = State.WELCOME;
        setContentView(R.layout.activity_welcome);

        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            if (currentState == State.WELCOME) {
                showMainMenu();
            }
        }, 2000);
    }

    private void showMainMenu() {
        currentState = State.MAIN_MENU;
        setContentView(R.layout.activity_main_menu);

        findViewById(R.id.btn_select_game).setOnClickListener(v -> {
            if (prefs.getString("mcpx_uri", null) == null ||
                prefs.getString("bios_uri", null) == null ||
                prefs.getString("hdd_uri", null) == null) {
                android.widget.Toast.makeText(this, "Load BIOS, MCPX and HDD Image first.", android.widget.Toast.LENGTH_LONG).show();
            } else {
                showGameLibrary();
            }
        });
        findViewById(R.id.btn_settings).setOnClickListener(v -> showSettings());
        findViewById(R.id.btn_exit).setOnClickListener(v -> finishAffinity());
    }

    private void showSettings() {
        currentState = State.SETTINGS;
        setContentView(R.layout.activity_settings);

        View layoutFileSystemSettings = findViewById(R.id.layout_file_system_settings);
        layoutFileSystemSettings.setOnClickListener(v -> showFileSystemSettings());
    }

    private void showFileSystemSettings() {
        currentState = State.FILE_SYSTEM_SETTINGS;
        setContentView(R.layout.activity_file_system_settings);

        View layoutMcpx = findViewById(R.id.layout_select_mcpx);
        View layoutBios = findViewById(R.id.layout_select_bios);
        View layoutHdd = findViewById(R.id.layout_select_hdd);

        TextView textMcpx = findViewById(R.id.text_mcpx_name);
        TextView textBios = findViewById(R.id.text_bios_name);
        TextView textHdd = findViewById(R.id.text_hdd_name);

        ImageButton btnDeleteMcpx = findViewById(R.id.btn_delete_mcpx);
        ImageButton btnDeleteBios = findViewById(R.id.btn_delete_bios);
        ImageButton btnDeleteHdd = findViewById(R.id.btn_delete_hdd);

        android.widget.ImageView iconMcpx = findViewById(R.id.icon_mcpx);
        android.widget.ImageView iconBios = findViewById(R.id.icon_bios);
        android.widget.ImageView iconHdd = findViewById(R.id.icon_hdd);

        updateSettingsItemText(textMcpx, btnDeleteMcpx, iconMcpx, "Select MCPX", "mcpx_uri");
        updateSettingsItemText(textBios, btnDeleteBios, iconBios, "Select BIOS", "bios_uri");
        updateSettingsItemText(textHdd, btnDeleteHdd, iconHdd, "Select HDD Image", "hdd_uri");

        layoutMcpx.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            startActivityForResult(intent, REQUEST_CODE_SELECT_MCPX);
        });

        btnDeleteMcpx.setOnClickListener(v -> {
            prefs.edit().remove("mcpx_uri").apply();
            updateSettingsItemText(textMcpx, btnDeleteMcpx, iconMcpx, "Select MCPX", "mcpx_uri");
        });

        layoutBios.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            startActivityForResult(intent, REQUEST_CODE_SELECT_BIOS);
        });

        btnDeleteBios.setOnClickListener(v -> {
            prefs.edit().remove("bios_uri").apply();
            updateSettingsItemText(textBios, btnDeleteBios, iconBios, "Select BIOS", "bios_uri");
        });

        layoutHdd.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            startActivityForResult(intent, REQUEST_CODE_SELECT_HDD);
        });

        btnDeleteHdd.setOnClickListener(v -> {
            prefs.edit().remove("hdd_uri").apply();
            updateSettingsItemText(textHdd, btnDeleteHdd, iconHdd, "Select HDD Image", "hdd_uri");
        });
    }

    private void updateSettingsItemText(TextView textView, ImageButton deleteBtn, android.widget.ImageView iconView, String defaultText, String prefKey) {
        String uriString = prefs.getString(prefKey, null);
        if (uriString != null) {
            String name = getFileNameFromUri(Uri.parse(uriString));
            if (name == null || name.isEmpty()) {
                name = defaultText + " (Loaded)";
            }
            textView.setText(name);
            deleteBtn.setVisibility(View.VISIBLE);
            iconView.setVisibility(View.VISIBLE);
        } else {
            textView.setText(defaultText);
            deleteBtn.setVisibility(View.GONE);
            iconView.setVisibility(View.INVISIBLE);
        }
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

    private void showGameLibrary() {
        currentState = State.GAME_LIBRARY;
        setContentView(R.layout.activity_game_library);

        ListView listView = findViewById(R.id.list_games);
        TextView textEmpty = findViewById(R.id.text_empty);

        adapter = new GameAdapter();
        listView.setAdapter(adapter);

        updateEmptyView();

        findViewById(R.id.btn_add_game).setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/octet-stream"); // xiso
            startActivityForResult(intent, REQUEST_CODE_ADD_GAME);
        });

        listView.setOnItemClickListener((parent, view, position, id) -> {
            Game game = gameList.get(position);
            startGame(game.uri);
        });
    }

    private void startGame(String uriString) {
        Intent intent = new Intent(this, org.boxdroid.GameActivity.class);
        intent.setData(Uri.parse(uriString));
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        gameStartTime = System.currentTimeMillis();
        startActivityForResult(intent, REQUEST_CODE_START_GAME);
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

                    gameList.add(new Game(name, uri.toString()));
                    saveGames();
                    
                    if (currentState == State.GAME_LIBRARY) {
                        adapter.notifyDataSetChanged();
                        updateEmptyView();
                    }
                } else if (requestCode == REQUEST_CODE_SELECT_MCPX) {
                    getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    prefs.edit().putString("mcpx_uri", uri.toString()).apply();
                    if (currentState == State.FILE_SYSTEM_SETTINGS) showFileSystemSettings();
                } else if (requestCode == REQUEST_CODE_SELECT_BIOS) {
                    getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    prefs.edit().putString("bios_uri", uri.toString()).apply();
                    if (currentState == State.FILE_SYSTEM_SETTINGS) showFileSystemSettings();
                } else if (requestCode == REQUEST_CODE_SELECT_HDD) {
                    getContentResolver().takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
                    prefs.edit().putString("hdd_uri", uri.toString()).apply();
                    if (currentState == State.FILE_SYSTEM_SETTINGS) showFileSystemSettings();
                }
            }
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    private void updateEmptyView() {
        TextView textEmpty = findViewById(R.id.text_empty);
        if (textEmpty != null) {
            textEmpty.setVisibility(gameList.isEmpty() ? View.VISIBLE : View.GONE);
        }
    }

    @Override
    public void onBackPressed() {
        if (currentState == State.GAME_LIBRARY || currentState == State.SETTINGS) {
            showMainMenu();
        } else if (currentState == State.FILE_SYSTEM_SETTINGS) {
            showSettings();
        } else if (currentState == State.MAIN_MENU) {
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

    private class GameAdapter extends BaseAdapter {
        @Override
        public int getCount() { return gameList.size(); }
        @Override
        public Object getItem(int position) { return gameList.get(position); }
        @Override
        public long getItemId(int position) { return position; }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = LayoutInflater.from(FrontendActivity.this).inflate(R.layout.item_game, parent, false);
            }

            Game game = gameList.get(position);
            TextView textName = convertView.findViewById(R.id.text_game_name);
            ImageButton btnDelete = convertView.findViewById(R.id.btn_delete_game);

            textName.setText(game.name);
            
            // Fix click interception by setting focusable false
            btnDelete.setFocusable(false);
            btnDelete.setOnClickListener(v -> {
                gameList.remove(position);
                saveGames();
                notifyDataSetChanged();
                updateEmptyView();
            });

            return convertView;
        }
    }
}
