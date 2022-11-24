#include <iostream>
#include <fstream>
#include <list>
#include <queue>
#include <tuple>
#include <vector>

using namespace std;

class Nod{
public:
    list<pair<int,int>> muchii_a;
};

class comp{
public:
    bool operator()(tuple<int,int,int> lhs,tuple<int,int,int>rhs){

        return get<0>(lhs)>get<0>(rhs);

    }

};

void mypush_back(list<pair<int,int>>& l,pair<int,int> val){

    auto it=l.begin();
    while(it!=l.end() && val.first>=(*it).first)
        ++it;
    l.insert(it,val);
}

Nod* Prim(Nod* graf,int noduri,int& costf){

    priority_queue<tuple<int,int,int>,vector<tuple<int,int,int>>,comp> q;
    for(auto muchie : graf[0].muchii_a)
        q.push(make_tuple(muchie.second,0,muchie.first));
    Nod* rez=new Nod[noduri];
    int* parcurs=new int[noduri];
    for(int i=0;i<noduri;i++)
        parcurs[i]=0;
    int nr=0;
    int cost=0;
    while(nr<noduri-1){
        auto m=q.top();
        q.pop();
        int minx, maxx;
        int c;
        minx=min(get<1>(m),get<2>(m));
        maxx=max(get<1>(m),get<2>(m));
        c=get<0>(m);
        if(parcurs[minx]==0 || parcurs[maxx]==0){
            nr++;
            cost+=c;
            if(parcurs[minx]==0)
                for(auto muchie:graf[minx].muchii_a){
                        q.push(make_tuple(muchie.second,minx,muchie.first));
                }
            if(parcurs[maxx]==0)
                for(auto muchie:graf[maxx].muchii_a){
                        q.push(make_tuple(muchie.second,maxx,muchie.first));
                }
            parcurs[minx]=1;
            parcurs[maxx]=1;
            mypush_back(rez[minx].muchii_a,make_pair(maxx,c));
        }
    }
    costf=cost;
    return rez;

}

int main(int argc, char** argv)
{
    ifstream fin(argv[1]);
    ofstream fout(argv[2]);

    int V,E;
    fin>>V>>E;
    Nod* graf=new Nod[V];
    for(int i=0;i<E;i++){
        int x,y,w;
        fin>>x>>y>>w;
        graf[x].muchii_a.push_back(make_pair(y,w));
        graf[y].muchii_a.push_back(make_pair(x,w));
    }
    int costf;
    Nod* graf_rez=Prim(graf,V,costf);
    fout<<costf<<"\n"<<V-1<<"\n";
    for(int i=0;i<V;i++)
        for(auto muchie:graf_rez[i].muchii_a)
            fout<<i<<" "<<muchie.first<<"\n";


    delete[] graf;
    delete[] graf_rez;
    fin.close();
    fout.close();
    return 0;
}
