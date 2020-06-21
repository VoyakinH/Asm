KEY = -std=c99 -Wall -Werror -pedantic -fPIC
dynamic: darray.o CDIO.o
	gcc -shared -o libdynarr.so darray.o CDIO.o
%.o: %.c
	gcc -c $< -o $@ $(KEY)
clean:
	rm *.exe *.o *.a *.so
