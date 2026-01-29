#!/bin/bash
# Build script for ASM + C projects (Linux-compatible)
# Original: nasm modules -fwin32 && cl main.c /link modules.obj

set -e

echo "Building ASM + C project..."

# Check if modul1.asm exists
if [ -f "modul1.asm" ]; then
    echo "Assembling modul1.asm..."
    nasm modul1.asm -felf32 -o modul1.o
fi

# Check if modul2.asm exists
if [ -f "modul2.asm" ]; then
    echo "Assembling modul2.asm..."
    nasm modul2.asm -felf32 -o modul2.o
fi

# Compile main.c and link with ASM modules
echo "Compiling and linking main.c..."
if [ -f "main.c" ]; then
    gcc -m32 -no-pie main.c modul*.o -o main
    echo "Build successful! Run with: ./main"
else
    echo "Error: main.c not found"
    exit 1
fi
