#ifndef BIRTHDAY_H
#define BIRTHDAY_H
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stdbool.h>

#define MAX_STR_SIZE 32
#define INIT_SIZE 10

#define ANSI_COLOR_RED     "\x1b[31m"

#define ANSI_COLOR_RESET   "\x1b[0m"

#define ANSI_COLOR_GREEN   "\x1b[32m"

struct birthday 
{
  int day, month;
  char *name;
};

void find_next(void);

void print_next(FILE *fptr_r);

void init_array(FILE *fptr);

int compare(const void *a, const void *b);

void print_help(void);

void add_to_array(const char **file_location);

void edit_array(const char **file_location);

void print_all(void);

void delete_from_array(const char **file_location);

enum operatons 
{
  ADD = 'a',
  EDIT = 'e',
  LIST = 'l',
  DELETE = 'd'
};


#endif // !DEBUG
