birthday: birthday.o f_readline.o my_malloc.o readline.o
	gcc -W -Wextra -std=c99 -ggdb3 -o birthday birthday.o my_malloc.o f_readline.o readline.o

birthday.o: birthday.c birthday.h f_readline.h my_malloc.h readline.h
	gcc -W -Wextra -std=c99 -ggdb3 -c birthday.c 

f_readline.o: f_readline.c f_readline.h 
	gcc -W -Wextra -std=c99 -ggdb3 -c f_readline.c 

my_malloc.o: my_malloc.c my_malloc.h 
	gcc -W -Wextra -std=c99 -ggdb3 -c my_malloc.c

readline.o: readline.c readline.h 
	gcc -W -Wextra -std=c99 -ggdb3 -c readline.c
