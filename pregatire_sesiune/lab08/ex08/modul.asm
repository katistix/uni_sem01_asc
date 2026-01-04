bits 32

global print_8

import printf msvcrt.dll
extern printf

segment data use32
    fmt_print_8 db "%o", 10, 0

segment code use32 public code
print_8:
    push ebp
    mov ebp, esp

    push dword [ebp+4 + 4]
    push fmt_print_8
    call [printf]
    add esp, 4*2

    pop ebp
    ret