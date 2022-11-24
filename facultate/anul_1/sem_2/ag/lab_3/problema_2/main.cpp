#include <iostream>
#include <fstream>
#include <list>
#include <limits>
#include <queue>

#define INF INT_MAX/2

using namespace std;

typedef struct {
    int destinatie;
    int pondere;
}muchie;

typedef struct{
    list<muchie> muchii_adiacente;
}nod;


int* Dijkstra(nod* graf, int noduri, int sursa){
    int* rez=new int[noduri];
    for(int i=0;i<noduri;i++)
        rez[i]=INF;

    rez[sursa]=0;
    priority_queue<pair<int,int>> q;
    q.push(make_pair(0,sursa));
    while(!q.empty()){
        int u=q.top().second;
        q.pop();
        for(auto& elem:graf[u].muchii_adiacente)
            if(rez[u]+elem.pondere<rez[elem.destinatie]){
                rez[elem.destinatie]=rez[u]+elem.pondere;
                q.push(make_pair(-rez[elem.destinatie],elem.destinatie));
            }
    }
    return rez;
}

bool Bellman_Ford(nod* graf, int noduri,int sursa, int* drum){
    for(int i=0;i<noduri;i++)
        drum[i]=INF;
    drum[sursa]=0;
    for(int k=0;k<noduri-1;k++)
        for(int j=0;j<noduri;j++)
            for(auto m:graf[j].muchii_adiacente)///muchie de la j la m.destinatie
                if(drum[j]+m.pondere<drum[m.destinatie])
                    drum[m.destinatie]=drum[j]+m.pondere;
    for(int j=0;j<noduri;j++)
        for(auto m:graf[j].muchii_adiacente) ///muchie de la j la m.destinatie
            if(drum[j]+m.pondere<drum[m.destinatie])
                return false;
    return true;
}

int main(int argc,char* argv[])
{
    std::ifstream fin(argv[1]);
    std::ofstream fout(argv[2]);
    int noduri,muchii;
    nod* graf;
    fin>>noduri>>muchii;
    graf=new nod[noduri];
    for(int i=0;i<muchii;i++){
        int x,y,w;
        fin>>x>>y>>w;
        muchie m;
        m.destinatie=y;
        m.pondere=w;
        graf[x].muchii_adiacente.push_back(m);
    }
    nod* graf_aux=new nod[noduri+1];
    for(int i=0;i<noduri;i++){
        graf_aux[i]=graf[i];
    }
    for(int i=0;i<noduri;i++){
        muchie m;
        m.destinatie=i;
        m.pondere=0;
        graf_aux[noduri].muchii_adiacente.push_back(m);
    }
    int* drumuri=new int[noduri+1];
    if(Bellman_Ford(graf_aux,noduri+1,noduri,drumuri)==false){
        delete[] graf_aux;
        delete[] graf;
        delete[] drumuri;
        fout<<-1;
        fin.close();
        fout.close();
        return 0;
    }
    for(int i=0;i<noduri;i++){
        for(auto& m: graf[i].muchii_adiacente){
            m.pondere+=drumuri[i]-drumuri[m.destinatie];
            fout<<i<<" "<<m.destinatie<<" "<<m.pondere<<"\n";
        }
    }
    for(int i=0;i<noduri;i++){
        int* rez=Dijkstra(graf_aux,noduri,i);
        for(int j=0;j<noduri;j++)
            if(rez[j]==INF)
                fout<<"INF"<<" ";
            else
                fout<<rez[j]<<" ";
        fout<<"\n";
        delete[] rez;
    }
    delete[] graf_aux;
    delete[] graf;
    delete[] drumuri;
    fin.close();
    fout.close();
    return 0;
}
