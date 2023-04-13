#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_TEXT_SIZE 4096

int main(int argc, char *argv[]) {
    printf("\033c\033[44;37m\n");
    if (argc < 2) {
        fprintf(stderr, "Usage: %s [file_name]\n", argv[0]);
        exit(1);
    }

    char *file_name = argv[1];
    FILE *file = fopen(file_name, "w");
    if (file == NULL) {
        fprintf(stderr, "Failed to open file %s\n", file_name);
        exit(1);
    }

    char text[MAX_TEXT_SIZE];
	printf("Enter text to write to file, or an empty line to finish:\n");
    while (1) {
        
        fgets(text, MAX_TEXT_SIZE, stdin);
        if (strcmp(text, "\n") == 0) {
            break;
        }
        fputs(text, file);
    }

    fclose(file);
    printf("Text written to file %s\n", file_name);
    return 0;
}
