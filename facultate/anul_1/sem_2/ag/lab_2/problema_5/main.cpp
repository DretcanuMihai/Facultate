#include <iostream>
#include <fstream>

using namespace std;

void initializare(int* c, int* p,int noduri)
{
    for(int i=0;i<noduri;i++)
    {
        c[i]=0;
        p[i]=0;
    }
}

void DFS_Visit(int** A, int noduri,int u, int* culoare, int* parinte, int* descoperire, int* finalizare,int&time)
{
    cout<<u<<" ";
    culoare[u-1]=1;
    time++;
    descoperire[u-1]=time;
    for(int v=1;v<=noduri;v++)
        if(A[u-1][v-1]==1 && culoare[v-1]==0)
        {
            parinte[v-1]=u;
            DFS_Visit(A,noduri,v,culoare,parinte,descoperire,finalizare,time);
        }
    culoare[u-1]=2;
    time++;
    finalizare[u-1]=time;
}

void DFS(int** A,int noduri)
{
    int* culoare=new int[noduri]; ///0=alb,1=gri,2=negru
    int* parinte=new int[noduri];
    int* descoperire=new int[noduri];
    int* finalizare=new int[noduri];
    initializare(culoare,parinte,noduri);
    int time=0;
    int nr=0;
    for(int i=1;i<=noduri;i++)
        if(culoare[i-1]==0)
        {
            nr++;
            cout<<"Arborele "<<nr<<": ";
            DFS_Visit(A,noduri,i,culoare,parinte,descoperire,finalizare,time);
            cout<<"\n";
        }
}

int main()
{
    ifstream fin("graf.txt");
    int noduri;
    int** A;
    fin>>noduri;
    A=new int*[noduri];
    for(int i=0;i<noduri;i++)
        A[i]=new int[noduri];
    for(int i=0;i<noduri;i++)
        for(int j=0;j<noduri;j++)
            A[i][j]=0;
    int x,y;
    while(fin>>x>>y)
    {
        A[x-1][y-1]=1;
    }
    DFS(A,noduri);
    for(int i=0;i<noduri;i++)
        delete[] A[i];
    delete[] A;
    return 0;
}
