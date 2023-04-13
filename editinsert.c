#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

int modifyLine(char *inputs, char *temps, int lineNumber, char *newLineContent) {
    char line[MAX_LINE_LENGTH];
    int currentLineNumber = 1;
    
	FILE *input = fopen(inputs, "r");
      FILE *temp = fopen(temps, "w");

        if (!input || !temp) {
            printf("Não foi possível abrir os ficheiros\n");
            return 1;
        }
    // Ler linha a linha do ficheiro original e gravar no ficheiro temporario
    while (fgets(line, MAX_LINE_LENGTH, input)) {
        if (currentLineNumber == lineNumber) {
            // Substituir a linha pelo novo conteudo
            fprintf(temp, "%s", newLineContent);
        } 
            // Gravar a linha original
            fprintf(temp, "%s", line);
        

        currentLineNumber++;
    }

    // Fechar os ficheiros
    fclose(input);
    fclose(temp);

    // Apagar o ficheiro original
    remove(inputs);

    // Renomear o ficheiro temporario para o nome original
    rename(temps, inputs);
}

int main(int argc, char *argv[]) {
    char inputFilename[MAX_LINE_LENGTH];
    char lineContent[MAX_LINE_LENGTH];
    int lineNumber = -1;
    printf("\033c\033[44;37m\n");
    // Verificar que o programa foi chamado com o nome do ficheiro como argumento
    if (argc < 2) {
        printf("Uso: %s <nome do ficheiro>\n", argv[0]);
        return 1;
    }

    // Obter o nome do ficheiro a partir do argumento
    strncpy(inputFilename, argv[1], MAX_LINE_LENGTH);

    // Abrir o ficheiro para leitura
    FILE *input = fopen(inputFilename, "r");
    if (!input) {
        printf("Não foi possível abrir o ficheiro %s\n", inputFilename);
        return 1;
    }

    // Imprimir o conteúdo do ficheiro
    char line[MAX_LINE_LENGTH];
    int currentLineNumber = 1;
    while (fgets(line, MAX_LINE_LENGTH, input)) {
        printf("%d: %s", currentLineNumber, line);
        currentLineNumber++;
    }

    // Fechar o ficheiro
    fclose(input);

    // Entrar num loop para obter o numero da linha a ser alterada e o novo conteudo
    while (lineNumber != 0) {
        printf("Introduza o número da linha a alterar (0 para sair): ");
        scanf("%d", &lineNumber);

        if (lineNumber == 0) {
            break;
        }

        printf("Introduza o novo conteúdo da linha %d: ", lineNumber);
        getchar(); // Para limpar o buffer do stdin antes de ler a linha
        fgets(lineContent, MAX_LINE_LENGTH, stdin);

        // Abrir o ficheiro original e o temporario para escrita
        input = fopen(inputFilename, "r");
        FILE *temp = fopen("tempfile.tmp", "w");

        if (!input || !temp) {
            printf("Não foi possível abrir os ficheiros\n");
            return 1;
        }
	  fclose(temp);
	  fclose(input);
        // Chamar a função para modificar a linha
        if(modifyLine(inputFilename,"tempfile.tmp", lineNumber, lineContent)==1)exit(1);
    }

    return 0;
}
