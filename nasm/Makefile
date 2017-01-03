
all: hello registers syscall

clean:
	rm *.out *.o


hello: hello.asm
	nasm -f elf hello.asm
	ld -m elf_i386 -s -o hello.out hello.o

registers: registers.asm
	nasm -f elf registers.asm
	ld -m elf_i386 -s -o registers.out registers.o

syscall: syscall.asm
	nasm -f elf syscall.asm
	ld -m elf_i386 -s -o syscall.out syscall.o

addressing: addressing.asm
	nasm -f elf addressing.asm
	ld -m elf_i386 -s -o addressing.out addressing.o

variables: variables.asm
	nasm -f elf variables.asm
	ld -m elf_i386 -s -o variables.out variables.o

constants: constants.asm
	nasm -f elf constants.asm
	ld -m elf_i386 -s -o constants.out constants.o

arithmetric: arithmetric.asm
	nasm -f elf arithmetric.asm
	ld -m elf_i386 -s -o arithmetric.out arithmetric.o

logical: logical.asm
	nasm -f elf logical.asm
	ld -m elf_i386 -s -o logical.out logical.o

conditions: conditions.asm
	nasm -f elf conditions.asm
	ld -m elf_i386 -s -o conditions.out conditions.o

loops: loops.asm
	nasm -f elf loops.asm
	ld -m elf_i386 -s -o loops.out loops.o

numbers: numbers.asm
	nasm -f elf numbers.asm
	ld -m elf_i386 -s -o numbers.out numbers.o

array: array.asm
	nasm -f elf array.asm
	ld -m elf_i386 -s -o array.out array.o

procedure: procedure.asm
	nasm -f elf procedure.asm
	ld -m elf_i386 -s -o procedure.out procedure.o

stack: stack.asm
	nasm -f elf stack.asm
	ld -m elf_i386 -s -o stack.out stack.o

recursion: recursion.asm
	nasm -f elf recursion.asm
	ld -m elf_i386 -s -o recursion.out recursion.o

macro: macro.asm
	nasm -f elf macro.asm
	ld -m elf_i386 -s -o macro.out macro.o

file: file.asm
	nasm -f elf file.asm
	ld -m elf_i386 -s -o file.out file.o
