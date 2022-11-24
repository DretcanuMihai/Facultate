#include <iostream>
#include <fstream>

using namespace std;

ifstream fin("graf.txt");

int main()
{
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
    ///aici incepe efectiv rezolvarea problemei
    int** T;
    T=new int*[noduri];
    for(int i=0;i<noduri;i++)
    {
        T[i]=new int[noduri];
        for(int j=0;j<noduri;j++)
        {
            T[i][j]=A[i][j];
            if(i==j)
                T[i][j]=1;
        }
    }
    for(int k=0;k<noduri;k++)
        for(int i=0;i<noduri;i++)
            for(int j=0;j<noduri;j++)
                T[i][j]=T[i][j]|(T[i][k]&T[k][j]);
    for(int i=0;i<noduri;i++)
    {
        for(int j=0;j<noduri;j++)
            cout<<T[i][j]<<" ";
        cout<<"\n";
    }
    for(int i=0;i<noduri;i++)
    {
        delete[] A[i];
        delete[] T[i];
    }
    delete[] A;
    delete[] T;
    return 0;
}
