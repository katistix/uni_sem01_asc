; Sa se afiseze, pentru fiecare numar de la 32 la 126, valoarea numarului (in baza 8) si caracterul cu acel cod ASCII.

bits 32

global start

import exit msvcrt.dll
extern exit

extern print_8
extern print_ascii

segment data use32

segment code use32 public code
start:

    mov ecx, 32
    parcurge:
        push ecx

        ; print the current number in base 8
        push ecx
        call print_8
        add esp, 4


        pop ecx


        push ecx
        ; print the current number in ASCII
        push ecx
        call print_ascii
        add esp, 4


        pop ecx

        inc ecx
        cmp ecx, 126+1
        jne parcurge

    end_parcurge:

    

    push 0
    call [exit]
