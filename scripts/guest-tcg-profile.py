#!/usr/bin/env python3
"""Join diagnostic TCG samples to captured guest bytes; no guest execution.

Requires matching tcg_dump1 host/guest snapshots and simpleperf capture from
one emulator process. Sampling skid and host-address reuse limit attribution;
these are sampled costs, not exact guest instruction counts or cycle bounds.
"""

import argparse
import bisect
import collections
import json
from pathlib import Path
import re
import struct
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('capture', type=Path)
    parser.add_argument('host_dump', type=Path)
    parser.add_argument('guest_dump', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('--ndk', type=Path, default=Path(
        '/Users/maverick/Library/Android/sdk/ndk/30.0.16248370'))
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=False)
    simpleperf = args.ndk / 'simpleperf/bin/darwin/x86_64/simpleperf'
    llvm = args.ndk / 'toolchains/llvm/prebuilt/darwin-x86_64/bin'
    raw = subprocess.check_output([
        str(simpleperf), 'report', '-i', str(args.capture / 'perf.data'),
        '--raw-period', '-n', '--sort', 'tid,comm,symbol'], text=True)
    (args.output / 'native-raw.txt').write_text(raw)
    blocks, guest = {}, {}
    blob = args.host_dump.read_bytes()
    offset = 0
    while offset + 64 <= len(blob):
        magic, host, pc, size, count, words, flags, cflags = struct.unpack_from(
            '<8Q', blob, offset)
        assert magic == 0x424454434744554d, offset
        end = offset + 64 + count * words * 8 + count * 2 + size
        if end > len(blob):
            break  # Last record may be incomplete in a live snapshot.
        last_pc = struct.unpack_from('<Q', blob,
                                     offset + 64 + (count - 1) * words * 8)[0]
        if cflags & 0x20000:
            last_pc += pc & ~4095
        blocks[host] = dict(pc=pc, size=size, count=count, flags=flags,
                            cflags=cflags, last_pc=last_pc)
        offset = end
    blob = args.guest_dump.read_bytes()
    offset = 0
    while offset + 64 <= len(blob):
        magic, host, pc, size, count, flags, cflags, reserved = struct.unpack_from(
            '<8Q', blob, offset)
        assert magic == 0x4244475545535442 and reserved == 0, offset
        end = offset + 64 + size
        if end > len(blob):
            break
        guest[host] = dict(pc=pc, count=count, flags=flags, cflags=cflags,
                           code=blob[offset + 64:end])
        offset = end
    starts = sorted(blocks)
    hits = collections.Counter()
    total = unmapped = 0
    for line in raw.splitlines():
        match = re.match(r'(\d+)\s+(\d+)\s+\d+\s+ALL CPUs/TCG\s+(.*)', line)
        if not match:
            continue
        weight = int(match[1])
        total += weight
        address_match = re.search(r'unknown\[\+([0-9a-f]+)\]', match[3])
        if not address_match:
            continue
        address = int(address_match[1], 16)
        index = bisect.bisect_right(starts, address) - 1
        if index < 0 or address >= starts[index] + blocks[starts[index]]['size']:
            unmapped += weight
            continue
        hits[starts[index]] += weight
    result = dict(tcg_weight=total, mapped_jit_weight=sum(hits.values()),
                  unmapped_jit_weight=unmapped, host_blocks=len(blocks),
                  guest_blocks=len(guest), top=[])
    forward_jumps = []
    for host, weight in hits.items():
        block = blocks[host]
        source = guest.get(host)
        if not source or source['pc'] != block['pc']:
            continue
        offset = block['last_pc'] - source['pc']
        code = source['code'][offset:] if 0 <= offset < len(source['code']) else b''
        displacement = None
        if len(code) == 2 and code[0] == 0xeb:
            displacement = struct.unpack('<b', code[1:])[0]
        elif len(code) == 5 and code[0] == 0xe9:
            displacement = struct.unpack('<i', code[1:])[0]
        if displacement is not None and 0 < displacement <= 64:
            forward_jumps.append(dict(
                host=hex(host), pc=hex(source['pc']),
                branch_pc=hex(block['last_pc']), displacement=displacement,
                target=hex(block['last_pc'] + len(code) + displacement),
                tcg_fraction=weight / total))
    result['bounded_forward_jump_blocks_tcg_fraction'] = sum(
        item['tcg_fraction'] for item in forward_jumps)
    result['bounded_forward_jump_blocks'] = sorted(
        forward_jumps, key=lambda item: item['tcg_fraction'], reverse=True)
    for host, weight in hits.most_common(60):
        block = blocks[host]
        source = guest.get(host)
        entry = dict(host=hex(host), guest_pc=hex(block['pc']),
                     guest_count=block['count'], host_bytes=block['size'],
                     tcg_fraction=weight / total, guest_bytes_available=False)
        result['top'].append(entry)
        if not source or any(source[key] != block[key]
                             for key in ('pc', 'count', 'flags', 'cflags')):
            continue
        entry['guest_bytes_available'] = True
        entry['guest_bytes'] = len(source['code'])
        name = args.output / f"guest-{block['pc']:x}-{host:x}"
        bits = 32 if block['flags'] & (1 << 4) else 16
        assembly = f'.text\n.code{bits}\n.global trace\ntrace:\n.byte '
        assembly += ','.join(str(byte) for byte in source['code']) + '\n'
        name.with_suffix('.s').write_text(assembly)
        subprocess.run([str(llvm / 'clang'), '-target', 'i386-linux-gnu', '-c',
                        str(name.with_suffix('.s')), '-o',
                        str(name.with_suffix('.o'))], check=True)
        disassembly = subprocess.check_output([
            str(llvm / 'llvm-objdump'), '-d', '--no-show-raw-insn',
            '--adjust-vma=' + str(block['pc']),
            *(['--mattr=+16bit-mode'] if bits == 16 else []),
            str(name.with_suffix('.o'))], text=True)
        name.with_suffix('.asm').write_text(disassembly)
    (args.output / 'guest-summary.json').write_text(
        json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
