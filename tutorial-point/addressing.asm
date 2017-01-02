section .text
        global _start           ; must be declared for linked (ld)

section .data
        name db 'Zara Ali '

_start:                         ; tell linked entry point

        ;; Writing name 'Zara Ali'
        mov eax, 4              ; system call number (sys_write)
        mov ebx, 1              ; file descriptor (stdout)
        mov ecx, name           ; message to write
        mov edx, 9              ; message length
        int 0x80                ; call kernel

        mov [name], dword 'Nuha' ; Change the name to Nuha Ali

        ;; Writing name 'Nuha Ali'
        mov eax, 4
        mov ebx, 1
        mov ecx, name
        mov edx, 8
        int 0x80

        mov eax, 1              ; system call number (sys_exit)
        int 0x80
