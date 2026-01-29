// a+b-c

#include <stdio.h>

extern int sum(int a, int b, int c);

int main()
{
    int a, b, c;
    printf("Introduceti a: ");
    scanf("%d", &a);
    printf("Introduceti b: ");
    scanf("%d", &b);
    printf("Introduceti c: ");
    scanf("%d", &c);

    int suma = sum(a, b, c);

    printf("%d", suma);
}