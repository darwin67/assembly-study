toupper: toupper.o
	ld -m elf_i386 -s -o toupper.out toupper.o

toupper.o: toupper.asm
	nasm -f elf toupper.asm

test:
	./toupper.out < toupper.asm > test.txt

clean:
	rm -f *.out *.txt *.o
