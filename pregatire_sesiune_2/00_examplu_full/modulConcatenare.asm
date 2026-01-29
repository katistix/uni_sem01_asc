bits 32

global _asmConcat

extern _sirC
extern _citesteSir

segment data use32 public data
    adresaSir1 dd 0
    adresaRezultat dd 0
    sirCitit times 101 db 0

segment code use32 public code
_asmConcat:
    push ebp
    mov ebp, esp

    ; preserve other registers:
    push esi
    push edi

    mov eax, [ebp+8]
    mov dword[adresaSir1], eax
    mov eax, [ebp+12]
    mov dword[adresaRezultat], eax

    mov edi, [adresaRezultat]
    cld


    ; adauga primul sir
    mov esi, [adresaSir1]
    mov ecx, 10
    .loop_start_1:
        test ecx,ecx
        jz .loop_end_1
        
        lodsb

        test al,al
        jz .loop_end_1

        stosb
        dec ecx
        
    jmp .loop_start_1
    .loop_end_1:

    ; citeste al doilea sir
    push sirCitit
    call _citesteSir
    add esp, 4

    ; adauga al doilea sir
    mov esi, sirCitit
    mov ecx, 10
    .loop_start_2:
        test ecx,ecx
        jz .loop_end_2
        
        lodsb

        test al,al
        jz .loop_end_2

        stosb
        dec ecx
        
    jmp .loop_start_2
    .loop_end_2:

    ; adauga al treilea sir
    mov esi, [_sirC]
    mov ecx, 10
    .loop_start_3:
        test ecx,ecx
        jz .loop_end_3
        
        lodsb

        test al,al
        jz .loop_end_3

        stosb
        dec ecx

    jmp .loop_start_3
    .loop_end_3:

    xor eax, eax
    stosb

    pop edi
    pop esi

    .final:
    mov esp, ebp
    pop ebp
    ret
