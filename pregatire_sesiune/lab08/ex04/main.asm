bits 32
global start

import exit msvcrt.dll
extern exit

extern print_16

segment data use32
    sir dd 32, 12, 2, 5
    len equ ($ - sir) / 4

segment code use32 public code
start:

    ; loop through the numbers
    mov esi, sir
    mov ecx, len
    parcurge:
        lodsd
        push ecx ; preserve ecx even after the print calls

        push eax
        call print_16
        add esp, 4

        pop ecx ; restore ecx after the print calls
    loop parcurge

    push 0
    call [exit]