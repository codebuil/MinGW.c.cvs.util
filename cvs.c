#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_LINE_LENGTH 1024
#define MAX_FIELDS 100

int main(int argc, char *argv[]) {
    printf("\033c\033[44;37m\n");
    if (argc != 2) {
        printf("Usage: %s filename.csv\n", argv[0]);
        return 1;
    }

    char *filename = argv[1];
    char line[MAX_LINE_LENGTH];
    char *fields[MAX_FIELDS];
    int i;

    FILE *fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("Error opening file %s\n", filename);
        return 1;
    }

    while (fgets(line, MAX_LINE_LENGTH, fp)) {
        // Replace newline with null terminator
        line[strcspn(line, "\n")] = '\0';

        // Split line into fields
        i = 0;
        fields[i] = strtok(line, ",");
        while (fields[i] != NULL && i < MAX_FIELDS) {
            i++;
            fields[i] = strtok(NULL, ",");
        }

        // Print fields separated by tabs
        for (int j = 0; j < i; j++) {
            printf("%s\t", fields[j]);
        }
        printf("\n");
    }

    fclose(fp);
    return 0;
}
