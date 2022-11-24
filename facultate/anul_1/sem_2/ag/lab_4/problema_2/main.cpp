#include <iostream>
#include <fstream>
#include <list>
#include <queue>

int* decodare_pruffer(std::list<int>& PC, int M){
    int* v_tati=new int[M+1];
    int* apare=new int[M+1];
    std::priority_queue<int> q;
    for(int i=0;i<M+1;i++){
        v_tati[i]=-1;
        apare[i]=0;
    }
    for(auto elem:PC)
        apare[elem]++;
    for(int i=0;i<M+1;i++)
        if(apare[i]==0)
            q.push(M-i); ///oops, am facut-o din nou :(
    for(int i=0;i<M;i++){
        int x=PC.front();
        PC.pop_front();
        int y=M-q.top();
        q.pop();
        v_tati[y]=x;
        apare[x]--;
        if(apare[x]==0)
            q.push(M-x);
        apare[y]++;
        PC.push_back(y);
    }
    return v_tati;

}

int main(int argc,char** argv)
{
    std::ifstream fin(argv[1]);
    std::ofstream fout(argv[2]);
    int M;
    std::list<int> PC;
    fin>>M;
    for(int i=0;i<M;i++){
        int x;
        fin>>x;
        PC.push_back(x);
    }
    int N=M+1;

    int* rez=decodare_pruffer(PC,M);

    fout<<N<<"\n";
    for(int i=0;i<N;i++)
        fout<<rez[i]<<" ";
    delete[] rez;
    return 0;
}
