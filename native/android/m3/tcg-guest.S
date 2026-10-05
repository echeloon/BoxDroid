/* Tiny freestanding AArch64 guest. It computes 19 + 23, branches on the
 * computed value, and emits a distinct UART marker through virt's PL011. */
.section .text
.global _start
.type _start, %function
_start:
    mov     x3, #19
    mov     x4, #23
    add     x5, x3, x4
    cmp     x5, #42
    b.ne    guest_fail
    adr     x0, pass_message
    b       guest_print

guest_fail:
    adr     x0, fail_message

guest_print:
    ldr     x2, =0x09000000
guest_next:
    ldrb    w1, [x0], #1
    cbz     w1, guest_done
    str     w1, [x2]
    b       guest_next

guest_done:
    wfe
    b       guest_done

.align 3
pass_message:
    .asciz "BOXDROID_TCG_PASS=42\n"
fail_message:
    .asciz "BOXDROID_TCG_FAIL\n"

.section .note.GNU-stack,"",%progbits
