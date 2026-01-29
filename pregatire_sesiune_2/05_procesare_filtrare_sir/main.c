#include <stdio.h>

int deplasament = 3;

void asmProcesare(int *sir);

int citesteFactor()
{
    printf("INTRODU FACTORUL: ");
    int factor;
    scanf("%d", &factor);
    return factor;
}

int main()
{
    // citeste sirul
    int sir[10];
    for (int i = 0; i < 10; i++)
    {
        printf("%d: ", i);
        scanf("%d", &sir[i]);
    }

    asmProcesare(sir);

    printf("RESULT\n\n");

    for (int i = 0; i < 10; i++)
    {
        printf("%d ", sir[i]);
    }
}