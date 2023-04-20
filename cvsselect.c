#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#define MAX_LINE_LENGTH 1024
#define MAX_FIELDS 100

int main(int argc, char *argv[]) {
    printf("\033c\033[44;37m\n");
    if (argc != 4) {
        printf("Usage: %s \"filename.csv\" \"0\" \"value\"\n", argv[0]);
        return 1;
    }

    char *filename = argv[1];
    char line[MAX_LINE_LENGTH];
    char *fields[MAX_FIELDS];
    char c[4096];
    int i=0;
    int ii=0;

    FILE *fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("Error opening file %s\n", filename);
        return 1;
    }

    while (fgets(line, MAX_LINE_LENGTH, fp)) {
        // Replace newline with null terminator
        strcpy(c,line);
        line[strcspn(line, "\n")] = '\0';

        // Split line into fields
        i = 0;
        fields[i] = strtok(line, ",");
        while (fields[i] != NULL && i < MAX_FIELDS) {
            i++;
            fields[i] = strtok(NULL, ",");
        }
        ii=atoi(argv[2]);
        // Print fields separated by tabs
        if(ii<i){
            if(strcmp(argv[3],fields[ii])==0)printf("%s",c);
        }
        
        
   
    
        
    }

    fclose(fp);
    return 0;
}
