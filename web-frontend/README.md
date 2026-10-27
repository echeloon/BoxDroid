# BoxDroid web frontend

The BoxDroid user interface: main menu, game library and settings. It is a
React single-page app (React Router in SPA mode, Vite, Tailwind CSS) that the
Android app bundles as assets and shows in a WebView.

## How it is loaded

`scripts/build-android.sh` runs `npm run build` and copies `build/client/` into
`android/app/src/main/assets/www/`. `FrontendActivity` serves those files from
the virtual host `http://boxdroid.local/`, falling back to `index.html` for
client-side routes.

## Talking to Android

The app exposes a JavaScript interface named `BoxDroidBridge` (implemented in
`FrontendActivity.WebAppBridge`, typed in [`app/types.d.ts`](app/types.d.ts)):

| Call | Purpose |
| --- | --- |
| `getGames()`, `getSettings()` | Read the game list and the system file / graphics driver state (JSON strings) |
| `addGame()`, `deleteGame(index)`, `startGame(uri)` | Manage and launch games |
| `selectMcpx()`, `selectBios()`, `selectHdd()`, `clearSetting(key)` | Pick or clear system files through the Android file picker |
| `loadGraphicsDriver()`, `selectGraphicsDriver(mode)`, `deleteGraphicsDriver()` | Import, select or remove a custom Vulkan driver |

Android dispatches `games_changed` and `settings_changed` events on `window`
when that state changes, for example after a file picker returns.

## Development

```bash
npm ci
npm run dev      # dev server; BoxDroidBridge is absent in a desktop browser
npm run lint     # oxlint
npm run build    # production build into build/client/
```

To test on a device, run `./scripts/build-android.sh` from the repository root;
it rebuilds the frontend and packages it into the APK.

## Layout

| Path | Contents |
| --- | --- |
| `app/routes/` | `_index` (main menu), `library`, `settings`, and the shared `matrix-layout` |
| `app/components/` | UI components, including the vendored NeonBlade ASCII rain background |
| `app/root.tsx`, `app/entry.client.tsx` | App shell and client entry point |
