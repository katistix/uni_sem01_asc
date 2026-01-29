bits 32

global _asmModul1
extern _asmModul2


segment data use32 public data
    numar_curent dd 0
    max_cif_impare dd 0
    numar_maxim dd 0
    semn_curent db 1 ; 1 pentru pozitiv, -1 pentru negativ
    

segment code use32 public code
; exemplu input: "-100 30 +35 99 104"
; int asmModul1(char* sir)
_asmModul1:
    push ebp
    mov ebp, esp

    ; salvam registrii pe care ii vom folosi
    push esi
    push edx

    mov esi, [ebp + 8]

    ; parcurgem fiecare caracter si formam numerele

    .loop_start:
        lodsb

        ; daca am ajuns la finalul sirului
        test al, al
        jz .loop_end

        ; daca am terminat cu numarul curent
        cmp al, ' '
        je .final_numar_curent

        ; daca suntem aici, inseamna ca caracterul este parte din numar
        ; construim numarul curent

        ; incercam sa citim semnul
        ; cmp al, '-'
        ; je .semn_negativ

        cmp al, '+' ; daca este semn pozitiv, il ignoram
        je .next


        ; formam in eax numarul curent, punem cifra in edx
        xor edx, edx
        mov dl, al
        sub dl, '0' ; convertim caracterul la cifra

        mov eax, [numar_curent]
        ; adaugam cifra la numar
        imul eax, 10
        add eax, edx

        mov [numar_curent], eax

        jmp .next




        .final_numar_curent:
            ; apelam asmModul2 pentru numarul curent
            mov eax, [numar_curent]
            push eax
            call _asmModul2
            add esp, 4
            ; acum in eax avem numarul de cifre impare
            cmp eax, [max_cif_impare]
            jl .skip_update_numar_maxim ; daca are mai putine cifre impare decat numarul cu cele mai multe cifre impare, trecem mai departe

                ; daca numarul de cifre impare este egal cu numarul maxim de cifre impare
                je .egalitate_cifre_impare

                ; daca are mai multe cifre impare, actualizam numarul maxim
                jmp .update_numar_maxim

            .egalitate_cifre_impare:
                ; daca numarul curent nu este mai mare decat numarul maxim, skip
                mov edx, [numar_curent]
                cmp edx, [numar_maxim]
                jle .skip_update_numar_maxim
                ; altfel, actualizam numarul maxim
                jmp .update_numar_maxim

                
            .update_numar_maxim:
                mov [max_cif_impare], eax
                mov [numar_maxim], edx
                mov dword [numar_curent], 0
                jmp .next



            .skip_update_numar_maxim:
                ; resetam numarul curent
                mov dword [numar_curent], 0
                jmp .next


        .next:
    jmp .loop_start
    .loop_end:



    ; restauram registrii
    pop edx
    pop esi


    ; returnam numarul maxim
    mov eax, [numar_maxim]

    .final:
    mov esp, ebp
    pop ebp
    ret