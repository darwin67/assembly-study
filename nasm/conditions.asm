;; The following program displays the largest of three variables. The variables are double-digit variables.
;; The three variables num1, num2 and num3 have values 47, 22 and 31, respectively

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

section .data
        msg db "The largest digit is: ", 0xA, 0xD
        len equ $ - msg

        newline db 0xA, 0xD
        nlen equ $ - newline

        num1 dd '47'
        num2 dd '5'
        num3 dd '31'

section .bss
        largest resb 2

section .text
        global _start

_start:
        mov ecx, [num1]
        cmp ecx, [num2]
        jg  _check_third_num
        mov ecx, [num2]

_check_third_num:
        cmp ecx, [num3]
        jg  _exit
        mov ecx, [num3]

_exit:
        mov [largest], ecx

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg
        mov edx, len
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, largest
        mov edx, 2
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, newline
        mov edx, nlen
        int 0x80

        mov eax, SYS_EXIT
        int 0x80
