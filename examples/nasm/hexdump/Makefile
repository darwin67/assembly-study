hexdump: hexdump.o
	ld -m elf_i386 -s -o hexdump.out hexdump.o

hexdump.o: hexdump.asm
	nasm -f elf hexdump.asm

test:
	./hexdump.out < input

clean:
	rm -f *.out *.o *.txt
