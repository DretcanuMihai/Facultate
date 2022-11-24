bits 32

global _adauga_cuvant

segment data public data use32
    lrez dd 0

segment code public code use32
    _adauga_cuvant:
    ;adauga_cuvant(*sir,*rez,lrez,index)
    ;Functia adauga_cuvant modifica in mod direct sirul rezultat si returneaza lungimea sirului nou
    push ebp
    mov ebp,esp
    pushad
    ;ebp -> vechiul ebp
    ;ebp+4 -> adresa de returnare
    ;ebp+8 -> adresa sir (sirul din care luam cuvantul)
    ;ebp+12 -> adresa sir rezultat
    ;ebp+16 -> valoarea lungimii sirului rezultat
    ;ebp+20 -> index-ul cuvantului (al catelea cuvant trebuie adaugat)
    mov eax,[ebp+16] ;singura valoare c eo salvam in memorie este lungimea sirului rezultat (deoarece este necesara in determinea
    ;lungimii ce va fi returnata)
    mov [lrez],eax
    mov esi,[ebp+8] ;cu esi vom parcurge sirul sir caracter cu caracter
    mov edx,[ebp+20] ;edx tine minte acum al catelea cuvant il cautam - o sa tot scadem cate un 1 pentru fiecare cuvant pe care il parcurgem
    ;cand ajungem la edx=0, inseamna ca sunte la cuvantul cautat
    sub edx,1 ;suntem deja pe primul cuvant, asa ca scadem un 1
    JZ sfarsit_determinare_cuvant
    mov bl,' '
    determinare_cuvant:
        parcurgere:
            lodsb; al = litera; esi=esi+1
            cmp al,bl ; verificam daca al este spatiu
            JNE parcurgere ; daca nu e spatiu, nu am parcus inca tot cuvantul
        dec edx ;odata ce am ajuns la un spatiu, inseamna ca am ajuns la un nou cuvant - din cauza ca am folosit lodsb, esi va fi cu o pozitie
        ;dupa acel spatiu, adica unde incepe cuvantul nostru
        JNZ determinare_cuvant
    sfarsit_determinare_cuvant:
    ;acum ar trebui sa fim cu esi la inceputul cuvantului cautat
    mov edi,[ebp+12]
    add edi,[lrez]
    ;edi este pe pozitia finala a sirului rezultat, deci copierea se va face cum trebuie
    ;esi este pe pozitia de inceput a cuvantului cautat din sirul sir
    scriere_cuvant:
        ;n=3
        lodsb; al=caracter din cuvant
        cmp al,' '                   ;|toata aceasta secventa verifica daca suntem deja la sfarsitul cuvantului, caz in care ne oprim
        JE sfarsit_scriere_cuvant    ;|
        cmp al,0                     ;|
        JE sfarsit_scriere_cuvant    ;|
        inc dword[lrez]
        stosb; daca este caracter diferit de spatiu si end, il punem in rezultat
        ;altfel, inseamna ca am terminat de verificat cuvantul
        jmp scriere_cuvant
    sfarsit_scriere_cuvant:
    mov al,' '  ;adaugam un spatiu la sfarsitul sirului rezultat 
    stosb
    inc dword[lrez]
    popad
    mov eax,[lrez]
    mov esp,ebp
    pop ebp
    ret
        