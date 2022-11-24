#include <iostream>
#include <fstream>
#include <list>

using namespace std;


class intNod{
public:
    int val;
    intNod* next;
    intNod* prev;

};

class muchie{
public:
    int x,y; //sursa, destinatie
    int c; //capacitate
    int f; //flow
    muchie* rev; //muchia inversa corespondenta
    muchie(int x0,int y0, int c0, int f0){
        this->x=x0;
        this->y=y0;
        this->c=c0;
        this->f=f0;
    }

};



class Nod{
public:
    int inaltime;
    int exces;
    list<muchie*> m_ad;
    list<muchie*>::iterator curent;
    ~Nod(){
        for(auto m:m_ad){
            delete m;
        }
    }

};

void initializare_preflux(Nod* graf, int V, int sursa){
    graf[sursa].inaltime=V;
    for(muchie* m:graf[sursa].m_ad){
        m->f=m->c;
        m->rev->f=0;
        graf[m->y].exces+=m->c;
        graf[sursa].exces-=m->c;
    }
}

void pompare(Nod* graf,muchie* m){
    int to_send=m->c-m->f;
    if(to_send>graf[m->x].exces)
        to_send=graf[m->x].exces;
    graf[m->x].exces-=to_send;
    graf[m->y].exces+=to_send;
    m->f+=to_send;
    m->rev->f-=to_send;
}

void inalta(Nod* graf,int nod){
    int val=INT_MAX;
    for(muchie* elem:graf[nod].m_ad)
        if(graf[elem->y].inaltime>=graf[elem->x].inaltime && graf[elem->y].inaltime<val)
            val=graf[elem->y].inaltime;
    graf[nod].inaltime=1+val;
}

void descarca(Nod* graf, int nod){
    while(graf[nod].exces>0){
        muchie* m=(*graf[nod].curent);
        if(graf[nod].curent==graf[nod].m_ad.end()){
            inalta(graf,nod);
            graf[nod].curent=graf[nod].m_ad.begin();
        }
        else if(m->c!=m->f && graf[m->x].inaltime==graf[m->y].inaltime+1)
            pompare(graf,m);
        else
            ++graf[nod].curent;
    }

}

int pompare_topologica(Nod* graf, int V, int sursa, int destinatie){
    initializare_preflux(graf,V,sursa);
    intNod* l=nullptr;
    for(int i=V-1;i>=0;i--){
        if(i!=sursa && i!=destinatie){
            intNod* nou=new intNod;
            nou->next=l;
            nou->prev=nullptr;
            nou->val=i;
            if(l!=nullptr)
                l->prev=nou;
            l=nou;
            graf[i].curent=graf[i].m_ad.begin();
        }
    }
    intNod* aux=l;
    while(aux!=nullptr){
        int h_vechi=graf[aux->val].inaltime;
        descarca(graf,aux->val);
        if(h_vechi<graf[aux->val].inaltime && aux!=l){
            intNod* ant=aux->prev;
            intNod* urm=aux->next;
            if(ant!=nullptr)
                ant->next=urm;
            if(urm!=nullptr)
                urm->prev=ant;
            aux->prev=nullptr;
            aux->next=l;
            if(l!=nullptr)
                l->prev=aux;
            l=aux;
        }
        aux=aux->next;
    }
    while(l!=nullptr){
        aux=l->next;
        delete l;
        l=aux;
    }
    return graf[destinatie].exces;
}

int main(int argc, char** argv)
{
    ifstream fin(argv[1]);
    ofstream fout(argv[2]);
    int V,E;
    fin>>V>>E;
    Nod* graf=new Nod[V];
    for(int i=0;i<V;i++){
        graf[i].inaltime=0;
        graf[i].exces=0;
    }
    for(int i=0;i<E;i++){
        int x,y,w;
        fin>>x>>y>>w;
        muchie* m=new muchie(x,y,w,0);
        muchie* mr=new muchie(y,x,w,w);
        m->rev=mr;
        mr->rev=m;
        graf[x].m_ad.push_back(m);
        graf[y].m_ad.push_back(mr);
    }
    fout<<pompare_topologica(graf,V,0,V-1);
    fin.close();
    fout.close();
    delete[] graf;
    return 0;
}
