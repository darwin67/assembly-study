;; convert binary values to ASCII strings

section .bss
        SYS_EXIT  equ 1
        SYS_WRITE equ 4
        SYS_READ  equ 3
        STDIN     equ 0
        STDOUT    equ 1
        EOF       equ 0

        BUFFLEN equ 16          ; read 16 bytes at a time

Buff:   resb BUFFLEN            ; the text buffer itself

section .data

HexStr: db " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00",10
        HEXLEN equ $- HexStr
Digits: db "0123456789ABCDEF"

section .text
global _start

_start:
        nop                     ; for debugger

        ; Read a buffer full of text from stdin
Read:
        mov eax, SYS_READ
        mov ebx, STDIN
        mov ecx, Buff
        mov edx, BUFFLEN
        int 80h

        mov ebp, eax            ; save number if bytes read from file for later use
        cmp eax, EOF            ; check if sys_read reached EOF
        je  Done                ; Finish if EOF

        ; setup registers for the process buffer step
        mov esi, Buff           ; place address of file buffer into esi
        mov edi, HexStr         ; place address of line string into edi
        xor ecx, ecx            ; clear line string pointer to 0

        ; Go through the buffer and convert binary values to hex digits
Scan:
        xor eax, eax            ; clear eax to 0

        ; calculate the offset into HexStr, which is the value in ecx X 3
        mov edx, ecx            ; copy the character counter into edx
        shl edx, 1              ; multiply pointer by 2 using left shift
        add edx, ecx            ; complete the multiplication X3

        ; get a character from the buffer and put it in both eax and ebx
        mov al, byte [esi+ecx]  ; put a byte from the input buffer into al
        mov ebx, eax            ; duplicate the byte in bl for second nybble

        ; look up low nybble character and insert it into the string
        and al, 0Fh             ; mask out all but the low nybble
        mov al, byte [Digits+eax] ; look up the char equivalent of nybble
        mov byte [HexStr+edx+2], al ; write LSB char digit to line string

        ; look up high nybble character and insert it into the string
        shr bl, 4               ; shift high 4 bits of char into low 4 bits
        mov bl, byte [Digits+ebx] ; look up char equivalent of nybble
        mov byte [HexStr+edx+1], bl ; write MSB char digit to line string

        ; bump the buffer pointer to the next character and see if we're done
        inc ecx                 ; increment line string pointer
        cmp ecx, ebp            ; compare to the number of chars in the buffer
        jna Scan                ; look back if ecx is <= number of chars in buffer

        ; write the line of hexadecimal values to stdout
        mov eax, SYS_WRITE
        mov ebx, STDOUT
        mov ecx, HexStr
        mov edx, HEXLEN
        int 80h

        jmp Read                ; loop back and load file buffer again

Done:
        mov eax, SYS_EXIT
        mov ebx, 0
        int 80h
