#include <iostream>
#include <fstream>
#include <map>
#include <string>
#include <queue>


using namespace std;

class Nod{
public:
    int frecventa;
    char caracter;
    Nod *st,*dr;
};

class compNodP{
    //bool reverse;
public:
    //compNodP(const bool& reverse0=false):reverse{reverse0}{}
    bool operator()(const Nod* lhs,const Nod* rhs) const{
    bool ret=lhs->frecventa>rhs->frecventa;
    if(lhs->frecventa==rhs->frecventa)
        ret=lhs->caracter>rhs->caracter;
    return ret;

    }

};

Nod* codare_Huffman(map<char,int> dict){
    priority_queue<Nod*,vector<Nod*>,compNodP> arb;
    for(auto elem:dict){
        Nod* n=new Nod;
        n->caracter=elem.first;
        n->frecventa=elem.second;
        n->st=nullptr;
        n->dr=nullptr;
        arb.push(n);
    }
    for(int i=0;i<dict.size()-1;i++){
        Nod* z=new Nod;
        z->st=arb.top();
        arb.pop();
        z->dr=arb.top();
        arb.pop();
        z->frecventa=z->st->frecventa+z->dr->frecventa;
        z->caracter=min(z->st->caracter,z->dr->caracter);
        arb.push(z);
    }
    return arb.top();
}

void decodare_Huffman(string cod,Nod* arb, ofstream& fout){
    Nod* aux=arb;
    for(int i=0;i<cod.length();i++){
        if(cod[i]=='0')
            aux=aux->st;
        else
            aux=aux->dr;
        if(aux->st==nullptr && aux->dr==nullptr){
            fout<<aux->caracter;
            aux=arb;
        }
    }

}

int main(int argc, char** argv)
{
    ifstream fin(argv[1]);
    ofstream fout(argv[2]);

    int N;
    map<char,int> dict;
    fin>>N;
    string linie;
    getline(fin,linie);
    for(int i=0;i<N;i++){
        char c;
        int x;
        getline(fin,linie);
        c=linie[0];
        linie=linie.erase(0,2);
        x=stoi(linie);
        dict[c]=x;
    }
    string cod;
    fin>>cod;

    Nod* rez=codare_Huffman(dict);

    decodare_Huffman(cod,rez,fout);

    fin.close();
    fout.close();
    return 0;
}
