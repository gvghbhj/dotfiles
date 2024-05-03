#include "f_readline.h"

int f_readline(FILE *fptr, char *location, int n)
{
  int c, i = 0;

  while (isspace(c = fgetc(fptr)))
      ;
  while (c != '\n' && c != EOF && i < n) 
  {
    location[i++] = c;
    c = fgetc(fptr);
  }
  location[i] = '\0';
  return i;
}
