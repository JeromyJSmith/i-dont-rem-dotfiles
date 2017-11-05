#include <stdio.h>
#include "color.h"


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
