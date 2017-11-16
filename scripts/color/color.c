#include <stdio.h>
#include <stdlib.h>
#include "color.h"
#include <string.h>
// https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
/*
    Console can handle Bold, underline, background, high intensity,
    flashing, and more.  Iteratively add to this library as we use C more.
*/

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

void cprint(enum color c, int is_bold, char* message) {
    char* reset_string = "\e[0m";

    switch(c) {
        // choose color type
        case BLACK:
            break;
        case RED:
            break;
        case GREEN:
            break;
        case YELLOW:
            break;
        case BLUE:
            break;
        case PURPLE:
            break;
        case CYAN:
            break;
        case WHITE:
            break;
    }

   if (is_bold) {
      // Choose whether it should be bold
   }

  // might need to do special things for newlines/other end of lines
  printf("%s", "color_string");
  printf("%s", message);
  printf("%s", reset_string);
}
