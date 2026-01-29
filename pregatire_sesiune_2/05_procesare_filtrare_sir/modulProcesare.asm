bits 32

global _asmProcesare

extern _deplasament
extern _citesteFactor

extern _asmFiltru


segment data use32 public data
    factor dd 0

segment code use32 public code
_asmProcesare:
    push ebp
    mov ebp, esp

    push esi
    push edi
    push ecx

    call _citesteFactor
    mov [factor], eax


    mov esi, [ebp+8]
    mov edi, [ebp+8]
    cld

    mov ecx, 10
    .loop_start:
        test ecx,ecx
        jz .loop_end

        ; eax = element
        lodsd ; load the next element

        ; eax = element*factor
        imul dword[factor]

        ; eax = (element*factor) + deplasament
        add eax, [_deplasament]

        stosd

        dec ecx
    jmp .loop_start
    .loop_end:

    ; apelam functia filtru
    push dword[ebp+8]
    call _asmFiltru
    add esp, 4

    pop ecx
    pop edi
    pop esi
    .final:
    mov esp, ebp
    pop ebp
    ret