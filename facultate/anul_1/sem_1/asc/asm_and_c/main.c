#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Se citesc de la tastatura un numar natural n si n propozitii care contin cel putin n cuvinte (nu se fac validari).
Sa se afiseze sirul format prin concatenarea cuvintelor de pe pozitia i din propozitia i, i=1,n (separate prin spatiu).
Exemplu: Se da: n=5
Ana are mere si pere.
Pe birou se gaseste un cos cu fructe.
Cartea mea preferata se afla pe masa.
Afara a nins si este destul de frig.
Maine o sa merg la cumparaturi.
Se va afisa:
Ana birou preferata si la */

unsigned int adauga_cuvant(char sir[],char rez[],unsigned int lrez, unsigned int index);

/* Functia adauga_cuvant modifica in mod direct sirul rezultat si returneaza lungimea sirului nou */

int main()
{
    unsigned int n,i,lrez=0, lsir;
    printf("Introduceti numarul de siruri:");
    scanf("%u",&n);
    char sir[101],rez[101]="";
    fgets(sir,101,stdin); ///fgets functioneaza pe linii, din cauza lui scanf vom fi automat pe a doua linie, asa ca trebuie sa sarim peste prima?
    for(i=1;i<=n;i++)
    {
        printf("Introduceti sirul:");
        fgets(sir,101,stdin);
        lsir=strlen(sir);
        sir[lsir-1]=' ';
        sir[lsir]=' ';
        sir[lsir+1]='\0';
        lrez=adauga_cuvant(sir,rez,lrez,i);
    }
    rez[lrez-1]='\0';
    printf("Sirul cautat este:%s",&rez);
    return 0;
}
