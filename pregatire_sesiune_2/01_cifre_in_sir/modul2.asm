bits 32
global _este_cifra


segment code use32 public code
_este_cifra:
    push ebp ; salvam vechiul ebp pe stiva
    mov ebp, esp ; fixam ebp la pozitia curenta a esp

    ; REZOLVARE
    ; ebp = valoarea la care se da return
    ; ebp + 4 = valoarea salvata a ebp
    ; ebp + 8 = primul argument al functiei
    ; punem intr-un registru parametrul (char) care se afla la ebp + 8
    mov eax, [ebp+8]

    ; daca este mai mic decat caracterul '0'
    cmp eax, '0'
    jb .nu_e_cifra

    ; daca este mai mare decat caracterul '9'
    cmp eax, '9'
    ja .nu_e_cifra

    ; else: este cifra

    ; returnam in eax, TRUE
    mov eax, 1
    jmp .final

    .nu_e_cifra:
    ; returnam in EAX, FALSE
    mov eax, 0

    .final:
        mov esp, ebp ; restauram esp
        pop ebp ; restauram vechiul ebp
        ret