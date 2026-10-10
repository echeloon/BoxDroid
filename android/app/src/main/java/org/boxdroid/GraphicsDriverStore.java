package org.boxdroid;

import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.util.AtomicFile;
import android.util.Log;
import org.json.JSONObject;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.*;

/** Private schema-1 Android driver packages. The SAF grant is used only during import. */
final class GraphicsDriverStore {
    private static final Object STATE_LOCK = new Object();
    private static final String TAG = "BoxDroid-Driver";
    private static final long ZIP_LIMIT = 32L * 1024 * 1024, EXPANDED_LIMIT = 128L * 1024 * 1024;
    private final File root;
    private final Context context;
    private final AtomicFile state;
    GraphicsDriverStore(Context context) {
        this.context = context.getApplicationContext();
        root = new File(context.getFilesDir(), "graphics-drivers");
        root.mkdirs();
        state = new AtomicFile(new File(root, "state.json"));
    }
    synchronized JSONObject read() {
        synchronized (STATE_LOCK) {
            try (FileOutputStream lockFile = new FileOutputStream(new File(root, "state.lock"), true);
                 java.nio.channels.FileLock lock = lockFile.getChannel().lock();
                 InputStream in = state.openRead()) {
                return new JSONObject(new String(readBounded(in, 32768), StandardCharsets.UTF_8));
            } catch (Exception e) {
                if (state.getBaseFile().exists()) Log.e(TAG, "Cannot read driver state; using SYSTEM", e);
                return new JSONObject();
            }
        }
    }
    synchronized void write(JSONObject value) throws Exception {
        synchronized (STATE_LOCK) {
            try (FileOutputStream lockFile = new FileOutputStream(new File(root, "state.lock"), true);
                 java.nio.channels.FileLock lock = lockFile.getChannel().lock()) {
                FileOutputStream out = null;
                try { out = state.startWrite(); out.write(value.toString().getBytes(StandardCharsets.UTF_8)); state.finishWrite(out); }
                catch (Exception e) { if (out != null) state.failWrite(out); throw e; }
            }
        }
    }
    File installed() { return new File(root, "custom"); }
    File startupMarker() { return new File(root, "custom-starting"); }
    synchronized JSONObject frontendState() {
        JSONObject value = read();
        try {
            value.put("mode", value.optString("mode", "SYSTEM"));
            value.put("installed", new File(installed(), "meta.json").isFile() && value.has("metadata"));
        } catch (Exception ignored) { }
        return value;
    }
    synchronized void select(boolean custom) throws Exception {
        JSONObject value = read();
        if (custom && !frontendState().optBoolean("installed")) throw new IOException("No validated custom driver installed");
        value.put("mode", custom ? "CUSTOM" : "SYSTEM"); value.remove("error"); write(value);
    }
    synchronized void error(String message) {
        Log.e(TAG, message);
        try { JSONObject value = read(); value.put("error", message); write(value); } catch (Exception e) { Log.e(TAG, "Could not persist driver error", e); }
    }
    synchronized void fallback(String message) {
        try { JSONObject value = read(); value.put("mode", "SYSTEM"); value.put("error", message); write(value); }
        catch (Exception e) { Log.e(TAG, "Could not persist SYSTEM fallback", e); }
        startupMarker().delete(); Log.e(TAG, "SYSTEM_FALLBACK " + message);
    }
    synchronized void recoverInterruptedStartup() {
        android.app.ActivityManager manager = (android.app.ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        java.util.List<android.app.ActivityManager.RunningAppProcessInfo> running = manager.getRunningAppProcesses();
        if (running != null) for (android.app.ActivityManager.RunningAppProcessInfo process : running)
            if ((context.getPackageName() + ":emulator").equals(process.processName)) return;
        if (startupMarker().exists()) fallback("Custom driver startup was interrupted. System Driver selected; you can retry or delete the driver.");
    }
    synchronized void cleanupInterruptedImport(File pending) {
        try {
            File previous = new File(root, "previous");
            if (previous.exists()) {
                JSONObject stored = read().optJSONObject("metadata");
                boolean committed = installed().exists() && stored != null && metadata(installed()).toString().equals(stored.toString());
                if (!committed) {
                    deleteTree(installed());
                    if (!previous.renameTo(installed())) throw new IOException("Cannot recover previous driver");
                } else deleteTree(previous);
            }
            File[] entries = root.listFiles();
            if (entries != null) for (File entry : entries) {
                if ((entry.getName().startsWith("staging-") || entry.getName().startsWith("import-")) &&
                    (pending == null || !entry.getCanonicalFile().equals(pending.getCanonicalFile()))) deleteTree(entry);
            }
            JSONObject value = read();
            if (value.optString("mode").equals("CUSTOM") && !new File(installed(), "meta.json").isFile()) fallback("Installed driver files are missing. System Driver selected.");
        } catch (Exception e) { fallback("Driver import recovery failed: " + e.getMessage()); }
    }
    synchronized void remove() throws Exception {
        JSONObject value = new JSONObject(); value.put("mode", "SYSTEM"); write(value);
        deleteTree(installed()); startupMarker().delete();
        Log.i(TAG, "CUSTOM_DRIVER_DELETED mode=SYSTEM files_removed=" + !installed().exists());
    }
    synchronized void commit(File stage) throws Exception {
        if (!stage.getCanonicalFile().getParentFile().equals(root.getCanonicalFile()) || !stage.getName().startsWith("staging-")) throw new IOException("Invalid staging directory");
        JSONObject metadata = metadata(stage);
        File backup = new File(root, "previous");
        deleteTree(backup);
        boolean hadPrevious = installed().exists();
        if (hadPrevious && !installed().renameTo(backup)) throw new IOException("Cannot replace installed driver");
        try {
            if (!stage.renameTo(installed())) throw new IOException("Cannot install driver");
            JSONObject value = new JSONObject(); value.put("mode", "CUSTOM"); value.put("id", "custom"); value.put("metadata", metadata);
            value.put("displayName", metadata.getString("name")); write(value);
        } catch (Exception e) {
            deleteTree(installed()); if (hadPrevious) backup.renameTo(installed()); throw e;
        }
        deleteTree(backup);
        Log.i(TAG, "CUSTOM_DRIVER_INSTALLED metadata=" + metadata);
    }
    JSONObject metadata(File directory) throws Exception {
        try (InputStream in = new FileInputStream(new File(directory, "meta.json"))) {
            JSONObject meta = new JSONObject(new String(readBounded(in, 16384), StandardCharsets.UTF_8));
            if (meta.getInt("schemaVersion") != 1) throw new IOException("Unsupported driver metadata schema");
            for (String key : new String[]{"name", "libraryName"}) {
                String text = meta.getString(key);
                if (text.trim().isEmpty() || text.length() > 160 || text.matches(".*[\\p{Cntrl}].*")) throw new IOException("Invalid " + key);
            }
            String library = meta.getString("libraryName");
            if (!library.matches("[A-Za-z0-9_-][A-Za-z0-9_.-]*\\.so") || library.contains("..")) throw new IOException("Invalid libraryName");
            int minApi = meta.optInt("minApi", 28);
            if (minApi < 0 || minApi > Build.VERSION.SDK_INT || Build.VERSION.SDK_INT < 28) throw new IOException("Driver requires an unsupported Android version");
            for (String key : new String[]{"description", "author", "vendor", "driverVersion", "packageVersion"}) {
                if (meta.has(key) && (!(meta.get(key) instanceof String) || meta.getString(key).length() > 1024 || meta.getString(key).matches(".*[\\p{Cntrl}].*"))) throw new IOException("Invalid " + key);
            }
            if (!new File(directory, library).isFile()) throw new IOException("Driver library is missing");
            return meta;
        }
    }
    File importZip(Context context, Uri uri) throws Exception {
        File archive = File.createTempFile("import-", ".zip", root);
        File stage = new File(root, "staging-" + UUID.randomUUID());
        try {
            try (InputStream in = context.getContentResolver().openInputStream(uri); OutputStream out = new FileOutputStream(archive)) {
                if (in == null) throw new IOException("Selected ZIP is not readable");
                copyBounded(in, out, ZIP_LIMIT);
            }
            // Check central-directory attributes before extraction (ZipFile does not expose Unix modes).
            byte[] bytes;
            try (InputStream in = new FileInputStream(archive)) { bytes = readBounded(in, ZIP_LIMIT); }
            validateDirectory(bytes);
            if (!stage.mkdir()) throw new IOException("Cannot create private driver directory");
            long total = 0;
            Set<String> names = new HashSet<>();
            try (ZipFile zip = new ZipFile(archive)) {
                Enumeration<? extends ZipEntry> entries = zip.entries();
                while (entries.hasMoreElements()) {
                    ZipEntry entry = entries.nextElement();
                    String name = entry.getName();
                    // Version 1 supports a flat metadata + shared-library package only.
                    if (!name.matches("[A-Za-z0-9_-][A-Za-z0-9_.-]*") || name.contains("..") || entry.isDirectory() || (!name.equals("meta.json") && !name.endsWith(".so"))) throw new IOException("Unsupported package entry: " + name);
                    if (!names.add(name.toLowerCase(Locale.ROOT)) || names.size() > 32) throw new IOException("Duplicate or excessive package entries");
                    long limit = name.equals("meta.json") ? 16384 : 64L * 1024 * 1024;
                    if (entry.getSize() < 0 || entry.getSize() > limit || entry.getCompressedSize() < 0 || entry.getSize() > Math.max(1, entry.getCompressedSize()) * 1000L) throw new IOException("Unreasonable ZIP entry size");
                    File target = new File(stage, name);
                    if (!target.getCanonicalFile().getParentFile().equals(stage.getCanonicalFile())) throw new IOException("Unsafe ZIP path");
                    CRC32 crc = new CRC32();
                    long size;
                    try (InputStream in = new CheckedInputStream(zip.getInputStream(entry), crc); OutputStream out = new FileOutputStream(target)) { size = copyBounded(in, out, Math.min(limit, EXPANDED_LIMIT - total)); }
                    if (size != entry.getSize() || crc.getValue() != entry.getCrc()) throw new IOException("ZIP size/checksum mismatch");
                    total += size;
                    if (name.endsWith(".so")) validateElf(target);
                    target.setReadable(true, true); target.setWritable(false, false);
                }
            }
            metadata(stage);
            Log.i(TAG, "ZIP_VALIDATED entries=" + names + " bytes=" + total + " ABI=arm64-v8a");
            return stage;
        } catch (Exception e) { deleteTree(stage); throw e; }
        finally { archive.delete(); }
    }
    private static void validateDirectory(byte[] data) throws IOException {
        ByteBuffer b = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN);
        int end = -1;
        for (int i = data.length - 22; i >= Math.max(0, data.length - 65557); --i) {
            if (b.getInt(i) == 0x06054b50 && i + 22 + (b.getShort(i + 20) & 65535) == data.length) { end = i; break; }
        }
        if (end < 0 || b.getShort(end + 4) != 0 || b.getShort(end + 6) != 0) throw new IOException("Malformed or multipart ZIP");
        int count = b.getShort(end + 10) & 65535;
        long offset = Integer.toUnsignedLong(b.getInt(end + 16)), size = Integer.toUnsignedLong(b.getInt(end + 12));
        if (count == 0 || count > 32 || count != (b.getShort(end + 8) & 65535) || offset + size != end) throw new IOException("Unsupported ZIP directory");
        int pos = (int) offset;
        for (int i = 0; i < count; ++i) {
            if (pos < 0 || pos + 46 > end || b.getInt(pos) != 0x02014b50) throw new IOException("Malformed ZIP entry");
            int flags = b.getShort(pos + 8) & 65535, method = b.getShort(pos + 10) & 65535;
            int mode = (int) (Integer.toUnsignedLong(b.getInt(pos + 38)) >> 16) & 0170000;
            if ((flags & 1) != 0 || (method != 0 && method != 8) || (mode != 0 && mode != 0100000)) throw new IOException("Encrypted, symlink or special ZIP entry rejected");
            int local = b.getInt(pos + 42);
            int nameSize = b.getShort(pos + 28) & 65535;
            if (local < 0 || local + 30 > offset || b.getInt(local) != 0x04034b50 || (b.getShort(local + 26) & 65535) != nameSize || b.getShort(local + 8) != b.getShort(pos + 10)) throw new IOException("Invalid ZIP local header");
            if (local + 30 + nameSize > offset || pos + 46 + nameSize > end) throw new IOException("Invalid ZIP filename");
            for (int j = 0; j < nameSize; j++) if (data[local + 30 + j] != data[pos + 46 + j]) throw new IOException("Conflicting ZIP filenames");
            pos += 46 + nameSize + (b.getShort(pos + 30) & 65535) + (b.getShort(pos + 32) & 65535);
        }
        if (pos != end) throw new IOException("Invalid ZIP directory size");
    }
    private static void validateElf(File library) throws IOException {
        byte[] header = new byte[64];
        try (DataInputStream in = new DataInputStream(new FileInputStream(library))) { in.readFully(header); }
        ByteBuffer b = ByteBuffer.wrap(header).order(ByteOrder.LITTLE_ENDIAN);
        if (b.getInt(0) != 0x464c457f || header[4] != 2 || header[5] != 1 || header[6] != 1 || b.getShort(16) != 3 || b.getShort(18) != 183 || b.getInt(20) != 1 || b.getShort(52) != 64) throw new IOException("Driver must be an ELF64 arm64-v8a shared library");
    }
    static void deleteTree(File file) throws IOException {
        if (!file.exists()) return;
        if (java.nio.file.Files.isSymbolicLink(file.toPath())) throw new IOException("Unexpected private-storage symlink");
        File[] children = file.listFiles();
        if (children != null) for (File child : children) deleteTree(child);
        if (!file.delete()) throw new IOException("Cannot remove " + file.getName());
    }
    static byte[] readBounded(InputStream in, long limit) throws IOException { ByteArrayOutputStream out = new ByteArrayOutputStream(); copyBounded(in, out, limit); return out.toByteArray(); }
    private static long copyBounded(InputStream in, OutputStream out, long limit) throws IOException {
        byte[] buffer = new byte[32768]; long total = 0; int n;
        while ((n = in.read(buffer)) != -1) { total += n; if (total > limit) throw new IOException("Driver package exceeds size limit"); out.write(buffer, 0, n); }
        return total;
    }
}
