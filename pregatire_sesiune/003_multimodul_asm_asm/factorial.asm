%ifndef _FACTORIAL_ASM_
%define _FACTORIAL_ASM_

factorial:
    mov eax, 1
    mov ecx, [esp+4]
    repet:
        mul ecx
    loop repet

    ret 4

%endif