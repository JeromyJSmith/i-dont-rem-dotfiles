#ifndef COLOR_H_
#define COLOR_H_

enum color {
    BLACK,
    RED,
    GREEN,
    YELLOW,
    BLUE,
    PURPLE,
    CYAN,
    WHITE
};

// TODO: enum for bold, underline, etc?

void print_code(int, char*, int);
void cprint(enum color, int, char*);

#endif // COLOR_H_
