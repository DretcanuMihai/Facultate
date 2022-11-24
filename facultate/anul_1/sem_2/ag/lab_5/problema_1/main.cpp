#include <iostream>
#include <fstream>
#include <vector>
#include <queue>
#define INF INT_MAX

using namespace std;

class muchie{
public:
    int x,y,c,f; //clasa ce reprezinta muchie x->sursa, y->destinatie, c->cost, f->flow;
    muchie* rev;
    muchie(int x0,int y0,int c0, int f0){
        this->x=x0;
        this->y=y0;
        this->c=c0;
        this->f=f0;
        this->rev=nullptr;
    }
};

class nod{
public:
    vector<muchie*> m_ad; //muchii adiacente
    ~nod(){
        for(auto p:m_ad){
            delete p;
        }
    }
};

int Edmonds_Karps(nod* graf,int V,int surSa, int destinaTie)
{
    int max_f=0;
    bool ok;
    do{
        ok=false;
        queue<int> q;
        q.push(surSa);
        muchie** prec_way=new muchie*[V];
        for(int i=0;i<V;i++)
            prec_way[i]=nullptr;
        while(!q.empty()){
            int curent=q.front();
            q.pop();
            for(auto mp:graf[curent].m_ad){
                if(prec_way[mp->y]==nullptr && mp->y!=surSa && mp->f<mp->c){
                        prec_way[mp->y]=mp;
                        q.push(mp->y);
                }
            }
        }
        if(prec_way[destinaTie]!=nullptr){
            ok=true;
            int flow=INF;
            auto curent=prec_way[destinaTie];
            while(curent!=nullptr){
                int val=curent->c-curent->f;
                if(flow>val)
                    flow=val;
                curent=prec_way[curent->x];
            }
            curent=prec_way[destinaTie];
            while(curent!=nullptr){
                curent->f+=flow;
                curent->rev->f-=flow;
                curent=prec_way[curent->x];
            }
            max_f+=flow;
        }
        delete[] prec_way;

    }while(ok);
    return max_f;
}

int main(int argc, char** argv)
{
    ifstream fin(argv[1]);
    ofstream fout(argv[2]);
    int V,E;
    fin>>V>>E;
    nod* graf=new nod[V];
    for(int i=0;i<E;i++){
        int x,y,w;
        fin>>x>>y>>w;
        muchie *m, *rm;
        m=new muchie(x,y,w,0);
        rm=new muchie(y,x,w,w);
        m->rev=rm;
        rm->rev=m;
        graf[x].m_ad.push_back(m);
        graf[y].m_ad.push_back(rm);
    }
    fout<<Edmonds_Karps(graf,V,0,V-1);
    delete[] graf;
    fin.close();
    fout.close();
    return 0;
}
