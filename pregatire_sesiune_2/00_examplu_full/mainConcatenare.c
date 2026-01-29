#include <stdio.h>

char *sirC = "1234567890abcd";

void asmConcat(char *sir1, char *result);
void asmUpper(char *src, char *dest);

void citesteSir(char *dest)
{
    scanf("%s", dest);
}

int main()
{
    char sir1[100];
    char result[303];
    char resultUpper[303];

    scanf("%s", sir1);

    asmConcat(sir1, result);
    asmUpper(result, resultUpper);

    printf("rezultatul: ");
    printf("%s", resultUpper);
}