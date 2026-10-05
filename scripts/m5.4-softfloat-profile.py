#!/usr/bin/env python3
"""Resolve Android simpleperf offsets against the exact unstripped ELF.

Usage: m5.4-softfloat-profile.py RESULTS UNSTRIPPED_SO LLVM_NM
Sampling attribution is CPU self time, not exact call or wall-time accounting.
"""
import bisect
import collections
import json
import pathlib
import re
import subprocess
import sys

root,elf,nm=pathlib.Path(sys.argv[1]),sys.argv[2],sys.argv[3]
summary=json.loads((root/'performance-summary.json').read_text())
tid=summary['thread_roles']['vCPU']
symbols=[]
for line in subprocess.check_output([nm,'-n','--defined-only',elf],text=True).splitlines():
    match=re.match(r'([0-9a-f]+) [tTW] (.*)',line)
    if match:symbols.append((int(match[1],16),match[2]))
symbols.sort();addresses=[x[0] for x in symbols]
counts=collections.Counter();categories=collections.Counter();total=0
for line in (root/'perf-report.txt').read_text().splitlines():
    match=re.match(r'\s*([\d.]+)%\s+(\d+)\s+(.*)',line)
    if not match or int(match[2])!=tid:continue
    percent=float(match[1]);name=match[3];total+=percent
    offset=re.search(r'libboxdroid.so\[\+([0-9a-f]+)\]',name)
    if offset:
        index=bisect.bisect_right(addresses,int(offset[1],16))-1
        if index>=0:name=symbols[index][1]
    counts[name]+=percent
    if name.startswith(('float','parts','frac','roundAndPack','normalizeRound','propagateFloat','softfloat')):category='SoftFloat'
    elif name.startswith('helper_f') and not name.startswith(('helper_fxsave','helper_fxrstor')):category='x87 helper'
    elif name.startswith('unknown'):category='unresolved/translated code'
    else:category='other'
    categories[category]+=percent
result=dict(vcpu_tid=tid,vcpu_process_sample_percent=total,
            vcpu_self_sample_percent={k:v/total*100 for k,v in categories.items()},
            top=[dict(name=k,vcpu_self_percent=v/total*100) for k,v in counts.most_common(25)],
            caveat='Rounded simpleperf CPU self samples. Offsets require the matching unstripped ELF; not exact calls/sec or wall time. Anonymous translated code remains unresolved.')
(root/'softfloat-profile.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
