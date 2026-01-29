// Scrie un program multimodul (C + ASM) care primește un șir de caractere mixt
// și returnează un șir nou format doar din cifrele găsite în șirul sursă.

#include <stdio.h>

extern char *filtrare(char *input_string);

int main()
{
    char s[100];
    printf("Input: ");
    scanf("%s", s);

    char *rezultat = filtrare(s);

    printf("Sirul filtrat: %s", rezultat);

    return 0;
}