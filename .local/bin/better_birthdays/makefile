clean:
	rm -vf f_readline.o my_malloc.o birthday.o

CFLAGS := -Wall -Wextra -std=gnu11 -pedantic -Werror -lreadline

birthday: birthday.o f_readline.o my_malloc.o

birthday.o: birthday.c birthday.h f_readline.h my_malloc.h

f_readline.o: f_readline.c f_readline.h 

my_malloc.o: my_malloc.c my_malloc.h 
