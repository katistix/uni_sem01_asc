bits 32

global start

import printf msvcrt.dll
import exit msvcrt.dll
extern printf, exit

extern factorial

segment data use32
    fmt_out db "factorial=%d",0

segment code use32 public code
start:
    push dword 10
    call factorial

    ; factorial pune in eax rezultatul

    ; printam rezultatul
    push eax
    push fmt_out
    call [printf]
    add esp, 4*2

    push 0
    call [exit]