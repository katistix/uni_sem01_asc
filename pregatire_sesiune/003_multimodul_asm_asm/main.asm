bits 32
global start        

extern exit, printf
import exit msvcrt.dll
import printf msvcrt.dll

%include "factorial.asm"

segment data use32 class=data
    fmt_out db "factorial=%d",0
; our code starts here
segment code use32 class=code
    start:

        push dword 5
        call factorial

        ; print the result
        push eax
        push fmt_out
        call [printf]
        add esp, 4*2
        
            
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
