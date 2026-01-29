bits 32 

extern fopen, fclose, fread
import fopen msvcrt.dll
import fclose msvcrt.dll
import fread msvcrt.dll

segment data use32 public data
    read_mode db "r", 0
    file_descriptor dd -1


segment code use32 public code
; read_input(input_filename, out_buffer)
_read_input:
    push ebp
    mov ebp, esp

    ; [ebp + 8] -> input_filename
    ; [ebp + 12] -> out_buffer

    ; open the file fopen(input_filename, "r")
    push dword read_mode ; mode "r"
    push dword [ebp + 8] ; input_filename
    call [fopen]
    add esp, 4*2

    
    ; now eax has the FILE* pointer
    ; TODO: verify if the file was opened successfully
    ; for now, we assume it was successful
    mov [file_descriptor], eax

    ; read the file to the buffer fread(out_buffer, 1, file_size, FILE*)
    push dword [file_descriptor]              ; FILE* pointer
    push dword [ebp + 12] ; out_buffer
    call [fread]
    add esp, 4*3



    ; close the file

    .final:
    mov esp, ebp
    pop ebp
    ret
