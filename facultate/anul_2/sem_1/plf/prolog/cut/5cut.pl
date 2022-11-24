%max(A:integer,B:integer,O:integer)
%A - unul din intregii pentru care se calculeaza maximul
%B - unul din intregii pentru care se calculeaza maximul
%O - valoarea maxima dintre a si b
%flux: (i,i,i) -> determinist ; (i,i,o) -> determinist

max(A,B,O):-A>B,
	!,
	O=A.
max(_,B,B).

%teste
goal_m1:-max(1,2,2).
goal_m2:-max(2,1,2).
goal_m3:-max(1,1,1).

goal_m4:-max(1,2,O),
	O = 2.
goal_m5:-max(2,1,O),
	O = 2.
goal_m6:-max(1,1,O),
	O = 1.

goal_m:-goal_m1,
	goal_m2,
	goal_m3,
	goal_m4,
	goal_m5,
	goal_m6.

%element_maxim(L:list(*integer),O:integer)
%L - lista nevida de intregi pentru care se afla maximul
%O - intreg ce reprezinta maximul listei
%flux (i,o) ->determinist; (i,i) -> determinist

element_maxim([H|[]],H):-!.
element_maxim([H1,H2|T],O):-
	element_maxim([H2|T],O1),
	max(H1,O1,O).

%teste
goal_em1:-element_maxim([3],3).
goal_em2:-element_maxim([3,1,2],3).
goal_em3:-element_maxim([1,2,3],3).
goal_em4:-element_maxim([1,3,2],3).
goal_em5:-element_maxim([3],O),O=3.
goal_em6:-element_maxim([3,1,2],O),O=3.
goal_em7:-element_maxim([1,2,3],O),O=3.
goal_em8:-element_maxim([1,3,2],O),O=3.
goal_em:-goal_em1,goal_em2,goal_em3,goal_em4,goal_em5,goal_em6,goal_em7,goal_em8.

% creare_lista_indici(L:list(*integer),V:integer,P:integer,O:list(*integer)
% L - lista de intregi pentru care dorim transformarea
% V - intreg ce va fi inlocuit in lista L
% P - intreg ce reprezinta pozitia curenta in lista
% O - lista de intregi ce reprezinta indicii pe care V se gaseste in L
% flux: (i,i,i,i) -> determinist ; (i,i,i,o)-> determinist

creare_lista_indici([],_,_,[]).
creare_lista_indici([V|T],V,P,[O1|O2]):-!,
	O1=P,
	P1 is P+1,
	creare_lista_indici(T,V,P1,O2).
creare_lista_indici([_|T],V,P,O):-
	P1 is P+1,
	creare_lista_indici(T,V,P1,O).

%teste

goal_ci1:-creare_lista_indici([],1,1,[]).
goal_ci2:-creare_lista_indici([2,3],1,1,[]).
goal_ci3:-creare_lista_indici([1,2,3],1,1,[1]).
goal_ci4:-creare_lista_indici([1,2,1,3,1],1,1,[1,3,5]).
goal_ci5:-creare_lista_indici([],1,1,O),O=[].
goal_ci6:-creare_lista_indici([2,3],1,1,O),O=[].
goal_ci7:-creare_lista_indici([1,2,3],1,1,O),O=[1].
goal_ci8:-creare_lista_indici([1,2,1,3,1],1,1,O),O=[1,3,5].
goal_ci:-goal_ci1,goal_ci2,goal_ci3,goal_ci4,goal_ci5,goal_ci6,goal_ci7,goal_ci8.

% determina_indici_max(L:list(*integer),O:list(*integer))
% L - lista de intregi pentru care dorim transformarea
% O - lista de intregi ce reprezinta indicii pe care se afla valoarea
%     maxima din lista L in lista L
% flux - (i,i)- determinist; (i,o) - determinist

determina_indici_max([],[]).
determina_indici_max([H|T],O):-
	element_maxim([H|T],O1),
	creare_lista_indici([H|T],O1,1,O).

%teste
goal_di1:-determina_indici_max([],[]).
goal_di2:-determina_indici_max([5],[1]).
goal_di3:-determina_indici_max([1,2,3,4],[4]).
goal_di4:-determina_indici_max([3,1,2,3],[1,4]).
goal_di5:-determina_indici_max([],O),O=[].
goal_di6:-determina_indici_max([5],O),O=[1].
goal_di7:-determina_indici_max([1,2,3,4],O),O=[4].
goal_di8:-determina_indici_max([3,1,2,3],O),O=[1,4].
goal_di9:-determina_indici_max([10,14,12,13,14],O),O=[2,5].
goal_di10:-determina_indici_max([10,14,12,13,14],[2,5]).
goal_di:-goal_di1,goal_di2,goal_di3,goal_di4,goal_di5,goal_di6,goal_di7,goal_di8,goal_di9,goal_di10.

% transformare(L:list,O:list)
% L - lista de intregi si liste de intregi pentru care dorim
%     transformarea
% O - lista de intregi si liste de intregi obtinut din L prin inlocuirea
%     fiecarei liste de intregi cu o lista ce contine indicii pe care se
%     afla elementul maxim din lista.
% flux - (i,i) - determinist; (i,o) - determinist

transformare([],[]).
transformare([H|T],[H|O]):-integer(H),
	!,
	transformare(T,O).
transformare([H|T],[O1|O2]):-
	determina_indici_max(H,O1),
	transformare(T,O2).

%teste
goal_t1:-transformare([],[]).
goal_t2:-transformare([1,2],[1,2]).
goal_t3:-transformare([[1,2,3],[45]],[[3],[1]]).
goal_t4:-transformare([1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7],[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]).
goal_t5:-transformare([],O),O=[].
goal_t6:-transformare([1,2],O),O=[1,2].
goal_t7:-transformare([[1,2,3],[45]],O),O=[[3],[1]].
goal_t8:-transformare([1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7],O),O=[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7].
goal_t:-goal_t1,goal_t2,goal_t3,goal_t4,goal_t5,goal_t6,goal_t7,goal_t8.

goal_final:-goal_m,goal_em,goal_ci,goal_di,goal_t.







