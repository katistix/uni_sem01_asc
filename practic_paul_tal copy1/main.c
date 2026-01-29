/*
Cerința
Se citește de la tastatură un număr natural n, urmat de n șiruri de numere întregi. Pentru fiecare șir se
dorește afișarea numărului care conține cele mai multe cifre impare, iar în caz de egalitate se va
afișa cel mai mare dintre ele. Nu se cunoaște numărul de elemente din fiecare șir, de aceea se
recomandă citirea acestora ca șiruri de caractere, urmat apoi de extragerea fiecărui număr. Dacă
șirul nu conține niciun număr cu cifre impare, se va afișa mesajul nu există.
Indicații
Fișierul main va fi scris în limbajul C. El poate conține doar funcțiile de citire, respectiv de afișare, și
va efectua apeluri către subprogramele care vor rezolva problema, acestea din urmă fiind scrise în
limbajul de asamblare studiat la laborator.
Primul subprogram va prelucra câte un șir și va returna numărul căutat din șirul curent. Cel de al
doilea subprogram va primi că parametru un număr și va returna numărul de cifre impare.
 */

#include <stdio.h>

extern int asmModul1(char *sir);
extern int asmModul2(int numar);

int main()
{

    int n;

    // scanf("%d", &n);
    // int cifre_impare = asmModul2(n);
    // printf("Cifre impare: %d\n", cifre_impare);

    printf("numar siruri: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++)
    {
        // citim fiecare sir ca text si il pasam la primul modul
        char sir_curent[300];
        printf("sirul %d: ", i + 1);
        scanf(" %[^\n]s", sir_curent); // citeste un caracter pana la '\n'

        int rezultat = asmModul1(sir_curent);

        if (rezultat == -1)
        {
            printf("nu exista\n");
        }
        else
        {
            printf("raspuns sir %d: %d\n", i + 1, rezultat);
        }
    }
}