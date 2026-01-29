bits 32

global _asmPareImpare


segment code use32 public code
; void asmPareImpare(int numbers[], int impareOut[], int impareLen, int pareOut[], int pareLen);
_asmPareImpare:
    push ebp
    mov ebp, esp


    .final:
    mov esp, ebp
    pop ebp
    ret