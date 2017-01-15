;;; Convert any uppercase characters in a file to lowercase
;;; Read in a char from stdin one at a time and process them
        SYS_EXIT  equ 1
        SYS_WRITE equ 4
        SYS_READ  equ 3
        STDIN     equ 0
        STDOUT    equ 1

section .bss
        Buff resb 1

section .data

section .text
global _start

_start:
        nop
        ; Code between starts here

Read:
        mov eax, SYS_READ
        mov ebx, STDIN
        mov ecx, Buff
        mov edx, 1
        int 80h

        cmp eax, 0              ; check with sys_read's return value
        je  Exit                ; exit if equal to zero (EOF)
                                ; or fall through to test for uppercase

        cmp byte [Buff], 41h    ; test input char against upper 'A' (41h)
        jb  Write               ; if below 'A' in ASCII chart, not uppercase

        cmp byte [Buff], 5Ah    ; test input char against upper 'Z' (5Ah)
        ja  Write               ; if above 'Z' in ASCII chart, not uppercase

        ; At this point, we have a uppercase character
        add byte [Buff], 20h    ; add 20h to convert to lowercase

Write:
        mov eax, SYS_WRITE      ; specify sys_write call
        mov ebx, STDOUT         ; file descriptor 1: stdout
        mov ecx, Buff           ; pass address of the character to write
        mov edx, 1              ; size of the byte to write for sys_write
        int 80h                 ; call kernel

        jmp Read                ; go back to read another character

Exit:
        mov eax, SYS_EXIT       ; specify sys_exit call
        mov ebx, 0              ; return code
        int 80h
