#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char** environ;

int main() {
  printf("Content-type: text/html\n");
  printf("\n");
  printf("Am primit antetele:<br><br>");
  int i=0;
  while(environ[i]!=0){
    if(strncmp(environ[i],"HTTP",4)==0)
    {
      printf("%s<br>",environ[i]+5);
    }
    i++;
  }

  return 0;
}
