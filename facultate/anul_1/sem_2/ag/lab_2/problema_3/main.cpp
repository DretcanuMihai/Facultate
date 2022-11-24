#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <queue>

std::pair<int,int>cauta_start(std::vector<std::string> harta)
{
    for(int i=0;i<harta.size();i++)
        for(int j=0;j<harta[i].size();j++)
            if(harta[i][j]=='S')
                return std::make_pair(i,j);
}

std::vector<std::string> rezolva_labirint(std::vector<std::string>& harta,std::pair<int,int> start)
{
    std::vector<std::vector<std::pair<int,int>>>parcurgere;
    for(int i=0;i<harta.size();i++)
    {
        std::vector<std::pair<int,int>> v;
        for(int j=0;j<harta[i].size();j++)
            v.push_back(std::make_pair(-1,-1));
        parcurgere.push_back(v);
    }
    parcurgere[start.first][start.second]=std::make_pair(-2,-2);
    std::pair<int,int> directii[4]={std::make_pair(-1,0),std::make_pair(0,1),std::make_pair(1,0),std::make_pair(0,-1)};
    std::queue<std::pair<int,int>>q;
    q.push(start);
    int gasit=0;
    std::pair<int,int> finish;
    while(!q.empty())
    {
        std::pair<int,int> punct=q.front();
        q.pop();
        for(int i=0;i<4;i++)
        {
            int x,y;
            x=punct.first+directii[i].first;
            y=punct.second+directii[i].second;
            if(x>=0 && y>=0 && x<harta.size())
                if(y<harta[x].size())
                    if(harta[x][y]!='1' && parcurgere[x][y].first==-1 && parcurgere[x][y].second==-1)
                    {
                        q.push(std::make_pair(x,y));
                        parcurgere[x][y]=punct;
                        if(harta[x][y]=='F')
                        {
                            gasit=1;
                            finish=q.back();
                            break;
                        }

                    }
        }
        if(gasit==1)
        {
            while(!q.empty())
                q.pop();
            break;
        }
    }
    while(parcurgere[finish.first][finish.second].first!=-2)
    {
        finish=parcurgere[finish.first][finish.second];
        harta[finish.first][finish.second]='#';
    }
    harta[start.first][start.second]='S';
    return harta;
}

int main()
{
    std::ifstream fin("labirint_1.txt");
    std::ofstream fout("solutie.txt");
    std::vector<std::string> harta;
    std::string aux;
    while(getline(fin,aux))
    {
        harta.push_back(aux);
    }
    std::pair<int,int> start=cauta_start(harta);
    rezolva_labirint(harta,start);
    for(int i=0;i<harta.size();i++)
        fout<<harta[i]<<"\n";
    fin.close();
    fout.close();
    return 0;
}
