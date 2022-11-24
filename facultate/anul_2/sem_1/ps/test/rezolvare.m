function rezolvare(n=1000)
  #R1.1
  #n este numarul de incercari folosit la b) si c)
  #a)
  disp('a)Probabilitatea teoretica ca emailul sa fie procesat in cel mult 3 secunde este:');
  disp(expcdf(3,4)); # 3 -> sub 3 secunde ; 4 -> media distributiei exponentiale
                     # va returna probabilitatea ca (x<=3) pentru distributia
                     # Exp(4)
  
  #b)
  timpi=[]; #colectam timpii
  for i=1:1:n
    t=exprnd(4); #generam un timp aleator pentru S1
    if(t>4) #Daca timpul este mai mare ca 4, inseamna ca a trecut deja pe 
            #S2. Au trecut deja 4 secunde, deci vom face 4 + timpul generat
            #de S2 (ce urmeaza distributia uniforma)
      t=4+unifrnd(1,3);
    endif
    timpi=[timpi t]; #adaugam timpul in vectorul de timpi
  endfor
  
  disp('b)O estimarea valorii medii a timpului de procesare:');
  disp(mean(timpi)); #apelam mean pentru a face valoarea medie
                     #pe testele facute
  #c)          
  contor=0; #contor pentru incercari favorabile
  for i=1:1:n
    t=exprnd(4); #generam un timp aleator pentru S1 - nu ne pasa de S2 pentru ca`
                 #nu se intra pe acesta decat dupa ce au trecut deja 4 secunde
    if(t<=4) # daca timpul este <=4,  incrementam contorul.
      contor++;
    endif
  endfor
  disp('c)O estimare a probabilitatii ca emailul sa fie procesat in cel mult 4 secunde este:');
  disp(contor/n);
  
endfunction