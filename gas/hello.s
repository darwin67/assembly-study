        .set SYS_EXIT,  60
        .set SYS_WRITE, 1
        .set STDOUT,    1

        .global _start

        .text
_start:
        mov $SYS_WRITE, %rax            # system call 1 is write
        mov $STDOUT, %rdi            # file handler 1 is stdout
        mov $message, %rsi      # address of string to output
        mov $len, %rdx          # number of bytes
        syscall                 # invoke operating system

        mov $SYS_EXIT, %rax           # system call 60 is exit
        xor %rdi, %rdi          # want return code 0
        syscall

        .data
message:
        .ascii "Hello world\n"
        len = . - message
