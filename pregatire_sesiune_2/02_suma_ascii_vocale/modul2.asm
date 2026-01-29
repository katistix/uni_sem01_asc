bits 32

global _e_vocala


segment data use32 public data
    vocale db "aeiouAEIOU", 0

segment code use32 public code
_e_vocala:
    push ebp
    mov ebp, esp
    push esi ; salvam valoare lui esi, pentru ca il folosim

    mov edx, [ebp+8] ; punem in edx, argumentul functiei _e_vocala(char c)
    mov esi, vocale
    cld

    ; verificam daca se afla in sirul vocale
    .start_loop:
        xor eax,eax
        lodsb ; load in al the current char to compare with c
        
        ; daca am ajuns la finalul sirului
        cmp al, 0
        jz .final_loop

        cmp al, dl
        jnz .nu_e_vocala

        ; daca e vocala
        mov eax, 1
        jmp .final

        .nu_e_vocala:
    jmp .start_loop
    .final_loop:
    ; daca am ajuns aici, inseamna ca eax nu e vocala, deci returnam 0
    ; cel mai probabil eax==0 deja dar just to be sure
    mov eax, 0

    .final:
    pop esi ; restauram pe esi
    mov esp, ebp
    pop ebp
    ret