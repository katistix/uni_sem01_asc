bits 32

global is_prime

segment code use32 public code
is_prime:
    push ebp
    mov ebp, esp
    ; salvam ebx
    push ebx

    ; incarcam in ebx parametrul functiei
    mov ebx, dword [ebp + 8]
    
    ; tratam cazul de baza
    cmp ebx, 2
    jl .nu_e_prim ; daca n<2 -> n nu e prim
    je .e_prim ; daca n==2 -> n e prim

    ; daca e par (si mai mare ca 2)
    test ebx, 1
    jz .nu_e_prim

    ; for(int i=3;i*i<=n;i++)
    mov ecx, 3
    .loop_verif
        ; verificam conditia ecx*ecx > ebx


    jmp .loop_verif






    .e_prim:
        mov eax, 1
        jmp .final

    .nu_e_prim:
        xor eax, eax ; daca nu e prim, atunci eax=0


    .final:
        pop ebx
        mov esp, ebp
        pop ebp

    ret