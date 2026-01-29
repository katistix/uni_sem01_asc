bits 32

global _asmTraducere


segment data use32 public data
    adresaAlfabet dd 0
    adresaSirSursa dd 0
    adresaDestinatie dd 0
    inceputDestinatie dd 0

segment code use32 public code
;void asmTraducere(char *alfabet, char *source, char *dest);
_asmTraducere:
    push ebp
    mov ebp, esp

    
    push edx


    mov eax, [ebp+8]
    mov [adresaAlfabet], eax
    mov edx, eax
    mov eax, [ebp+12]
    mov [adresaSirSursa], eax
    mov eax, [ebp+16]
    mov [adresaDestinatie], eax



    push esi
    push edi
    push ebx

    ; parcurg toate literele din sirul sursa
    mov esi, [adresaSirSursa]
    mov edi, [adresaDestinatie]
    .loop_sursa_start:
        xor eax,eax

        lodsb

        ; daca am ajuns la finalul listei
        test al,al
        jz .loop_sursa_final

        ; convertim litera curenta in index in alfabet
        sub al, 'a' ; al=index in noul alfabet

        mov bl, [edx+eax]

        mov al, bl

        stosb

    jmp .loop_sursa_start
    .loop_sursa_final:

    ; null-terminate
    xor eax,eax
    stosb

    pop ebx
    pop edi
    pop esi

    .final:
    pop edx
    mov esp, ebp
    pop ebp
    ret
