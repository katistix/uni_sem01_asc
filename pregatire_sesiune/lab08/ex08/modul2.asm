bits 32

global print_ascii

import printf msvcrt.dll
extern printf

segment data use32
    fmt_print_char db "%c", 10, 0

segment code use32 public code
print_ascii:
    push ebp
    mov ebp, esp

    push dword [ebp+4 + 4]
    push fmt_print_char
    call [printf]
    add esp, 4*2

    pop ebp
    ret
