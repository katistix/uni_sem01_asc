bits 32

global _asmModul2

segment code use32 public code
; int _asmModul2(int numar); ; returneaza numarul de cifre impare
_asmModul2:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8] ; Load the argument 'numar' into eax


    ; salvam registrii pe care ii vom folosi
    push ebx
    push edx

    xor ecx, ecx

    .loop_start:
        ; daca ajungem la finalul numarului
        cmp eax, 0
        je .loop_end

        ; extragem ultima cifra
        mov edx, 0
        mov ebx, 10
        div ebx          ; eax = eax / 10, edx = eax % 10

        ; verificam daca cifra este impara
        test edx, 1

        jz .este_para
        inc ecx          ; creste numarul de cifre impare

        .este_para:
    jmp .loop_start
    .loop_end:

    ; returnam numarul de cifre impare in eax
    mov eax, ecx
    
    ; restauram registrii
    pop edx
    pop ebx



    .final:
    mov esp, ebp
    pop ebp
    ret