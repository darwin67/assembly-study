lower: lower.o
	ld -m elf_i386 -s -o lower.out lower.o

lower.o: lower.asm
	nasm -f elf lower.asm
