SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

%define NUM1 '4'
%define NUM2 '2'

section .data
        msg1 db "4 + 2 = "
        len1 equ $ - msg1

        msg2 db "4 - 2 = "
        len2 equ $ - msg2

        msg3 db "4 * 2 = "
        len3 equ $ - msg3

        msg4 db "4 / 2 = "
        len4 equ $ - msg4

        newline db 0xA, 0xD
        nlen equ $ - newline

section .bss
        res resb 1

section .text
        global _start

_start:
        ;; Addition
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg1
        mov edx, len1
        int 0x80

        mov eax, NUM1
        sub eax, '0'            ; convert NUM1 to integer
        mov ebx, NUM2
        sub ebx, '0'            ; convert NUM2 to integer
        add eax, ebx
        add eax, '0'            ; convert integer to string
        mov [res], eax

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, res
        mov edx, 1
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, newline
        mov edx, nlen
        int 0x80                ; print newline

        ;; Subtraction
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg2
        mov edx, len2
        int 0x80

        mov eax, NUM1
        sub eax, '0'            ; convert NUM1 to integer
        mov ebx, NUM2
        sub ebx, '0'            ; convert NUM2 to integer
        sub eax, ebx
        add eax, '0'            ; convert integer to string
        mov [res], eax

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, res
        mov edx, 1
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, newline
        mov edx, nlen
        int 0x80                ; print newline

        ;; Multiplication
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg3
        mov edx, len3
        int 0x80

        mov al, NUM1
        sub al, '0'             ; convert NUM1 to integer
        mov bl, NUM2
        sub bl, '0'             ; convert NUM2 to integer
        mul bl
        add al, '0'
        mov [res], al

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, res
        mov edx, 1
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, newline
        mov edx, nlen
        int 0x80                ; print newline

        ;; Division
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg4
        mov edx, len4
        int 0x80

        mov ax, NUM1
        sub ax, '0'             ; convert NUM1 to integer
        mov bl, NUM2
        sub bl, '0'             ; convert NUM2 to integer
        div bl
        add ax, '0'
        mov [res], ax

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, res
        mov edx, 1
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, newline
        mov edx, nlen
        int 0x80                ; print newline

        ;; Exit
        mov eax, SYS_EXIT
        int 0x80
