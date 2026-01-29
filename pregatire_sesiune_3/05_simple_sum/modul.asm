bits 32

global _sum

segment code use32 public code
; a+b-c
_sum:
    push ebp 
    mov ebp, esp

    push ebx

    mov eax, [ebp+8]
    mov ebx, [ebp+12]

    add eax, ebx

    mov ebx, [ebp+16]
    sub eax, ebx

    pop ebx

    .final:
    mov esp, ebp
    pop ebp
    ret