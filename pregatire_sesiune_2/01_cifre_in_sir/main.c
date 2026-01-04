#include <stdio.h>

// declaram functia externa din ASM
extern int rezolvare(char s[]);
// extern int este_cifra(char c);


int main(){


    // testam functia este_cifra

    // Apelul funcției: C va pune valoarea lui 'ch' pe stivă
    // char ch = '8';
    // if (este_cifra(ch)) {
    //     printf("Este cifra!\n");
    // } else {
    //     printf("NU este cifra.\n");
    // }

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