bits 32

global _func_name

segment code use32 public code
_func_name:
    push ebp
    mov ebp, esp


    .final:
        mov esp, ebp
        pop ebp
        ret