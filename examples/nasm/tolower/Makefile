tolower: tolower.o
	ld -m elf_i386 -s -o tolower.out tolower.o

tolower.o: tolower.asm
	nasm -f elf tolower.asm

test:
	./tolower.out < tolower.asm > test.txt

clean:
	rm -f *.out *.o *.txt
