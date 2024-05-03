#include "my_malloc.h"

void *my_malloc(size_t size)
{
  void *new_ptr = malloc(size);

  if (new_ptr == NULL)
  {
    printf("ERROR: malloc did not allocate memory properly, may be a bug due to not enough memory available, try restarting\n");
    exit(EXIT_FAILURE);
  }

  return new_ptr;
}
