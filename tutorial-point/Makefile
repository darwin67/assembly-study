
all: hello registers syscall

clean:
	rm *.out *.o


hello: hello.o
	ld -m elf_i386 -s -o hello.out hello.o

hello.o: hello.asm
	nasm -f elf hello.asm


registers: registers.o
	ld -m elf_i386 -s -o registers.out registers.o

registers.o: registers.asm
	nasm -f elf registers.asm


syscall: syscall.o
	ld -m elf_i386 -s -o syscall.out syscall.o

syscall.o:
	nasm -f elf syscall.asm


addressing: addressing.o
	ld -m elf_i386 -s -o addressing.out addressing.o

addressing.o: addressing.asm
	nasm -f elf addressing.asm


variables: variables.o
	ld -m elf_i386 -s -o variables.out variables.o

variables.o: variables.asm
	nasm -f elf variables.asm


constants: constants.o
	ld -m elf_i386 -s -o constants.out constants.o

constants.o: constants.asm
	nasm -f elf constants.asm
