bits 32

global _asmUpper

segment data use32 public data

segment code use32 public code
_asmUpper:
    push ebp
    mov ebp, esp

    ; preserve other registers:
    push esi
    push edi

    mov esi,  [ebp+8]
    mov edi, [ebp+12]
    cld

    .loop_start:
        lodsb

        test al, al
        jz .loop_end
        
        cmp al, 97
        jb .next

        cmp al, 122
        ja .next

        ; to upper
        sub al, 32

        .next:
        stosb
    jmp .loop_start
    .loop_end:


    xor eax, eax
    stosb

    pop edi
    pop esi

    .final:
    mov esp, ebp
    pop ebp
    ret
