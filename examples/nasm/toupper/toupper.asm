;;; Convert any lowercase characters in a file to uppercase
;;; Read in buffer of characters and skim through them

section .bss
        SYS_EXIT  equ 1
        SYS_WRITE equ 4
        SYS_READ  equ 3
        STDIN     equ 0
        STDOUT    equ 1
        EOF       equ 0

        BUFFLEN   equ 1024      ; length of buffer

        Buff resb BUFFLEN       ; text buffer

section .data

section .text
global _start

_start:
        nop                     ; this nop keep the debugger happy

Read:
        mov eax, SYS_READ       ; specify the sys_read call
        mov ebx, STDIN          ; file descriptor 0: stdin
        mov ecx, Buff           ; pass address of buffer to read to
        mov edx, BUFFLEN        ; size of byte to read for sys_read
        int 80h                 ; call kernel

        mov esi, eax            ; copy sys_read return value for safe keeping
        cmp eax, EOF            ; check if sys_read reached EOF
        je  Done                ; if equal to EOF, finish

        ; setup registers for the process buffer step
        mov ecx, esi            ; place the number of bytes read into ecx
        mov ebp, Buff           ; place address of buffer into ebp
        dec ebp

        ; go through the buffer and convert lowercase to uppercase characters
Scan:
        cmp byte [ebp+ecx], 61h ; test input char against lowercase 'a'
        jb  Next                ; if below 'a' in ASCII, not lowercase

        cmp byte [ebp+ecx], 7Ah ; test input char agains lowercase 'z'
        ja  Next                ; if above 'z' in ASCII, not lowercase

        ; at this point, we have a lowercase char
        sub byte [ebp+ecx], 20h ; subtract 20h to give uppercase

Next:
        dec ecx                 ; decrement ECX
        jnz Scan                ; if characters remain, loop back

Write:
        mov eax, SYS_WRITE      ; specify sys_write call
        mov ebx, STDOUT         ; file descriptor 1: stdout
        mov ecx, Buff           ; pass address of the character to write
        mov edx, esi            ; size of the byte to write for sys_write
        int 80h                 ; call kernel

        jmp Read                ; go back and load another buffer

Done:
        mov eax, SYS_EXIT       ; specify sys_exit call
        mov ebx, 0              ; return code
        int 80h
