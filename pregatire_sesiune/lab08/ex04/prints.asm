bits 32
global print_16
global print_2

import printf msvcrt.dll
extern printf

segment data use32
    fmt_print_16 db "0x%x", 10, 0
    fmt_print_2 db "0b%b", 10, 0


segment code use32 public code
print_16:
    push ebp
    mov ebp, esp

    ; argument: [ebp+4 +4]
    push dword [ebp+4 +4] ; ebp+4 e locatia, +4 e dword
    push fmt_print_16
    call [printf]
    add esp, 4*2 ; printf a luat 2 parametrii dword


    pop ebp
    ret