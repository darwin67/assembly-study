SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

%define FIVE  5
%define THREE 3

section .data
        and_msg db "5 AND 3 = "
        andlen equ $ - and_msg

        or_msg  db "5 OR  3 = "
        orlen equ $ - or_msg

        xor_msg db "5 XOR 3 = "
        xorlen equ $ - xor_msg

        test_msg db "5 TEST 3 = "
        testlen equ $ - test_msg

        not_msg db  "NOT 5  = "
        notlen equ $ - not_msg

        newline db 0xA, 0xD
        nlen equ $ - newline

section .bss
        res resb 1

section .text
        global _start

_start:
        ;; AND Instruction
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, and_msg
        mov edx, andlen
        int 0x80

        mov eax, FIVE           ; setting number in EAX
        and eax, THREE          ; result should be 1
        add eax, byte '0'       ; converting decimal to ASCII
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
        int 0x80

        ;; OR Instruction
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, or_msg
        mov edx, orlen
        int 0x80

        mov eax, FIVE           ; setting number in EAX
        mov ebx, THREE
        or  eax, ebx            ; result should be 7
        add eax, byte '0'       ; converting decimal to ASCII
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
        int 0x80

        ;; XOR Instruction
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, xor_msg
        mov edx, xorlen
        int 0x80

        mov eax, FIVE           ; setting number in EAX
        mov ebx, THREE
        xor eax, ebx            ; result should be 6
        add eax, byte '0'       ; converting decimal to ASCII
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
        int 0x80

        ;; TEST Instruction
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, test_msg
        mov edx, testlen
        int 0x80

        mov  eax, FIVE           ; setting number in EAX
        mov  ebx, THREE
        test eax, ebx            ; result should be 5
        add  eax, byte '0'       ; converting decimal to ASCII
        mov  [res], eax

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, res
        mov edx, 1
        int 0x80

        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, newline
        mov edx, nlen
        int 0x80

        ;; NOT Instruction
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, not_msg
        mov edx, notlen
        int 0x80

        mov eax, FIVE           ; setting number in EAX
        not eax                 ; result should be 10
        add eax, byte '0'       ; converting decimal to ASCII
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
        int 0x80


        ;; Exit
        mov eax, SYS_EXIT
        int 0x80
