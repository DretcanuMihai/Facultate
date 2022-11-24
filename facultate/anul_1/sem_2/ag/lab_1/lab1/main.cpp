#include <iostream>
#include <fstream>

using namespace std;

struct nod{
nod* next=NULL;
unsigned int elem;
};

void adauga_nod(nod* &head,unsigned int elem)
{
    if(head==NULL)
    {
        head=new nod;
        head->next=NULL;
        head->elem=elem;
        return;
    }
    nod* aux;
    aux=head;
    while(aux->next!=NULL)
    {
        aux=aux->next;
    }
    aux->next=new nod;
    aux->next->next=NULL;
    aux->next->elem=elem;
}

int main()
{
    ///de aici facem matricea de adiacenta
    ifstream fin("in.txt");
    ofstream fout("out.txt");
    unsigned int noduri;
    fin>>noduri;
    unsigned int A[noduri+1][noduri+1]; ///matricea de adiacenta;
    unsigned int x,y,i,j;
    for(i=1;i<=noduri;i++)
    {
        for(j=1;j<=noduri;j++)
        {
            A[i][j]=0;
        }
    }
    while(fin>>x>>y)
    {
        A[x][y]=1;
        A[y][x]=1;
    }
    fout<<"Matricea de adiacenta:\n";
    for(i=1;i<=noduri;i++)
    {
        for(j=1;j<=noduri;j++)
        {
            fout<<A[i][j]<<" ";
        }
        fout<<"\n";
    }
    /// de aici facem transformarea matricii de adiacenta in lista de adiacenta;
    nod* lista[noduri+1]; ///lista de adiacenta;
    for(i=1;i<=noduri;i++)
    {
        lista[i]=NULL;
    }
    for(i=1;i<=noduri;i++)
    {
        for(j=i+1;j<=noduri;j++)
        {
            if(A[i][j]==1)
            {
                adauga_nod(lista[i],j);
                adauga_nod(lista[j],i);
            }
        }
    }
    nod* aux;
    fout<<"\nLista de adiacenta:\n";
    for(i=1;i<=noduri;i++)
    {
        fout<<i<<" : ";
        aux=lista[i];
        while(aux!=NULL)
        {
            fout<<aux->elem<<" ";
            aux=aux->next;
        }
        fout<<"\n";
    }
    /// de aici facem transformarea din lista de adiacenta in matricea de incidenta
    unsigned int muchii_I=0,nr_muchie=0; ///I este matricea de incidenta
    for(i=1;i<=noduri;i++)
    {
        aux=lista[i];
        while(aux!=NULL)
        {
            if(aux->elem>i)
                muchii_I++;
            aux=aux->next;
        }
    }
    unsigned int I[noduri+1][muchii_I+1];
    for(i=1;i<=noduri;i++)
    {
        for(j=1;j<=muchii_I;j++)
        {
            I[i][j]=0;
        }
    }
    for(i=1;i<=noduri;i++)
    {
        aux=lista[i];
        while(aux!=NULL)
        {
            j=aux->elem;
            if(j>i)
            {
                nr_muchie++;
                I[i][nr_muchie]=1;
                I[j][nr_muchie]=1;
            }
            aux=aux->next;
        }
    }
    fout<<"\nMatricea de incidenta:\n";
    for(i=1;i<=noduri;i++)
    {
        for(j=1;j<=muchii_I;j++)
        {
            fout<<I[i][j]<<" ";
        }
        fout<<"\n";
    }
    /// de aici facem trecerea din matrice de incidenta in lista de adiacenta
    nod* lista_noua[noduri+1];
    for(i=1;i<=noduri;i++)
    {
        lista_noua[i]=NULL;
    }
    unsigned int nod1,nod2;
    for(i=1;i<=muchii_I;i++)
    {
        nod1=1;
        while(I[nod1][i]==0)
        {
            nod1++;
        }
        nod2=nod1+1;
        while(I[nod2][i]==0)
        {
            nod2++;
        }
        adauga_nod(lista_noua[nod1],nod2);
        adauga_nod(lista_noua[nod2],nod1);
    }
    fout<<"\nLista de adiacenta:\n";
    for(i=1;i<=noduri;i++)
    {
        fout<<i<<" : ";
        aux=lista_noua[i];
        while(aux!=NULL)
        {
            fout<<aux->elem<<" ";
            aux=aux->next;
        }
        fout<<"\n";
    }
    /// de aici facem trecerea din lista de adiacenta in matrice de adiacenta
    unsigned int A_nou[noduri+1][noduri+1]; ///matricea de adiacenta
    for(i=1;i<=noduri;i++)
        for(j=1;j<=noduri;j++)
            A_nou[i][j]=0;
    for(i=1;i<=noduri;i++)
    {
        aux=lista_noua[i];
        while(aux!=NULL)
        {
            A_nou[i][aux->elem]=1;
            aux=aux->next;
        }
    }
    fout<<"\nMatricea de adiacenta:\n";
    for(i=1;i<=noduri;i++)
    {
        for(j=1;j<=noduri;j++)
        {
            fout<<A_nou[i][j]<<" ";
        }
        fout<<"\n";
    }
    /// de aici facem trecerea din matricea de adiacenta in matricea de incidenta
    unsigned int muchii_I_nou=0;
    for(i=1;i<=noduri;i++)
        for(j=i+1;j<=noduri;j++)
            if(A_nou[i][j]==1)
                muchii_I_nou++;
    unsigned int I_nou[noduri+1][muchii_I_nou+1];
    for(i=1;i<=noduri;i++)
        for(j=1;j<=muchii_I_nou;j++)
            I_nou[i][j]=0;
    nr_muchie=0;
    for(i=1;i<=noduri;i++)
        for(j=i+1;j<=noduri;j++)
            if(A[i][j]==1)
            {
                nr_muchie++;
                I_nou[i][nr_muchie]=1;
                I_nou[j][nr_muchie]=1;
            }
    fout<<"\nMatricea de incidenta:\n";
    for(i=1;i<=noduri;i++)
    {
        for(j=1;j<=muchii_I_nou;j++)
        {
            fout<<I_nou[i][j]<<" ";
        }
        fout<<"\n";
    }
    fin.close();
    fout.close();
    return 0;
}
