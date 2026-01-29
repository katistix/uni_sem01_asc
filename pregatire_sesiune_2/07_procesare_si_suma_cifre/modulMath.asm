bits 32
global _asmSumDigits
segment code use32 public code
; int asmSumDigits(sirFull) = suma caracterelor cifre
_asmSumDigits:
    push ebp
    mov ebp, esp

    push ecx
    push esi
    

    xor ecx,ecx
    mov esi, [ebp+8]
    .loop_start:
        xor eax, eax
        lodsb

        ; if at the end
        test al,al
        jz .loop_end

        cmp al, '0'
        jb .next

        cmp al, '9'
        ja .next

        ; if it is a digit, add it to the sum
        sub al, '0' ; convert to number
        add ecx, eax

        .next:
    jmp .loop_start
    .loop_end:

    ; return the sum
    mov eax, ecx

    pop esi
    pop ecx

    .final:
    mov esp, ebp
    pop ebp
    ret