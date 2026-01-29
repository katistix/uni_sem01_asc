bits 32

global _suma_ascii
extern _e_vocala

segment code use32 public code
_suma_ascii:
    push ebp
    mov ebp, esp
    push esi

    xor ecx, ecx

    mov esi, [ebp+8] ; pozitia de start din noul sir
    cld

    ; parcurgem sirul si pentru fiecare caracter, verificam daca este vocala
    .loop_start:
        xor eax, eax
        lodsb ; load the current char in AL

        ; check if at the end of the string
        test al, al
        jz .loop_end

        push eax ; salvam eax ca sa il avem si dupa verificare

        ; check if _e_vocala
        push eax
        call _e_vocala
        add esp, 4

        cmp eax, 0
        jz .nu_e_vocala
        jmp .e_vocala


        .nu_e_vocala:
            pop eax
            jmp .loop_start

        .e_vocala:
            pop eax
            add ecx, eax
            jmp .loop_start


        .final_check:
    jmp .loop_start
    .loop_end:

    ; returnam in EAX valoarea sumei
    mov eax, ecx

    .final:
    pop esi
    mov esp, ebp
    pop ebp
    ret