;;; The following program creates and opens a file named myfile.txt, and writes a text
;;; 'Welcome to Tutorials Point' in this file. Next, the program reads from the file and
;;; stores the data into a buffer named info. Lastly, it displays the text as stored in info.

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
SYS_OPEN  equ 5
SYS_CLOSE equ 6
SYS_CREAT equ 8
STDOUT    equ 1

READ_ONLY equ 0

	%macro printMsg 2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, %1
        mov edx, %2
        int 80h
	%endmacro

section .data
        file_name db "myfile.txt"

        msg db "Welcome to Tutorials Point"
        len equ $ - msg

        msg_done db "Written to file", 0xA, 0xD
        len_done equ $ - msg_done

section .bss
        fd_out resb 1
        fd_in  resb 1
        info   resb 26

section .text
        global _start

_start:
        ;; create file
        mov eax, SYS_CREAT
        mov ebx, file_name
        mov ecx, 0777           ; read, write and execute
        int 80h

        mov [fd_out], eax       ; Store the file descriptor in "fd_out"

        ;; write into file
        mov eax, SYS_WRITE
        mov ebx, [fd_out]       ; File descriptor of the opened file
        mov ecx, msg
        mov edx, len
        int 80h

        ;; close the file
        mov eax, SYS_CLOSE
        mov ebx, [fd_out]

        printMsg msg_done, len_done

        ;; open the file for reading
        mov eax, SYS_OPEN
        mov ebx, file_name
        mov ecx, READ_ONLY
        mov edx, 0777           ; read, write and execute
        int 80h

        mov [fd_in], eax        ; Store the file descriptor in "fd_in"

        ;; read from file
        mov eax, SYS_READ
        mov ebx, [fd_in]
        mov ecx, info
        mov edx, 26
        int 80h

        ;; close file
        mov eax, SYS_CLOSE
        mov ebx, [fd_in]

        printMsg info, 26

        mov eax, SYS_EXIT
        int 80h
