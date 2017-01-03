SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
        achar db '0'

section .text
        global _start

_start:
        call display

        mov eax, SYS_EXIT
        int 0x80

display:
        mov ecx, 256

next:
        push ecx

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, achar
        mov edx, 1
        int 80h

        pop ecx

        mov dx, [achar]
        cmp byte [achar], 0dh
        inc byte [achar]
        loop next
        ret
