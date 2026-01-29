bits 32

global _asmPareImpare
    adresaImpareLen dd 0


segment code use32 public code
; void asmPareImpare(int numbers[], int impareOut[], int *impareLen, int pareOut[], int *pareLen);
_asmPareImpare:
    push ebp
    mov ebp, esp


    push esi

    ; impare pare len
    mov eax, [ebp+16]
    mov [adresaImpareLen], eax


    ; impare
    mov esi, [ebp+8]
    mov edi, [ebp+12]

    .loop_impare_start:
        lodsd ; load an int

        


    jmp .loop_impare_start:
    .loop_impare_final:




    mov eax, [adresaImpareLen]
    inc [eax]


    pop esi


    .final:
    mov esp, ebp
    pop ebp
    ret