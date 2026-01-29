bits 32

global _asmCheckSum

segment code use32 public code
_asmCheckSum:
    push ebp
    mov ebp, esp
    push ecx
    push edx

    mov eax, [ebp+8]
    mov ecx, 5
    xor edx, edx ; edx trebuie sa fie 0
    idiv ecx

    test edx, edx
    jnz .not_ok

    ; daca e ok
        mov eax, 1
        jmp .final

    .not_ok:
        mov eax, 0
        jmp .final

    .final:
    pop edx
    pop ecx
    mov esp, ebp
    pop ebp
    ret