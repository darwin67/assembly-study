%macro print 2
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro exit 0
        mov eax, 1
        mov ebx, 0
        int 80h
%endmacro

section .data
snippet: db "KANGAROO"
len: equ $- snippet

section .text
global _start

_start:
        nop
        ; Code between starts here

        mov ebx, snippet
        mov eax, len
DoMore: add byte [ebx], 32 ; Add 32 to the value in memory address
        inc ebx
        dec eax
        jnz DoMore

        ; Code ends here
        nop

        print snippet, len
        exit
