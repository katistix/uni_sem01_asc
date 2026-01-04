bits 32

global _rezolvare


segment code use32 public code
_rezolvare:
    push ebp
    mov ebp, esp


    .final:
        mov esp, ebp
        pop ebp
        ret