KEY = -std=c99 -Wall -Werror -pedantic -fPIC
dprog: main.o
	gcc main.o -L. -ldynarr -Wl,-rpath,. -o dprog.exe $(KEY)
%.o: %.c
	gcc -c $< -o $@ $(KEY)
clean:
	rm *.exe *.o *.a *.so
