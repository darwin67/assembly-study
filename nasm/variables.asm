section .text
        global _start

section .data
        choice db 'y '
        stars times 9 db '*'

_start:
        mov eax, 4
        mov ebx, 1
        mov ecx, choice
        mov edx, 2
        int 80h

        mov eax, 4
        mov ebx, 1
        mov ecx, stars
        mov edx, 9
        int 0x80

        mov eax, 1
        int 80h
