bits 32
global start        

extern exit, printf
import exit msvcrt.dll
import printf msvcrt.dll



segment data use32 class=data
    out_fmt db "some text", 0


; our code starts here
segment code use32 class=code
    start:

        ; printf(text)
        push dword out_fmt
        call [printf]
        add esp, 4
        
            
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
