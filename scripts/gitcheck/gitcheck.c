#include <stdio.h>
#include <stdlib.h>
#include "../color/color.h"

int is_git_repo();
int unstaged_files_exist();
int untracked_files_exist();
int uncommited_files_exist();
int need_to_pull();
int need_to_push();
void check_directory();
int  get_subdirectories();
char* get_given_directory();
int get_remotes();

// 0 is false, not zero is true
int main(int argc, char* argv[]) {

    system("echo $SHELL");

    return 0;
    char* given_dir = get_given_directory();

    if (is_git_repo(given_dir)) {
        // run on given repo
        check_directory(given_dir);

    } else {
        // run on subdirectories
        char** subdirectories;

        int num_dirs = get_subdirectories(subdirectories);
        for (int i=0; i < num_dirs; i++) {
            check_directory(subdirectories[i]);
        }

    }
    system("echo $SHELL");
    return 0;
}


void  check_directory(char* directory) {
    int clean_repo = 1;

    if (!is_git_repo(directory)) {
        printf("Not a Git repo");
        exit(1);
    }

    if (unstaged_files_exist()) {
        clean_repo = 0;
    }

    if (untracked_files_exist()) {
        clean_repo = 0;
    }

    if (uncommited_files_exist()) {
        clean_repo = 0;
    }

    if (need_to_pull()) {
        clean_repo = 0;
    }

    if (need_to_push()) {
        clean_repo = 0;
    }

    if (clean_repo) {
        cprint('g', 1, "Nothing to do\n");
    }
}


int is_git_repo() {
    return 0;
}


int unstaged_files_exist() {
    return 0;
}


int untracked_files_exist() {
    return 0;
}


int uncommited_files_exist() {
    return 0;
}


int need_to_pull() {
    return 0;
}


int need_to_push() {
    return 0;
}


int get_subdirectories() {
    return 0;
}

char* get_given_directory() {
    return 0;
}
