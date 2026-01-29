bits 32


global _asmProcessData
extern _citesteSufix
extern _asmSumDigits
extern _prefix
extern _logStep



segment data use32 public data
    mesaj db "S-a finalizat concatenarea!", 10, 0
    sufix times 101 db 0
    sirUtilizator dd 0
    dest dd 0


segment code use32 public code
; asmProcessData(sirUtilizator, dest)
_asmProcessData:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ecx

    push sufix
    call _citesteSufix
    add esp, 4

    mov eax, [ebp+8]
    mov [sirUtilizator], eax
    mov eax, [ebp+12]
    mov [dest], eax




    mov edi, [dest]

    ; adauga prefix
    mov esi, [_prefix]
    .loop_start_1:
        lodsb

        test al, al
        jz .loop_end_1

        stosb

    jmp .loop_start_1
    .loop_end_1:

    ; adauga primele 5 caractere din sirUtilizator
    mov esi, [sirUtilizator]
    mov ecx, 5
    .loop_start_2:
        lodsb

        test al, al
        jz .loop_end_2

        stosb

    loop .loop_start_2
    .loop_end_2:

    ; adauga sufix
    mov esi, sufix
    .loop_start_3:
        lodsb

        test al, al
        jz .loop_end_3

        stosb

    jmp .loop_start_3
    .loop_end_3:

    ; zero-terminate string
    xor eax,eax
    stosb


    pop ecx
    pop edi
    pop esi


    ; calculeaza suma cifrelor
    push dword[dest]
    call _asmSumDigits
    add esp, 4

    ; avem deja in eax rezultatul,
    ; dar il salvam pe stiva pt a putea apela
    ; in siguranta logStep
    push eax

    push mesaj
    call _logStep
    add esp, 4

    pop eax

    .final:
    mov esp, ebp
    pop ebp
    ret