#!/bin/bash
# Build script for pure ASM projects (Linux-compatible)
# Original: nasm -f obj main.asm && alink main.obj -oPE -subsys console -entry start

set -e

echo "Building assembly project..."

# Assemble to ELF32 format for Linux
nasm -f elf32 main.asm -o main.o

# Link using gcc for 32-bit
gcc -m32 -no-pie main.o -o main

echo "Build successful! Run with: ./main"
