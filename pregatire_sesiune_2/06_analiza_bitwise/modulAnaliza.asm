bits 32

global _asmAnaliza

extern _masca
extern _asmCheckSum
extern _logValid

segment data use32 public data
    adresa_vector dd 0
    lungime dd 0
    suma dd 0

segment code use32 public code
; asmAnaliza(vector, lungime)
_asmAnaliza:
    push ebp
    mov ebp, esp

    push esi
    push ecx

    mov esi, [ebp+8] ; adresa vectorului
    mov ecx, [ebp+12] ; lungimea
    cld


    .loop_start:
        lodsd

        ; verifica conditia
        test eax, dword [_masca]
        jz .next

        ; adaugam numarul la suma
        add dword[suma], eax


        push ecx
        ; daca e respectata conditia
        ; apeleaza logValid
        push eax
        call _logValid
        add esp, 4

        pop ecx

        .next:
    loop .loop_start
    .loop_end:

    ; apeleaza checksum()
    push dword[suma]
    call _asmCheckSum
    add esp, 4

    ; avem deja in eax valoarea

    .final:
    pop ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret