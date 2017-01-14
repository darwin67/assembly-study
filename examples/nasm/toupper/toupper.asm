;;; Convert any lowercase characters in a file to uppercase
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
        nop                     ; this nop keep the debugger happy

Read:
        mov eax, SYS_READ       ; specify the sys_read call
        mov ebx, STDIN          ; file descriptor 0: stdin
        mov ecx, Buff           ; pass address of buffer to read to
        mov edx, 1              ; size of byte to read for sys_read
        int 80h                 ; call kernel

        cmp eax, 0              ; looks at sys_read's return value in EAX
        je  Exit                ; jump if equal to zero (0 means EOF) to Exit
                                ; or fall through to test for lowercase

        cmp byte [Buff], 61h    ; test input char against lowercase 'a' (61h)
        jb  Write               ; if below 'a' in ASCII chart, not lowercase

        cmp byte [Buff], 7Ah    ; test input char against lowercase 'z' (7Ah)
        ja  Write               ; if above 'z' in ASCII chart, not lowercase

        ; At this point, we have a lowercase char
        sub byte [Buff], 20h    ; subtract 20h to give uppercase

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
