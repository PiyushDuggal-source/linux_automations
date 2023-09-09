#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

static const char PROJECT_DIR[] = "cd ~/Piyush/Personal-Projects/Javascript";
char CD_CMD[] = " && cd ";

int main(int argc, char **argv) {
  printf("hello World!\n");

  FILE *fp;
  if (argc < 2) {
    system(PROJECT_DIR);
    fp = popen(PROJECT_DIR, "r");
    
    fclose(fp);
    return 0;
  }

  if (access(argv[1], F_OK) == -1) {
    printf("File not found: %s\n", argv[1]);
    system(PROJECT_DIR);
    return 0;
  }
  char full_cmd[200];

  int i = 0, j = 0;
  while (PROJECT_DIR[i] != '\0') {
    full_cmd[j] = PROJECT_DIR[i];
    i++;
    j++;
  }
  i = 0;
  while (CD_CMD[i] != '\0') {
    full_cmd[j] = CD_CMD[i];
    i++;
    j++;
  }
  CD_CMD[j] = '\0';
  printf("%s", full_cmd);
  system(full_cmd);

  return 0;
}
