#include <iostream>
#include <fstream>
#include <queue>
#define INFINIT 1000000


using namespace std;

ifstream fin("graf.txt");

void initializare(int* pi, int* l,int noduri)
{
    for(int i=0;i<noduri;i++)
    {
        pi[i]=0;
        l[i]=INFINIT;
    }
}

int* descifrare(int* drum,int* parinte,int inceput)
{
    int k=drum[inceput-1];
    int* drum_de_returnat=new int[k+1];
    drum_de_returnat[k]=inceput;
    while(k!=0)
    {
        k--;
        drum_de_returnat[k]=parinte[drum_de_returnat[k+1]-1];
    }
    return drum_de_returnat;
}

int** Moore(int** A, int noduri, int s)
{
    int* parinte=new int[noduri];
    int* drum=new int[noduri];
    initializare(parinte,drum,noduri);
    drum[s-1]=0;
    queue<int> q;
    q.push(s);
    while(!q.empty())
    {
        int x;
        x=q.front();
        q.pop();
        for(int i=1;i<=noduri;i++)
            if(A[x-1][i-1]==1)
            {
                if(drum[i-1]==INFINIT)
                {
                    parinte[i-1]=x;
                    drum[i-1]=drum[x-1]+1;
                    q.push(i);
                }
            }
    }
    int** v=new int*[2];
    v[0]=parinte;
    v[1]=drum;
    return v;
}

int main()
{
    int noduri;
    int** A;
    fin>>noduri;
    A=new int*[noduri];
    for(int i=0;i<noduri;i++)
    {
        A[i]=new int[noduri];
        for(int j=0;j<noduri;j++)
            A[i][j]=0;
    }
    int x,y;
    while(fin>>x>>y)
    {
        A[x-1][y-1]=1;
    }
    while(true)
    {
        int s,d;
        cout<<"Inroduceti nodul sursa:";
        cin>>s;
        if(s==0)
            break;
        int** v=Moore(A,noduri,s);
        for(int d=1;d<=noduri;d++)
        {
            cout<<"Nodul "<<d<<": ";
            if(v[1][d-1]==INFINIT)
            {
                cout<<"Nu exista drum pana la acest nod\n\n";
            }
            else
            {
                cout<<"Cel mai scurt drum pana la acest nod este de "<<v[1][d-1]<<", iar unul dintre drumurile valabile este:\n";
                int* rez=descifrare(v[1],v[0],d);
                for(int i=0;i<=v[1][d-1];i++)
                    cout<<rez[i]<<" ";
                delete[] rez;
                cout<<"\n";
            }
            cout<<"\n";
        }
        delete[] v[0];
        delete[] v[1];
        delete[] v;
    }
    for(int j=0;j<noduri;j++)
        delete[] A[j];
    delete[] A;
    return 0;
}
