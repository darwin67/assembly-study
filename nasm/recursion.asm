;;; Factorial recursion
SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
        msg db "Factorial 3 is: ", 0xA, 0xD
        len equ $ - msg

        newline db 0xA, 0xD
        nlen equ $ - newline

section .bss
        fact resb 1
        num  resb 1

section .text
        global _start

_start:
        mov bx, 3               ; for calculating factorial 3

        call proc_fact

        add ax, 30h             ; 30h = '0'
        mov [fact], ax

        call printMsg

        mov eax, SYS_EXIT
        int 0x80

proc_fact:
        cmp bl, 1
        jg  do_calculation
        mov ax, 1
        ret

do_calculation:
        dec bl

        call proc_fact

        inc bl
        mul bl                  ; ax = al * bl
        ret

printMsg:
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg
        mov edx, len
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, fact
        mov edx, 1
        int 0x80

        ret
