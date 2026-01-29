#include <stdio.h>

int masca = 31;

extern int asmAnaliza(int *sir, int lungime);

void logValid(int val)
{
    printf("Element valid gasit: %d\n", val);
}

int main()
{
    int sir[8];
    printf("Introducere sir: \n");
    for (int i = 0; i < 8; i++)
    {
        printf("%d: ", i + 1);
        scanf("%d", &sir[i]);
    }

    int ok = asmAnaliza(sir, 8);
    if (ok)
    {
        printf("Suma este multiplu de 5");
    }
    else
    {
        printf("Suma nu este multiplu de 5");
    }
}