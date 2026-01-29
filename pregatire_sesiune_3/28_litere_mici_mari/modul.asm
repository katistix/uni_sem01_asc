bits 32

global _asmGenSiruri

segment code use32 public code
; void asmGenSiruri(char *input, char *sirLitereMici, char *sirLitereMari)
_asmGenSiruri:
    push ebp
    mov ebp, esp

    push esi
    push edi

    ; formam sirul cu literele mici
    mov esi, [ebp+8]
    mov edi, [ebp+12]

    .loop_mici_start:
        xor eax,eax

        lodsb

        test al,al
        jz .loop_mici_final

        ; daca nu e litera mica, sari peste
        cmp al, 'a'
        jb .next_mica
        cmp al, 'z'
        ja .next_mica

        ; altfel, il adaugam in output
        stosb

        .next_mica:
    jmp .loop_mici_start
    .loop_mici_final:
    ; null-terminate
    xor eax,eax
    stosb


    ; formam sirul cu literele mici
    mov esi, [ebp+8]
    mov edi, [ebp+16]

    .loop_mari_start:
        xor eax,eax

        lodsb

        test al,al
        jz .loop_mari_final

        ; daca nu e litera mare, sari peste
        cmp al, 'A'
        jb .next_mare
        cmp al, 'Z'
        ja .next_mare

        ; altfel, il adaugam in output
        stosb

        .next_mare:
    jmp .loop_mari_start
    .loop_mari_final:
    ; null-terminate
    xor eax,eax
    stosb


    pop edi
    pop esi

    .final:
    mov esp, ebp
    pop ebp
    ret