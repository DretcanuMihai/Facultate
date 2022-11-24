#include <iostream>
#include <fstream>
#define INFINIT 100000
#include <queue>

using namespace std;

void initializare(int noduri, int* culoare,int* distanta, int* parinte)
{
    for(int i=0;i<noduri;i++)
    {
        culoare[i]=0;
        distanta[i]=INFINIT;
        parinte[i]=0;
    }
}

int* BFS(int** A, int noduri, int sursa)
{
    int* culoare=new int[noduri]; ///0 = alb; 1 = gri; 2= negru
    int* distanta=new int[noduri];
    int* parinte=new int[noduri];
    initializare(noduri,culoare,distanta,parinte);
    distanta[sursa-1]=0;
    culoare[sursa-1]=1;
    queue<int> q;
    q.push(sursa);
    while(!q.empty())
    {
        int nod=q.front();
        q.pop();
        for(int i=1;i<=noduri;i++)
            if(A[nod-1][i-1]==1 && culoare[i-1]==0)
            {
                q.push(i);
                culoare[i-1]=1;
                distanta[i-1]=distanta[nod-1]+1;
                parinte[i-1]=nod;
            }
        culoare[nod-1]=2;
    }
    delete[] culoare;
    delete[] parinte;
    return distanta;
}

int main()
{
    ifstream fin("graf.txt");
    int noduri;
    fin>>noduri;
    int** A;
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
    while(true)
    {
        int sursa;
        cout<<"Introduceti nodul sursa:";
        cin>>sursa;
        if(sursa==0)
            break;
        int* rez=BFS(A,noduri,sursa);
        for(int i=1;i<=noduri;i++)
        {
            cout<<"Nodul "<<i<<": ";
            if(rez[i-1]==INFINIT)
                cout<<"Nu a fost parcurs";
            else
                cout<<rez[i-1];
            cout<<"\n";
        }
        delete[] rez;
    }
    for(int i=0;i<noduri;i++)
        delete[] A[i];
    delete[] A;
    return 0;
}
