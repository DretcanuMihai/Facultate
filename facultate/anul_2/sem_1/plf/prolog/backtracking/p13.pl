%gaseste_toate_colorarile(N:integer,M:integer,O:list of lists of integers)
%N - reprezinta numarul total de tari - strict pozitiv
%M - reprezinta numarul total de culori posibile - strict pozitiv
%O - lista de output ce contine toate colorarile valide (nu exista 2
%tari alaturate colorate cu aceiasi culoare)
%model de flux (i,i,o) -> determinist, (i,i,i)-> determinist
gaseste_toate_colorarile(N,M,O):-findall(R,coloreaza(N,M,R),O).

%coloreaza(N:integer,M:integer,O:list of integers)
%N - reprezinta numarul total de tari - strict pozitiv
%M - reprezinta numarul total de culori posibile - strict pozitiv
%O - o lista de intregi ce reprezinta o colorare posibila
%model de flux (i,i,o) -> nedeterminist, (i,i,i)->determinist
coloreaza(N,M,O):-coloreaza_aux(N,M,1,0,O).

%coloreaza(N:integer,M:integer,K:integer,LC:integer,O:list of integers)
%N - reprezinta numarul total de tari - pozitiv
%M - reprezinta numarul total de culori posibile - pozitiv
%K - reprezinta culoarea cu care va fi colorata tara curenta
%LC - reprezinta culoarea tarii precedente
%O - o lista de intregi ce reprezinta o colorare posibila
%model de flux (i,i,i,i,o) -> nedeterminist, (i,i,i,i,i)->determinist
coloreaza_aux(0,_,_,_,[]):-!.
coloreaza_aux(N,M,K,LC,[K|O]):-
	K=<M,
	K\==LC,
	N1 is N-1,
	coloreaza_aux(N1,M,1,K,O).
coloreaza_aux(N,M,K,LC,O):-
	K=<M,
	K1 is K+1,
	coloreaza_aux(N,M,K1,LC,O).


%nu are sens sa fac test decat pentru gaseste toate culorile...

gtc_t1:-gaseste_toate_colorarile(5,1,O),O=[].
gtc_t2:-gaseste_toate_colorarile(1,1,O),O=[[1]].
gtc_t3:-gaseste_toate_colorarile(2,2,O),O=[[1,2],[2,1]].
gtc_t4:-gaseste_toate_colorarile(2,3,O),O=[[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]].
gtc_t5:-gaseste_toate_colorarile(1,4,O),O=[[1],[2],[3],[4]].
gtc_t6:-gaseste_toate_colorarile(3,3,O),O=[[1,2,1],[1,2,3],[1,3,1],[1,3,2],[2,1,2],[2,1,3],[2,3,1],[2,3,2],[3,1,2],[3,1,3],[3,2,1],[3,2,3]].
gtc:-gtc_t1,gtc_t2,gtc_t3,gtc_t4,gtc_t5,gtc_t6.




