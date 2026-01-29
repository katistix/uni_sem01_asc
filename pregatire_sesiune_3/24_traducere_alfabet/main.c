#include <stdio.h>

extern void asmTraducere(char *alfabet, char *source, char *dest);

int main()
{
    char alfabet[] = "OPQRSTUVWXYZABCDEFGHIJKLMN";
    char s1[101];
    char s2[101];

    printf("Introduceti sirul sursa: ");
    scanf("%s", s1);

    asmTraducere(alfabet, s1, s2);

    printf("Noul sir este: \n%s", s2);
}