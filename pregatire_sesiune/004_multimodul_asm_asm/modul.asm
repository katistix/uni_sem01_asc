bits 32
segment code use32 public code
global factorial

factorial:
    mov eax, 1
    mov ecx, [esp+4] ; luam cei 4 octeti (dword) pasati ca parametru pentru functie

    repet:
        mul ecx
    loop repet

    ret 4 ; in acest caz 4 reprezinta numarul de octeti ce trebuie eliberati de pe stiva (parametrul pasat procedurii)