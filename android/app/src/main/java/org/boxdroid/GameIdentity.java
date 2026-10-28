package org.boxdroid;

import android.content.Context;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.util.Log;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Identifies a game disc the way the console does: by the title ID and version
 * in default.xbe's certificate. The key ("4D530004.1") stays the same when the
 * image is moved or renamed; images that can't be read fall back to a key
 * derived from their URI.
 */
final class GameIdentity {
    private static final String TAG = "BoxDroid_Game";
    private static final int SECTOR = 2048;
    private static final byte[] MEDIA_MAGIC = "MICROSOFT*XBOX*MEDIA".getBytes(StandardCharsets.US_ASCII);
    // Game partition offsets: plain XISO, then full XGD1, XGD2 and XGD3 disc images.
    private static final long[] PARTITION_OFFSETS = {0L, 0x18300000L, 0xFD90000L, 0x2080000L};
    private static final int XBE_MAGIC = 0x48454258; // "XBEH"
    private static final int MAX_DIRECTORY = 1 << 20;
    private static final int MAX_HEADERS = 1 << 16;

    final String key;
    /** The certificate's title name; empty when the disc couldn't be read. */
    final String title;
    final boolean fromDisc;

    private GameIdentity(String key, String title, boolean fromDisc) {
        this.key = key;
        this.title = title;
        this.fromDisc = fromDisc;
    }

    static GameIdentity of(Context context, Uri uri) {
        try (ParcelFileDescriptor fd = context.getContentResolver().openFileDescriptor(uri, "r");
             FileInputStream stream = new FileInputStream(fd.getFileDescriptor())) {
            GameIdentity identity = readIdentity(stream.getChannel());
            if (identity != null) {
                Log.i(TAG, "GAME_IDENTITY key=" + identity.key + " title=\"" + identity.title + "\" source=xbe");
                return identity;
            }
        } catch (IOException | RuntimeException error) {
            Log.w(TAG, "GAME_IDENTITY_READ_FAILED", error);
        }
        String key = String.format(Locale.US, "uri-%08X", uri.toString().hashCode());
        Log.i(TAG, "GAME_IDENTITY key=" + key + " source=uri");
        return new GameIdentity(key, "", false);
    }

    private static GameIdentity readIdentity(FileChannel channel) throws IOException {
        for (long partition : PARTITION_OFFSETS) {
            ByteBuffer volume = read(channel, partition + 32L * SECTOR, SECTOR);
            if (volume == null || !startsWith(volume, MEDIA_MAGIC)) continue;
            long rootSector = volume.getInt(20) & 0xFFFFFFFFL;
            long rootSize = volume.getInt(24) & 0xFFFFFFFFL;
            if (rootSize == 0 || rootSize > MAX_DIRECTORY) return null;
            ByteBuffer root = read(channel, partition + rootSector * SECTOR, (int) rootSize);
            if (root == null) return null;
            long[] xbe = findEntry(root, "default.xbe");
            if (xbe == null) return null;
            return readCertificate(channel, partition + xbe[0] * SECTOR, xbe[1]);
        }
        return null;
    }

    /** Walks the directory's binary tree; returns {start sector, size} of the named file. */
    private static long[] findEntry(ByteBuffer directory, String name) {
        Set<Integer> visited = new HashSet<>();
        ArrayDeque<Integer> pending = new ArrayDeque<>();
        pending.push(0);
        while (!pending.isEmpty()) {
            int offset = pending.pop();
            if (offset < 0 || offset + 14 > directory.limit() || !visited.add(offset)) continue;
            int left = directory.getShort(offset) & 0xFFFF;
            int right = directory.getShort(offset + 2) & 0xFFFF;
            if (left == 0xFFFF) continue; // sector padding
            int length = directory.get(offset + 13) & 0xFF;
            if (offset + 14 + length > directory.limit()) continue;
            byte[] entryName = new byte[length];
            for (int i = 0; i < length; i++) entryName[i] = directory.get(offset + 14 + i);
            if (new String(entryName, StandardCharsets.US_ASCII).equalsIgnoreCase(name)) {
                return new long[] {directory.getInt(offset + 4) & 0xFFFFFFFFL,
                        directory.getInt(offset + 8) & 0xFFFFFFFFL};
            }
            if (left != 0) pending.push(left * 4);
            if (right != 0) pending.push(right * 4);
        }
        return null;
    }

    private static GameIdentity readCertificate(FileChannel channel, long position, long size) throws IOException {
        ByteBuffer header = read(channel, position, 0x178);
        if (header == null || header.getInt(0) != XBE_MAGIC) return null;
        long base = header.getInt(0x104) & 0xFFFFFFFFL;
        long headersSize = header.getInt(0x108) & 0xFFFFFFFFL;
        long certificate = (header.getInt(0x118) & 0xFFFFFFFFL) - base;
        if (headersSize > MAX_HEADERS || headersSize > size
                || certificate < 0 || certificate + 0xB0 > headersSize) {
            return null;
        }
        ByteBuffer cert = read(channel, position + certificate, 0xB0);
        if (cert == null) return null;
        long titleId = cert.getInt(0x08) & 0xFFFFFFFFL;
        long version = cert.getInt(0xAC) & 0xFFFFFFFFL;
        // The title name is 40 UTF-16LE characters, NUL-padded.
        byte[] name = new byte[80];
        for (int i = 0; i < name.length; i++) name[i] = cert.get(0x0C + i);
        String title = new String(name, StandardCharsets.UTF_16LE);
        int end = title.indexOf('\0');
        if (end >= 0) title = title.substring(0, end);
        return new GameIdentity(String.format(Locale.US, "%08X.%d", titleId, version), title.trim(), true);
    }

    private static ByteBuffer read(FileChannel channel, long position, int length) throws IOException {
        ByteBuffer buffer = ByteBuffer.allocate(length).order(ByteOrder.LITTLE_ENDIAN);
        while (buffer.hasRemaining()) {
            if (channel.read(buffer, position + buffer.position()) < 0) return null;
        }
        buffer.flip();
        return buffer;
    }

    private static boolean startsWith(ByteBuffer buffer, byte[] prefix) {
        if (buffer.limit() < prefix.length) return false;
        for (int i = 0; i < prefix.length; i++) if (buffer.get(i) != prefix[i]) return false;
        return true;
    }
}
