bits 32

global _asmFiltru

segment code use32 public code
_asmFiltru:
    push ebp
    mov ebp, esp

    push esi
    push edi
    push ecx

    mov esi, [ebp+8]
    mov edi, [ebp+8]
    cld

    mov ecx, 10
    .loop_start:
        test ecx,ecx
        jz .loop_end

        ; eax = element
        lodsd ; load the next element

        cmp eax, 0
        jg .next

        xor eax, eax

        .next:
        stosd

        dec ecx
    jmp .loop_start
    .loop_end:

    pop ecx
    pop edi
    pop esi

    .final:
    mov esp, ebp
    pop ebp
    ret