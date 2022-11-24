#include <iostream>
#include <fstream>
#define infinit 100000

using namespace std;

ifstream fin("in.txt");
ofstream fout("out.txt");

void afiseaza(int val)
{
    if(val==infinit)
        fout<<"inf ";
    else if(val<10)
        fout<<"  "<<val<<" ";
    else if(val<100)
        fout<<" "<<val<<" ";
    else
        fout<<val<<" ";
}

int main()
{
    unsigned int noduri;
    fin>>noduri;
    unsigned int A[noduri+1][noduri+1];
    for(unsigned int i=0;i<=noduri;i++)
        for(unsigned int j=0;j<=noduri;j++)
            A[i][j]=0;
    unsigned int x,y;
    while(fin>>x>>y)
    {
        A[x][y]=1;
        A[y][x]=1;
    }
    ///am citit graful
    ///puteam face determinarea nodurilor izolate si partial o data cu citirea, dar am zis ca-i mai frumos sa le fac pe rand
    unsigned int ok_moment;
    unsigned int noduri_izolate[noduri],nr_noduri_izolate=0; ///noduri izolate  il indexam de la 0
    for(unsigned int i=1;i<=noduri;i++)
    {
        ok_moment=1;
        for(unsigned int j=1;j<=noduri;j++)
            if(A[i][j]==1)
                ok_moment=0;
        if(ok_moment==1)
        {
            noduri_izolate[nr_noduri_izolate]=i;
            nr_noduri_izolate++;
        }
    }
    fout<<"a) Noduri izolate: ";
    if(nr_noduri_izolate==0)
        fout<<"-\n";
    else
        for(unsigned int i=0;i<nr_noduri_izolate;i++)
            fout<<noduri_izolate[i]<<" ";
    fout<<"\n";
    for(unsigned int i=1;i<=noduri;i++)
        for(unsigned int j=1;j<=noduri;j++)
            A[i][0]+=A[i][j];
    unsigned int ok_regular=1;
    for(unsigned int i=1;i<noduri;i++)
        if(A[i][0]!=A[i+1][0])
            ok_regular=0;
    fout<<"\nb)Graful ";
    if(ok_regular==1)
        fout<<"este regular\n";
    else
        fout<<"nu este regular\n";
    unsigned int D[noduri+1][noduri+1];
    for(unsigned int i=1;i<=noduri;i++)
        for(unsigned int j=1;j<=noduri;j++)
            if(i==j)
                D[i][j]=0;
            else if(A[i][j]==0)
                D[i][j]=infinit;
            else
                D[i][j]=1;
    for(unsigned int k=1;k<=noduri;k++)
        for(unsigned int i=1;i<=noduri;i++)
            for(unsigned int j=1;j<=noduri;j++)
                if(D[i][j]>D[i][k]+D[k][j])
                    D[i][j]=D[i][k]+D[k][j];
    fout<<"\nc)Matricea distantelor:\n\n";
    for(unsigned int i=1;i<=noduri;i++)
    {
        for(unsigned int j=1;j<=noduri;j++)
            afiseaza(D[i][j]);
        fout<<"\n";
    }
    ///pentru conexitate vom face o parcurgere
    unsigned int parcurs[noduri+1],stiva[noduri+1],stiva_len=1,parcurse=0,nod_actual;
    for(unsigned int i=1;i<=noduri;i++)
        parcurs[i]=0;
    if(noduri!=0)
    {
        parcurse=1;
        parcurs[1]=1;
        stiva[0]=1;
        while(stiva_len!=0)
        {
            nod_actual=stiva[--stiva_len];
            for(unsigned int i=1;i<=noduri;i++)
                if(parcurs[i]==0 && A[nod_actual][i]==1)
                {
                    parcurs[i]=1;
                    stiva[stiva_len++]=i;
                    parcurse++;
                }
        }
    }
    if(parcurse==noduri)
        fout<<"\nd)Graful este conex\n";
    else
        fout<<"\nd)Graful nu este conex\n";
    fin.close();
    fout.close();
    return 0;
}
