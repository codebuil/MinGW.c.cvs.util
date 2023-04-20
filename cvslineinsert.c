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
    ii=atoi(argv[2]);
    while (fgets(line, MAX_LINE_LENGTH, fp)) {
        // Replace newline with null terminator
        if(ii==i){
            printf("%s\r\n",argv[3]);
        }
      printf("%s",line);
        i++;

        
        
        
        
   
    
        
    }

    fclose(fp);
    return 0;
}
