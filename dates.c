#include <stdio.h>
#include <time.h>

int main() {
    time_t now = time(NULL);
    struct tm *t = localtime(&now);
    char date_str[11];
    printf("\033c\033[44;37m\n");
    sprintf(date_str, "%04d/%02d/%02d", t->tm_year + 1900, t->tm_mon + 1, t->tm_mday);
    printf("%s\n", date_str);
    return 0;
}
