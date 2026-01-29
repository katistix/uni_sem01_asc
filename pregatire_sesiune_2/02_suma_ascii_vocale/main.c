// calculează suma valorilor ASCII
// ale tuturor vocalelor dintr-un șir citit de la tastatura

#include <stdio.h>

extern int suma_ascii(char sir[]);
// extern int e_vocala(char c);

int main()
{
    // citeste sirul
    char sir[100];
    printf("Introduceti sirul: ");
    scanf("%s", sir);

    int count = suma_ascii(sir);

    printf("Suma in ASCII a vocalelor este: %d", count);

    return 0;
}