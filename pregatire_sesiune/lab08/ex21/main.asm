; Se citeste de la tastatura un sir de numere in baza 10. Sa se afiseze numerele prime.

bits 32

global start

import exit msvcrt.dll
import scanf msvcrt.dll
import printf msvcrt.dll
extern exit
extern scanf
extern printf

extern is_prime

segment data use32
    input_fmt db "%d", 0
    out_fmt db "%d", 0
    test_out db "test", 0
    numbers resd 100
    num dd 0

segment code use32 public code
start:
    ; citeste sirul de la tastatura pana cand se citeste 0
    ; scanf(format, buffer)
    mov edi, 0
    citeste_next:
        push num
        push input_fmt
        call [scanf]
        add esp, 4*2
        

        cmp dword [num], 0
        je sf_citire

        ; verificam daca este numar prim
        e_prim(value) -> eax = 1 sau 0
        push dword [num]
        call is_prime
        add esp, 4

        cmp eax, 0
        je nu_e_prim

        ; daca e prim
            mov eax, [num]
            ; append the number in the array
            mov [numbers + edi*4], eax
            inc edi

        nu_e_prim:
        jmp citeste_next     
    sf_citire:


    ; parcurge numerele si afiseaza-le
    mov esi, 0
    loop_afisare:
        ; verificam daca am ajuns la finalul sirului de numere prime
        cmp esi, edi
        je final

        ; printf(fmt, data...)
        push dword [numbers + esi*4]
        push out_fmt
        call [printf]
        add esp, 4*2

        inc esi
        jmp loop_afisare

    final:

    ; exit(0)
    push 0
    call [exit]