#include <stdio.h>

char *prefix = "COD-";

extern int asmProcessData(char *sirUtilizator, char *dest);

void logStep(char *mesaj)
{
    printf("LOG: %s", mesaj);
}

void citesteSufix(char *dest)
{
    printf("Citeste sufixul: ");
    scanf("%s", dest);
}

int main()
{
    char sirUtilizator[100];
    char sirFinal[200];

    printf("Citeste sirUtilizator: ");
    scanf("%s", sirUtilizator);

    int result = asmProcessData(sirUtilizator, sirFinal);

    printf("REZULTAT: %s \n %d", sirFinal, result);
}