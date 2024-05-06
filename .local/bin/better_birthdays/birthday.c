#include "birthday.h"
#include "f_readline.h"
#include "my_malloc.h"

struct birthday **birthdays = NULL;
int num_args = 0;         // num arguments in the birthdays array
int max_args = INIT_SIZE; // initial size of the birthdays array

int main(int argc, char *argv[]) {
  FILE *fptr_r; // filee to read
  const char *help_flag = "-h";

  const char *file_location =
      getenv("birthdays_file"); // gets the file location as an env variable

  fptr_r = fopen(file_location, "r");

  if (fptr_r == NULL)
  {
    printf("Database file can not be opened, make sure the file exist and is "
           "properly represented by $birthdays_file\n");
  }

  if (argc < 2) // if run without commandline arguments
  {
    birthdays = my_malloc(INIT_SIZE * sizeof(struct birthday *));
    print_next(fptr_r);
    fclose(fptr_r);
    exit(EXIT_SUCCESS);
  }

  for (int i = 1; i < argc; i++) // checks if "-h" exists in argv
  {
    if (strcmp(argv[i], help_flag) == 0) {
      fclose(fptr_r);
      print_help();
    }
  }

  switch (tolower(argv[1][0])) // the main switch statement of the program
  {
  case ADD:
    birthdays = my_malloc(INIT_SIZE * sizeof(struct birthday *));
    init_array(fptr_r); // Initializes the birthdays array
    add_to_array(&file_location);
    fclose(fptr_r);
    exit(EXIT_SUCCESS);
  case EDIT:
    birthdays = my_malloc(INIT_SIZE * sizeof(struct birthday *));
    init_array(fptr_r);
    edit_array(&file_location);
    fclose(fptr_r);
    exit(EXIT_SUCCESS);
  case DELETE:
    birthdays = my_malloc(INIT_SIZE * sizeof(struct birthday *));
    init_array(fptr_r);
    delete_from_array(&file_location);
    fclose(fptr_r);
    exit(EXIT_SUCCESS);
  case LIST: // unlike others this manually frees the birthdays array as that is
             // not the job of print_all as print_all is used by other functions
             // as well such as edit_array
    birthdays = my_malloc(INIT_SIZE * sizeof(struct birthday *));
    init_array(fptr_r);
    print_all();

    for (int i = 0; i <= num_args; i++) {
      free(birthdays[i]->name);
      free(birthdays[i]);
    }
    free(birthdays);

    fclose(fptr_r);
    exit(EXIT_SUCCESS);
  default:
    fclose(fptr_r);
    print_help();
  }
}

void init_array(FILE *fptr) // Initializes the birthdays array by reading values
                            // from the Database file
{
  birthdays[num_args] =
      my_malloc(sizeof(struct birthday)); // allocates size for each element
  birthdays[num_args]->name = my_malloc(
      sizeof(char) *
      (MAX_STR_SIZE + 1)); // allocates size for the string of each element, as
                           // the struct contains the name member

  while (fscanf(fptr, "%d,", &(birthdays[num_args]->day)) == 1) {
    fscanf(fptr, "%d,", &(birthdays[num_args]->month));

    f_readline(fptr, birthdays[num_args]->name, MAX_STR_SIZE);

    num_args++;

    if (num_args == max_args) // if more space is needed in the birthdays array
                              // then it is allocated by realloc
    {
      max_args *= 2;
      birthdays = realloc(birthdays, max_args * sizeof(struct birthday *));

      if (birthdays == NULL) {
        printf("ERROR: Memory error in init function\n");
        exit(EXIT_FAILURE);
      }
    }
    birthdays[num_args] = my_malloc(sizeof(struct birthday));
    birthdays[num_args]->name = my_malloc(sizeof(char) * (MAX_STR_SIZE + 1));
  }
}

void find_next(void) {
  // gets the current date
  time_t t = time(NULL);
  struct tm *tm = localtime(&t);
  int current_month = tm->tm_mon + 1; // cause it is 0 indexed
  int current_day = tm->tm_mday;

  qsort(birthdays, num_args, sizeof(struct bithday *),
        compare); // sorts the array before printing
  for (int i = 0; i < num_args; i++) {
    if (birthdays[i]->month == current_month &&
        birthdays[i]->day > current_day) {
      printf("Upcoming birthday: %d/%d -> %s\n", birthdays[i]->day,
             birthdays[i]->month, birthdays[i]->name);
      break;
    }
    if (birthdays[i]->month > current_month) {
      printf("Upcoming birthday: %d/%d -> %s\n", birthdays[i]->day,
             birthdays[i]->month, birthdays[i]->name);
      break;
    }
  }
}

int compare(const void *a, const void *b) {
  const struct birthday *p1 =
      *(const struct birthday **)
          a; // necessary because of the way that the array is defined
  const struct birthday *p2 = *(const struct birthday **)b;

  if (p1->month == p2->month) {
    if (p1->day == p2->day) {
      return 0;
    }

    else if (p1->day < p2->day) {
      return -1;
    }

    else {
      return 1;
    }
  }

  else if (p1->month < p2->month) {
    return -1;
  }

  else {
    return 1;
  }
}

void print_next(FILE *fptr_r) {
  init_array(fptr_r);

  find_next();

  for (int i = 0; i <= num_args;
       i++) // <= is needed becuase init_array allocates memory before it is
            // actually used, hence the memory for birthdays[num_args] is
            // allocated but not used
  {
    free(birthdays[i]->name);
    free(birthdays[i]);
  }
  free(birthdays);
}

void print_help(void)
{
  printf("./birthday [operation] [flags] [flag args]\n\n");
  printf("Operations: a/add, e/edit, d/delete, l/list\n\n");
  printf("Flags: \n-h [prints help information]\n\n");
  printf("If run with no arguments, birthdays will print out the next upcoming "
         "birthday based on the current date\n\n");
  printf("To customize the location of the birthdaysdb file edit the env "
         "variable $birthdays_file\n");
  exit(EXIT_SUCCESS);
}

void add_to_array(const char **file_location) {
  printf("Enter nothing (an empty line) to exit\n\n");

  birthdays[num_args]->name = readline("Enter name: ");

  while (birthdays[num_args]->name[0] != '\0') // checks if an empty line (just enter key) was entered by user
  {
    if (num_args == max_args)
    {
      max_args *= 2;
      birthdays = realloc(birthdays, max_args * sizeof(struct birthday *));
      if (birthdays == NULL)
      {
        printf("ERROR: Memory error\n");
      }
    }

    printf("Enter Day: ");
    scanf("%d", &(birthdays[num_args]->day));

    printf("Enter Month: ");
    scanf("%d", &(birthdays[num_args]->month));

    num_args++;

    getchar();
    printf("\n");
    birthdays[num_args]->name = readline("Enter name: ");

    birthdays[num_args] = my_malloc(sizeof(struct birthday));
  }

  printf("\n");
  print_all();

  FILE *fptr_w = fopen(*file_location, "w");

  if (fptr_w == NULL) {
    printf("Database file can not be opened, make sure the file exist and is "
           "properly represented by $birthdays_file\n");
  }

  for (int i = 0; i < num_args; i++) {
    fprintf(fptr_w, "%d,%d,%s\n", birthdays[i]->day, birthdays[i]->month,
            birthdays[i]->name);
  }

  for (int i = 0; i <= num_args; i++) {
    free(birthdays[i]->name);
    free(birthdays[i]);
  }

  free(birthdays);

  fclose(fptr_w);
}

inline void print_all(void) {
  qsort(birthdays, num_args, sizeof(struct birthday *), compare);

  printf("Index\t\tDay/Month\tName\n\n");
  for (int i = 0; i < num_args; i++) {
    printf("%d\t\t%d/%d\t\t%s\n", i + 1, birthdays[i]->day, birthdays[i]->month,
           birthdays[i]->name);
  }
}

void edit_array(const char **file_location) {
  printf("Enter 0 to end\n\n");
  print_all();

  printf("\n");

  int index_edit;              // index chosen by user
  char name[MAX_STR_SIZE + 1]; // temporary buffer for name
  printf("Enter index to edit: ");
  scanf("%d", &index_edit);

  while (index_edit != 0 && index_edit <= num_args) {
    printf("\n");

    getchar();

    birthdays[index_edit]->name = readline("Enter Name (enter nothing/empty line to leave name unchanged) : ");

    printf("Enter Day: ");
    scanf("%d", &(birthdays[index_edit - 1]->day));

    printf("Enter Month: ");
    scanf("%d", &(birthdays[index_edit - 1]->month));

    printf("\n");
    printf("Enter index to edit: ");
    scanf("%d", &index_edit);
  }

  printf("\n");

  print_all();

  FILE *fptr_w = fopen(*file_location, "w");

  if (fptr_w == NULL) {
    printf("Database file can not be opened, make sure the file exist and is "
           "properly represented by $birthdays_file\n");
  }

  for (int i = 0; i < num_args; i++) {
    fprintf(fptr_w, "%d,%d,%s\n", birthdays[i]->day, birthdays[i]->month,
            birthdays[i]->name);
  }

  for (int i = 0; i <= num_args; i++) {
    free(birthdays[i]->name);
    free(birthdays[i]);
  }

  free(birthdays);

  fclose(fptr_w);
}

// does not actually delete element from array, but simply does not write that
// element from array when writing to file, done in this way for better
// perforemance and complexity
void delete_from_array(const char **file_location) {
  printf("Enter 0 to end\n\n");
  print_all();

  printf("\n");

  int index_delete;
  printf("Enter index to DELETE: ");
  scanf("%d", &index_delete);

  while (index_delete != 0 && index_delete <= num_args) {
    birthdays[index_delete - 1]->day = 0;
    birthdays[index_delete - 1]->month = 0;

    printf("\nNew array: \n\n");

    printf("Index\t\tDay/Month\tName\n\n");
    for (int i = 0; i < num_args; i++) {
      if (birthdays[i]->day != 0) {
        printf("%d\t\t%d/%d\t\t%s\n", i + 1, birthdays[i]->day,
               birthdays[i]->month, birthdays[i]->name);
      } else {
        // Cursed formatting, but works so oh well
        printf(ANSI_COLOR_RED "%d\t\t    %d/%d\t\t    %s\n" ANSI_COLOR_RESET,
               i + 1, birthdays[i]->day, birthdays[i]->month,
               birthdays[i]->name);
      }
    }

    printf("\n");
    printf("Enter index to DELETE: ");
    scanf("%d", &index_delete);
  }

  FILE *fptr_w = fopen(*file_location, "w");

  if (fptr_w == NULL) {
    printf("Database file can not be opened, make sure the file exist and is "
           "properly represented by $birthdays_file\n");
  }

  for (int i = 0; i < num_args; i++) {
    if (birthdays[i]->day != 0) {
      fprintf(fptr_w, "%d,%d,%s\n", birthdays[i]->day, birthdays[i]->month,
              birthdays[i]->name);
    }
  }

  for (int i = 0; i <= num_args; i++) {
    free(birthdays[i]->name);
    free(birthdays[i]);
  }

  free(birthdays);

  fclose(fptr_w);
}
