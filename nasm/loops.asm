SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .bss
        num resb 1

section .text
        global _start

_start:
        mov ecx, 10
        mov eax, '1'

loop1:
        mov [num], eax

        mov eax, SYS_WRITE
        mov ebx, STDOUT

        push ecx

        mov ecx, num
        mov edx, 1
        int 0x80


        mov eax, [num]
        sub eax, '0'
        inc eax
        add eax, '0'

        pop ecx

        loop loop1

exit:
        mov eax, SYS_EXIT
        int 0x80
