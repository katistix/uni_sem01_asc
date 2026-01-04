; NOT OK

; Se dau un sir care contine n reprezentari binare pe 8 biti date ca sir de caractere.
; Sa se obtina un sir care contine numerele corespunzatoare reprezentarilor binare.
; Exemplu:
; Se da: '10100111b', '01100011b', '110b', '101011b'
; Se stocheaza: 10100111b, 01100011b, 110b, 101011b

bits 32

global start

import exit msvcrt.dll
extern exit

segment data use32
    siruri:
        db "10100111b", 0
        db "01100011b", 0
        db "110b", 0
        db "101011b", 0

    n equ 4

    rezultat resb n


segment code use32 public code
start:
    mov esi, siruri
    mov edi, rezultat
    mov ecx, n

    next_number:
        xor ebx, ebx

        next_bit:
            ; citeste bitii si construieste un numar nou in eax
            lodsb

            ; daca am ajuns la finalul unui numar
            cmp al, 'b'
            je store_number

            shl ebx, 1
            cmp al, '1'
            jne next_bit ; daca bitul citit e 0, lasam numarul shiftat si trecem la urmatorul
            inc ebx ; daca bitul citit e 1, 1000 -> 1001 (punem 1 dupa ce shiftam numarul)

        jmp next_bit

        store_number:
            mov eax, ebx
            stosb
            inc esi
    
    loop next_number ; repetam de n ori (pentru n numere)

    push 0
    call [exit]