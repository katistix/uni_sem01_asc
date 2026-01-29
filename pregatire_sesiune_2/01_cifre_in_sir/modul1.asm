bits 32

global _rezolvare
extern _este_cifra

segment code use32 public code
_rezolvare:
    push ebp
    mov ebp, esp

    ; pozitia de start in sir
    mov esi, [ebp + 8] ; primul si singurul argument al functiei
    xor ecx, ecx

    .start_loop:
    
        lodsb ; load the current byte in AL

        ; daca am ajuns la finalul sirului, terminal loop-ul
        cmp eax, 0
        jz .final_loop

        ; verifica daca este cifra, folosind cealalta procedura
        push eax
        call _este_cifra
        add esp, 4

        ; daca nu e cifra
        cmp eax, 0
        jz .nu_e_cifra

            ; daca e cifra, crestem contorul
            inc ecx


        .nu_e_cifra:


    jmp .start_loop
    .final_loop:


    ; returnam in eax valoarea contorului
    mov eax, ecx

    .final:
        mov esp, ebp
        pop ebp
        ret