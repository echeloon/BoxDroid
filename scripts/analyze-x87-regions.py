#!/usr/bin/env python3
"""Estimate x87 region opportunity from existing TCG/guest-byte snapshots.

This performs offline LLVM decoding only. CPU-clock sample weights are not
executed guest instruction counts. JIT address reuse, sampling skid, helpers
outside the JIT and unavailable guest bytes limit every coverage estimate.
"""

import argparse
import bisect
import collections
import gzip
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess


def read(path):
    return gzip.open(path, 'rb').read() if path.suffix == '.gz' else path.read_bytes()


def host_records(blob):
    records, offset = {}, 0
    while offset + 64 <= len(blob):
        magic, host, pc, size, count, words, flags, cflags = struct.unpack_from('<8Q', blob, offset)
        assert magic == 0x424454434744554d, offset
        end = offset + 64 + count * words * 8 + count * 2 + size
        if end > len(blob):
            break
        pcs = [struct.unpack_from('<Q', blob, offset + 64 + i * words * 8)[0]
               for i in range(count)]
        if cflags & 0x20000:
            pcs = [p + (pc & ~4095) for p in pcs]
        ends = struct.unpack_from('<' + 'H' * count, blob, offset + 64 + count * words * 8)
        records[host] = dict(pc=pc, size=size, count=count, flags=flags,
                             cflags=cflags, pcs=pcs, ends=ends)
        offset = end
    return records


def guest_records(blob):
    records, offset = {}, 0
    while offset + 64 <= len(blob):
        magic, host, pc, size, count, flags, cflags, reserved = struct.unpack_from('<8Q', blob, offset)
        assert magic == 0x4244475545535442 and reserved == 0, offset
        end = offset + 64 + size
        if end > len(blob):
            break
        records[host] = dict(pc=pc, count=count, flags=flags, cflags=cflags,
                             code=blob[offset + 64:end])
        offset = end
    return records


BASE = {'fld', 'fmul', 'fmulp', 'fadd', 'faddp', 'fsub', 'fsubp', 'fsubr', 'fsubrp'}
EXTENDED = BASE | {'fsqrt', 'fdiv', 'fdivp', 'fdivr', 'fdivrp', 'fchs', 'fabs', 'fxch'}


def eligible(insn, extended=False):
    mnemonic, operands = insn['mnemonic'], insn['operands']
    allowed = EXTENDED if extended else BASE
    if mnemonic not in allowed:
        return False
    if mnemonic in {'fsqrt', 'fchs', 'fabs'}:
        return not operands
    # LLVM AT&T register forms use only %st / %st(i), comma and spaces.
    # This rejects every memory operand and prefixed/unknown decoding.
    return bool(operands) and not re.sub(r'%st(?:\([0-7]\))?|[,\s]', '', operands)


def integer_passthrough(insn):
    """Optional opportunity estimate; these instructions still need execution."""
    mnemonic, operands = insn['mnemonic'], insn['operands']
    if mnemonic in {'nop', 'nopl', 'nopw'}:
        return True
    if re.fullmatch(r'lea[bwlq]?', mnemonic):
        return True  # Address calculation does not dereference its operand.
    if not re.fullmatch(r'(mov|add|sub|and|or|xor|not|neg|inc|dec|shl|shr|sar|sal|rol|ror|cmp|test|imul)[bwlq]?', mnemonic):
        return False
    if '(' in operands or ')' in operands or ':' in operands:
        return False
    return not re.search(r'%(?:st|[xyz]mm|mm|[cdefgs]s|cr|dr)', operands)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('host_dump', type=Path)
    p.add_argument('guest_dump', type=Path)
    p.add_argument('raw_report', type=Path)
    p.add_argument('output', type=Path)
    p.add_argument('--llvm', type=Path, default=Path('/Users/maverick/Library/Android/sdk/ndk/30.0.16248370/toolchains/llvm/prebuilt/darwin-x86_64/bin'))
    a = p.parse_args()
    a.output.mkdir(parents=True, exist_ok=False)
    blocks, guest = host_records(read(a.host_dump)), guest_records(read(a.guest_dump))
    starts = sorted(blocks)
    block_weight, address_weight = collections.Counter(), collections.Counter()
    total = unmapped = 0
    for line in a.raw_report.read_text().splitlines():
        m = re.match(r'(\d+)\s+\d+\s+\d+\s+ALL CPUs/TCG\s+(.*)', line)
        if not m:
            continue
        weight = int(m[1])
        total += weight
        address = re.search(r'unknown\[\+([0-9a-f]+)\]', m[2])
        if not address:
            continue
        address = int(address[1], 16)
        i = bisect.bisect_right(starts, address) - 1
        if i < 0 or address >= starts[i] + blocks[starts[i]]['size']:
            unmapped += weight
            continue
        block_weight[starts[i]] += weight
        address_weight[address] += weight
    available = {}
    for host in block_weight:
        source = guest.get(host)
        if source and all(source[k] == blocks[host][k] for k in ('pc', 'count', 'flags', 'cflags')):
            available[host] = source
    # One LLVM object/disassembly, with a distinct executable section per TB.
    # Instruction boundaries come from LLVM and must exactly match TCG metadata.
    assembly = []
    for host, source in sorted(available.items()):
        assembly += [f'.section .text.bb_{host:x},"ax",@progbits',
                     '.code32' if source['flags'] & (1 << 4) else '.code16',
                     f'.global bb_{host:x}', f'bb_{host:x}:',
                     '.byte ' + ','.join(str(x) for x in source['code'])]
    (a.output / 'sampled-guest-blocks.s').write_text('\n'.join(assembly) + '\n')
    subprocess.run([str(a.llvm / 'clang'), '-target', 'i386-linux-gnu', '-c',
                    str(a.output / 'sampled-guest-blocks.s'), '-o',
                    str(a.output / 'sampled-guest-blocks.o')], check=True)
    decoded_text = subprocess.check_output([str(a.llvm / 'llvm-objdump'), '-d',
                        '--no-show-raw-insn', str(a.output / 'sampled-guest-blocks.o')], text=True)
    (a.output / 'sampled-guest-blocks.asm').write_text(decoded_text)
    decoded, current = collections.defaultdict(list), None
    for line in decoded_text.splitlines():
        section = re.match(r'Disassembly of section \.text\.bb_([0-9a-f]+):', line)
        if section:
            current = int(section[1], 16)
            continue
        instruction = re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)', line)
        if instruction and current is not None:
            decoded[current].append(dict(offset=int(instruction[1], 16),
                mnemonic=instruction[2], operands=instruction[3].split('#')[0].strip()))
    valid, mismatches = {}, []
    for host, source in available.items():
        offsets = [pc - source['pc'] for pc in blocks[host]['pcs']]
        actual = [i['offset'] for i in decoded[host]]
        # 16-bit decoding is intentionally excluded here: one object uses a
        # 32-bit disassembler mode. None may silently inflate coverage.
        if not source['flags'] & (1 << 4) or offsets != actual:
            mismatches.append(dict(host=hex(host), pc=hex(source['pc']),
                expected=offsets, decoded=actual, mode32=bool(source['flags'] & (1 << 4))))
            continue
        valid[host] = decoded[host]
    results = {}
    all_regions = {}
    for label, extended, integer in [('base', False, False), ('extended', True, False),
                                    ('extended_integer_interleaved', True, True)]:
        regions, selected_by_host = [], collections.defaultdict(set)
        eligible_static = region_static = 0
        for host, instructions in valid.items():
            run = []
            for i in range(len(instructions) + 1):
                fp = i < len(instructions) and eligible(instructions[i], extended)
                passthrough = i < len(instructions) and integer and integer_passthrough(instructions[i])
                if fp or passthrough:
                    eligible_static += int(fp)
                    run.append(i)
                    continue
                selected = [n for n in run if eligible(instructions[n], extended)]
                if len(selected) >= 3:
                    run = list(range(selected[0], selected[-1] + 1))
                    selected_by_host[host].update(selected)
                    region_static += len(selected)
                    regions.append(dict(host=hex(host), tb_pc=hex(blocks[host]['pc']),
                        start_pc=hex(blocks[host]['pcs'][run[0]]), length=len(selected),
                        total_instruction_count=len(run),
                        instructions=[instructions[n] for n in run],
                        tb_sample_weight=block_weight[host], indices=selected))
                run = []
        direct_weight = cold_weight = 0
        per_region_weight = collections.Counter()
        for address, weight in address_weight.items():
            j = bisect.bisect_right(starts, address) - 1
            host = starts[j]
            if host not in valid:
                continue
            index = bisect.bisect_right(blocks[host]['ends'], address - host)
            if index >= blocks[host]['count']:
                cold_weight += weight
            elif index in selected_by_host.get(host, ()):
                direct_weight += weight
                per_region_weight[(host, index)] += weight
        for region in regions:
            host = int(region['host'], 16)
            region['direct_jit_sample_weight'] = sum(per_region_weight[host, i] for i in region['indices'])
        affected_weight = sum(block_weight[h] for h in selected_by_host)
        results[label] = dict(regions=len(regions), affected_tbs=len(selected_by_host),
            eligible_instructions_in_sampled_tbs=eligible_static,
            instructions_in_length3plus_regions=region_static,
            affected_tb_sample_weight=affected_weight,
            affected_tb_sample_fraction_of_tcg=affected_weight / total,
            direct_region_jit_sample_weight=direct_weight,
            direct_region_jit_sample_fraction_of_tcg=direct_weight / total,
            direct_region_fraction_of_mapped_jit=direct_weight / sum(block_weight.values()),
            length_histogram=dict(sorted(collections.Counter(r['length'] for r in regions).items())),
            top_regions=sorted(regions, key=lambda r: r['direct_jit_sample_weight'], reverse=True)[:30])
        all_regions[label] = regions
    summary = dict(inputs={str(p): hashlib.sha256(p.read_bytes()).hexdigest()
                           for p in (a.host_dump, a.guest_dump, a.raw_report)},
        total_tcg_sample_weight=total, mapped_jit_sample_weight=sum(block_weight.values()),
        unmapped_jit_sample_weight=unmapped, sampled_tbs=len(block_weight),
        byte_matched_sampled_tbs=len(available), validated_decoded_tbs=len(valid),
        decoded_instruction_count=sum(len(v) for v in valid.values()),
        byte_matched_tb_sample_weight=sum(block_weight[h] for h in available),
        validated_tb_sample_weight=sum(block_weight[h] for h in valid),
        metadata_decode_mismatch_count=len(mismatches),
        results=results,
        limitations=[
            'CPU-clock self samples are time attribution, not execution counts or retired instructions.',
            'Whole-TB weight includes unrelated instructions and is not removable cost.',
            'Direct region weight excludes C helper execution; it includes guest-instruction bookkeeping and sampling skid.',
            'Entry checks and cold generated memory paths can be attributed imprecisely by guest instruction metadata.',
            'The last captured translation at a reused host address may differ from the translation sampled earlier.',
            'Static region count is over sampled TB instances, not dynamic execution frequency or unique guest regions.',
            'Numeric/control-state eligibility cannot be established from guest bytes.',
            'Only 32-bit TBs with exact LLVM/TCG instruction-boundary agreement are included.'])
    for name, data in [('summary.json', summary), ('regions.json', all_regions),
                       ('metadata-mismatches.json', mismatches)]:
        (a.output / name).write_text(json.dumps(data, indent=2) + '\n')
    print(json.dumps({k: v for k, v in summary.items() if k != 'results'}, indent=2))
    for label, result in results.items():
        print(label, json.dumps({k: v for k, v in result.items() if k != 'top_regions'}, indent=2))


if __name__ == '__main__':
    main()
