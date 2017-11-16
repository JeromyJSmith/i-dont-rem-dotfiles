#include <stdio.h>
#include <stdlib.h>
#include "color.h"
#include <string.h>


void print_code(int ansii_num, char* message, int no_newline) {
    if (ansii_num > 255 || ansii_num < 0) {
        printf("Can't use numbers outside range 0-255");
        exit(1);
    }

    printf("\e[38;05;%dm%s\e[0m", ansii_num, message);
    if ( no_newline == 0) {
        printf("\n");
    }

}

void cprint(char c, int is_bold, char* message) {
    char* color_string = "color";
    char* reset_string = "reset";

    switch(c) {
        // choose color type
    }

   if (is_bold) {
      // Choose whether it should be bold
   }

  // might need to do special things for newlines/other end of lines
  printf("%s", color_string);
  printf("%s", message);
  printf("%s", reset_string);
}
