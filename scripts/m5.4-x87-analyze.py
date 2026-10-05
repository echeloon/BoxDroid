#!/usr/bin/env python3
"""Summarize bounded opt-in x87 diagnostics; profiled rates are not benchmark FPS."""
import json
import pathlib
import re
import sys

root = pathlib.Path(sys.argv[1])
text = (root / 'logcat.txt').read_text()
def rows(event):
    return [dict(re.findall(r'(\w+)=([^ ]+)', line.split(': '+event+' ', 1)[1]))
            for line in text.splitlines() if ': '+event+' ' in line]
window = rows('X87_WINDOW')
if not window:
    raise SystemExit('No completed five-second x87 window')
seconds = int(window[0]['elapsed_us']) / 1e6
floor = float(window[0]['timer_floor_ns']) if 'timer_floor_ns' in window[0] else None
cpu_ns = int(window[0]['cpu_ns']) if 'cpu_ns' in window[0] else None
arithmetic = ['FADD', 'FMUL', 'FCOM', 'FCOMP', 'FSUB', 'FSUBR', 'FDIV', 'FDIVR']
def mnemonic(code):
    b, m = 0xd8 + (code >> 8), code & 255
    group, reg = (m >> 3) & 7, m >= 0xc0
    if b in (0xd8, 0xdc):
        return arithmetic[group] + (' reg' if reg else (' m32' if b == 0xd8 else ' m64'))
    if b == 0xde:
        return (arithmetic[group] + 'P reg') if reg else ('FI'+arithmetic[group][1:]+' m16')
    if b == 0xda and not reg:
        return 'FI'+arithmetic[group][1:]+' m32'
    if not reg:
        memory = {
            0xd9: {0:'FLD m32',2:'FST m32',3:'FSTP m32',5:'FLDCW',7:'FNSTCW'},
            0xdd: {0:'FLD m64',1:'FISTTP m64',2:'FST m64',3:'FSTP m64'},
            0xdb: {0:'FILD m32',1:'FISTTP m32',2:'FIST m32',3:'FISTP m32',5:'FLD m80',7:'FSTP m80'},
            0xdf: {0:'FILD m16',1:'FISTTP m16',2:'FIST m16',3:'FISTP m16',5:'FILD m64',7:'FISTP m64'}}
        return memory.get(b, {}).get(group, f'{b:02x}/{group} mem')
    if b == 0xd9:
        if group == 0:return 'FLD ST(i)'
        if group == 1:return 'FXCH'
        return {0xe0:'FCHS',0xe1:'FABS',0xe8:'FLD1',0xee:'FLDZ',0xfa:'FSQRT',0xfe:'FSIN',0xff:'FCOS'}.get(m,f'd9 {m:02x}')
    if b == 0xdd:return {0:'FFREE',2:'FST reg',3:'FSTP reg',4:'FUCOM',5:'FUCOMP'}.get(group,f'dd {m:02x}')
    if b == 0xdf and m == 0xe0:return 'FNSTSW AX'
    if b == 0xdb and group in (5,6):return 'FUCOMI' if group == 5 else 'FCOMI'
    return f'{b:02x} {m:02x}'
ops = []
for row in rows('X87_OPCODE'):
    count = int(row['count']); code = int(row['code'],16)
    ops.append(dict(code=f'{0xd8+(code>>8):02x} {code&255:02x}',
                    opcode=mnemonic(code),count=count,per_second=count/seconds))
ops.sort(key=lambda x:x['count'],reverse=True)
helpers = []
for row in rows('X87_HELPER'):
    calls,samples,ns = (int(row[k]) for k in ('calls','samples','ns'))
    average = ns/samples if samples else None
    helpers.append(dict(name=row['name'],calls=calls,per_second=calls/seconds,
                        samples=samples,mean_inclusive_ns=average,
                        mean_timer_corrected_ns=max(0,average-floor) if average is not None and floor is not None else None,
                        estimated_vcpu_fraction=(calls*max(0,average-floor)/cpu_ns) if average is not None and floor is not None and cpu_ns else None))
helpers.sort(key=lambda x:x['calls'],reverse=True)
result = dict(seconds=seconds,opcodes=ops,helpers=helpers,pairs=rows('X87_PAIR'),
              classes=rows('X87_CLASS'),operands=rows('X87_OPERAND'),control_words=rows('X87_CW'),pcs=rows('X87_PC'),
              timer_floor_ns=floor,vcpu_window_cpu_ns=cpu_ns,
              caveat='Opt-in instrumentation and sampled wall time; inclusive sampled timings; timer-floor correction is an estimate, not exact CPU self time. Independent simpleperf attribution is reported separately. Rates belong to the instrumented run.')
(root/'x87-summary.json').write_text(json.dumps(result,indent=2)+'\n')
print('Opcode total:',sum(x['count'] for x in ops),'Window:',seconds)
for row in ops[:20]:print(row)
print('Helper estimates:')
for row in helpers[:15]:print(row)
print('Control words:',result['control_words'],'Classes:',result['classes'])
