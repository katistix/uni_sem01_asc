#include <stdio.h>

extern void asmGenSiruri(char *input, char *sirLitereMici, char *sirLitereMari);

int main()
{

    char sir[101];
    char sirMici[101];
    char sirMari[101];
    printf("input: ");
    scanf("%s", sir);

    asmGenSiruri(sir, sirMici, sirMari);

    printf("litere mici: %s\n", sirMici);
    printf("litere mari: %s\n", sirMari);
}