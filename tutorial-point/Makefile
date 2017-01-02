
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
