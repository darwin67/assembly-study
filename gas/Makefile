
hello: hello.o
	ld -o hello.out hello.o

hello.o: hello.s
	cc -c hello.s

hola: hola.s
	cc -o hola.out hola.s

clean:
	rm -f *.o *.out
