SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data
        msg db "Allocated 16 kb of memory!", 0xA, 0xD
        len equ $ - msg

section .text
        global _start

_start:
        mov eax, 45             ; sys_brk
        xor ebx, ebx
        int 80h

        add eax, 16384          ; number of bytes to be reserved
        mov ebx, eax

        mov eax, 45
        int 80h

        cmp eax, 0
        jl exit                 ; exit if error

        mov edi, eax            ; EDI = highest available address
        sub edi, 4              ; pointing to the last DWORD
        mov ecx, 4096           ; number of DWORDs allocated
        xor eax, eax            ; clear eax
        std                     ; backward
        rep stosd               ; repete for entire allocated area
        cld                     ; put DF flag to normal state

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, msg
        mov edx, len
        int 80h

exit:
        mov eax, SYS_EXIT
        xor ebx, ebx
        int 80h
