#include <iostream>
#include <fstream>
#include <queue>

using std::priority_queue;


int* codarePruffer(int* v_tati, int N){
    int* rez=new int[N-1];
    int curent=0;
    priority_queue<int> frunze;
    int* nr_fii=new int[N];
    for(int i=0;i<N;i++)
        nr_fii[i]=0;

    for(int i=0;i<N;i++)
        if(v_tati[i]!=-1)
            nr_fii[v_tati[i]]++;


    for(int i=0;i<N;i++)
        if(nr_fii[i]==0)
            frunze.push(N-i-1); /// nu mai fa asta ca te incurci >:(
    while(curent<N-1){
        int nod=frunze.top();
        nod=N-nod-1;
        frunze.pop();
        int tata=v_tati[nod];
        rez[curent]=tata;
        curent++;
        nr_fii[tata]--;
        if(nr_fii[tata]==0)
            frunze.push(N-tata-1);
    }
    delete[] nr_fii;
    return rez;

}

int main(int argc, char** argv)
{
    std::ifstream fin(argv[1]);
    std::ofstream fout(argv[2]);
    int N;
    fin>>N;
    int* v_tati=new int[N];
    for(int i=0;i<N;i++){
        int t;
        fin>>t;
        v_tati[i]=t;
    }
    int* rez=codarePruffer(v_tati,N);
    fout<<N-1<<'\n';
    for(int i=0;i<N-1;i++)
        fout<<rez[i]<<" ";
    delete[] rez;
    delete[] v_tati;
    fin.close();
    fout.close();
    return 0;
}
