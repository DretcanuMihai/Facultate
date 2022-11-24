#include <iostream>
#include <fstream>
#include <list>

using namespace std;

class nd{//nd, varul mai stupid al lui Nod
public:
    int val;
    nd* next;
};

class lista{ //splice are timp liniar. >:(
public:
    nd* head;
    nd* tail;
};

class muchie{
public:
    muchie* prev;
    muchie* next;
    muchie* rev;
    int nod;
    muchie(){
        this->prev=nullptr;
        this->next=nullptr;
        this->rev=nullptr;
        this->nod=-1;
    }
    ~muchie(){
        this->prev=nullptr;
        this->next=nullptr;
        this->rev=nullptr;
        this->nod=-1;
    }
};

class Nod{
public:
    muchie* L_muchii;
    void add(muchie* m){
        m->next=L_muchii;
        m->prev=nullptr;
        if(L_muchii!=nullptr)
            L_muchii->prev=m;
        this->L_muchii=m;
    }
    void del(muchie* m){
        if(m==L_muchii){
            L_muchii=L_muchii->next;
            if(L_muchii!=nullptr)
                L_muchii->prev=nullptr;
        }
        else{
            muchie* ant=m->prev;
            muchie* urm=m->next;
            ant->next=urm;
            if(urm!=nullptr)
                urm->prev=ant;
        }
        delete m;
    }
    ~Nod(){
        muchie* curent=this->L_muchii;
        while(curent!=nullptr){
            muchie* urm=curent->next;
            delete curent;
            curent->next;
        }
    }
};

lista Hierholzer(Nod* graf,int nod){
    list<int> rez;
    rez.push_back(nod);
    if(graf[nod].L_muchii==nullptr){
        nd* el=new nd;
        el->next=nullptr;
        el->val=nod;
        lista r;
        r.head=el;
        r.tail=el;
        return r;
    }
    int nod_c=nod;
    do{
        int y;
        muchie* m=graf[nod_c].L_muchii;
        muchie* mr=m->rev;
        y=m->nod;
        graf[nod_c].del(m);
        graf[y].del(mr);
        nod_c=y;
        rez.push_back(y);
    }while(nod_c!=nod);
    lista rez_final;
    bool ok=false;
    int contor=0;
    for(auto elem:rez){
        contor++;
        if(ok==false){
            rez_final=Hierholzer(graf,elem);
            ok=true;
        }
        else if(contor==rez.size()){
            rez_final.tail->next=new nd;
            rez_final.tail->next->val=elem;
            rez_final.tail->next->next=nullptr;
            rez_final.tail=rez_final.tail->next;
            break;
        }
        else{
            lista intermediar=Hierholzer(graf,elem);
            rez_final.tail->next=intermediar.head;
            rez_final.tail=intermediar.tail;
        }
    }
    return rez_final;
}

int main(int argc, char** argv)
{
    ifstream fin(argv[1]);
    ofstream fout(argv[2]);
    int V,E;
    fin>>V>>E;
    Nod* graf=new Nod[V];
    for(int i=0;i<V;i++){
        graf[i].L_muchii=nullptr;
    }
    for(int i=0;i<E;i++){
        int x,y;
        fin>>x>>y;
        muchie* m=new muchie;
        m->nod=y;
        muchie* mr=new muchie;
        mr->nod=x;
        m->rev=mr;
        mr->rev=m;
        graf[x].add(m);
        graf[y].add(mr);
    }
    lista CE=Hierholzer(graf,0);
    while(CE.head!=CE.tail){
        nd* aux=CE.head;
        CE.head=CE.head->next;
        fout<<aux->val<<" ";
        delete aux;
    }
    fin.close();
    fout.close();
    delete[] graf;
    return 0;
}
