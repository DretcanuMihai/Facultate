#include <iostream>
#include <fstream>
#include <list>
//#include <vector>
#include <algorithm>
#include <unordered_map>
//#include <set>
using namespace std;

class Nod{
public:
    int valoare;
    list<int> n_adiacente;
    //vector<int> culori_adiacente;
    unordered_map<int,int> culori_adiacente;
    int grad;
    int grad_saturare;
    int culoare;
};

int colorare_graf(Nod* graf, int N){
    int* culori=new int[N];
    list<int> noduri_necolorate;
    for(int i=0;i<N;i++){
        graf[i].culoare=-1;
        graf[i].valoare=i;
        graf[i].grad=graf[i].n_adiacente.size();
        graf[i].grad_saturare=0;
        culori[i]=-1;
        noduri_necolorate.push_back(i);
    }
    int max_color=-1;
    for(int i=0;i<N;i++){
        list<int>::iterator de_sters;
        int curent;
        int max_curent=-1;
        int max_saturare=-1;
        for(list<int>::iterator it=noduri_necolorate.begin();it!=noduri_necolorate.end();++it){
            int elem=*it;
            if(graf[elem].grad_saturare>max_saturare||(graf[elem].grad_saturare>max_saturare&&graf[elem].grad>max_curent)){
                curent=graf[elem].valoare;
                max_curent=graf[elem].grad;
                max_saturare=graf[elem].grad_saturare;
                de_sters=it;
            }
        }
        noduri_necolorate.erase(de_sters);
        for(int adiacent:graf[curent].n_adiacente){
            int col=graf[adiacent].culoare;
            if(col==-1){
                graf[adiacent].grad--;
            }
            else{
                culori[col]=i;
            }
        }
        int culoare_curenta=0;
        while(culori[culoare_curenta]==i)
            culoare_curenta++;
        if(culoare_curenta>max_color)
            max_color=culoare_curenta;
        for(int adiacent:graf[curent].n_adiacente){
            int col=graf[adiacent].culoare;
            if(col==-1){
                //for(int j=graf[adiacent].culori_adiacente.size();j<culoare_curenta+1;j++)
                //    graf[adiacent].culori_adiacente.push_back(0);
                //graf[adiacent].culori_adiacente[culoare_curenta]++;
                //if(graf[adiacent].culori_adiacente[culoare_curenta]==1)
                //    graf[adiacent].grad_saturare++;
                if(graf[adiacent].culori_adiacente.find(culoare_curenta)==graf[adiacent].culori_adiacente.end()){
                    graf[adiacent].culori_adiacente.insert(make_pair(culoare_curenta,culoare_curenta));
                    graf[adiacent].grad_saturare++;
                }
            }
        }
        graf[curent].culoare=culoare_curenta;
    }
    delete[] culori;
    return max_color+1;

}


/*
class Nod{
public:
    int valoare;
    list<int> n_adiacente;
    set<int> culori_adiacente;
    int grad;
    int grad_saturare;
    int culoare;
};

int colorare_graf(Nod* graf, int N){
    int* culori=new int[N];
    list<int> noduri_necolorate;
    for(int i=0;i<N;i++){
        graf[i].culoare=-1;
        graf[i].valoare=i;
        graf[i].grad=graf[i].n_adiacente.size();
        graf[i].grad_saturare=0;
        culori[i]=-1;
        noduri_necolorate.push_back(i);
    }
    int max_color=-1;
    for(int i=0;i<N;i++){
        list<int>::iterator de_sters;
        int curent;
        int max_curent=-1;
        int max_saturare=-1;
        for(list<int>::iterator it=noduri_necolorate.begin();it!=noduri_necolorate.end();++it){
            int elem=*it;
            if(graf[elem].grad_saturare>max_saturare||(graf[elem].grad_saturare>max_saturare&&graf[elem].grad>max_curent)){
                curent=graf[elem].valoare;
                max_curent=graf[elem].grad;
                max_saturare=graf[elem].grad_saturare;
                de_sters=it;
            }
        }
        noduri_necolorate.erase(de_sters);
        for(int adiacent:graf[curent].n_adiacente){
            int col=graf[adiacent].culoare;
            if(col==-1){
                graf[adiacent].grad--;
            }
            else{
                culori[col]=i;
            }
        }
        int culoare_curenta=0;
        while(culori[culoare_curenta]==i)
            culoare_curenta++;
        if(culoare_curenta>max_color)
            max_color=culoare_curenta;
        for(int adiacent:graf[curent].n_adiacente){
            int col=graf[adiacent].culoare;
            if(col==-1){
                graf[adiacent].culori_adiacente.insert(culoare_curenta);
                graf[adiacent].grad_saturare=graf[adiacent].culori_adiacente.size();
            }
        }
        graf[curent].culoare=culoare_curenta;
    }
    delete[] culori;
    return max_color+1;

}
*/
int main(int argc, char** argv)
{
    ifstream fin(argv[1]);
    ofstream fout(argv[2]);

    int N,M;
    fin>>N>>M;
    Nod* graf=new Nod[N];
    for(int i=0;i<M;i++){
        int x,y;
        fin>>x>>y;
        graf[x].n_adiacente.push_back(y);
        graf[y].n_adiacente.push_back(x);
    }
    fout<<colorare_graf(graf,N)<<"\n";
    for(int i=0;i<N;i++){
        fout<<graf[i].culoare<<" ";
    }
    delete[] graf;
    fin.close();
    fout.close();
    return 0;
}
