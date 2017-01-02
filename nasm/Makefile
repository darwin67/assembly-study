
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
