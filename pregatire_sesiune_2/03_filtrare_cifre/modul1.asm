bits 32

global _filtrare

segment data use32 public data
    ; rezultat resb 100
    rezultat times 101 db 0

segment code use32 public code
_filtrare:
    push ebp
    mov ebp, esp

    push esi
    push edi

    mov esi, [ebp + 8]
    mov edi, rezultat
    cld

    .loop_start:
        xor eax, eax
        lodsb

        ; if at the end, exit the loop
        test al, al
        jz .loop_end

        ; if eax is a number, add it to rezultat
        cmp al, '0'
        jb .next_char

        cmp al, '9'
        ja .next_char

        ; daca am ajuns aici, inseamna ca este o cifra, deci o adaugam
        stosb

        .next_char:
    jmp .loop_start
    .loop_end:

    ; add 0 to the end of the string
    mov al, 0
    stosb

    ; return the new string
    mov eax, rezultat

    pop edi
    pop esi

    .final:
    mov esp, ebp
    pop ebp
    ret