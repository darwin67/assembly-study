SYS_EXIT  equ 1
SYS_WRITE equ 4
STDOUT    equ 1

section .data

global x
x:
        db 2
        db 4
        db 3

sum:
        db 0

section .text
        global _start

_start:
        mov eax, 3              ; number of bytes to be summed
        mov ebx, 0              ; EBX will store the sum
        mov ecx, x              ; ECX will point to the current element to be summed

top:
        add ebx, [ecx]
        add ecx, 1              ; move pointer to next element
        dec eax                 ; decrement counter
        jnz top                 ; if counter != 0, loop again

done:
        add ebx, '0'
        mov [sum], ebx          ; done, store result in "sum"

display:
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, sum
        mov edx, 1
        int 0x80

        mov eax, SYS_EXIT
        int 0x80
