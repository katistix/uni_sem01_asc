#include <stdio.h>

extern void asmPareImpare(int numbers[], int impareOut[], int impareLen, int pareOut[], int pareLen);

int main()
{
    int numbers[] = {10, 4, 5, 3};
    int impareLen = 0;
    int impare[100];
    int pare[100];
    int pareLen = 0;

    asmPareImpare(numbers, impare, &impareLen, pare, &pareLen);
}