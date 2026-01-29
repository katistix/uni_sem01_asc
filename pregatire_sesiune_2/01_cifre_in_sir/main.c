// Se dă un șir de caractere citit în limbajul C.
// Să se scrie un program multimodul care să numere
// câte caractere din șir sunt cifre (între '0' și '9')

#include <stdio.h>

// declaram functia externa din ASM
extern int rezolvare(char s[]);
// extern int este_cifra(char c);

int main()
{
    // citire
    char s[100];

    printf("Introduceti sirul: ");
    scanf("%s", s);

    // apeleaza functia de rezolvare
    int nr = rezolvare(s);

    // afisare rezultat
    printf("%d", nr);

    return 0;
}