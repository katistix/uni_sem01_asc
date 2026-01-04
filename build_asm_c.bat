@REM for asm + C

@REM assemble asm modules
nasm modul1.asm -fwin32 -o modul1.obj
nasm modul2.asm -fwin32 -o modul2.obj

@REM Compile main.c and link the asm modules to it
cl main.c /link modul1.obj