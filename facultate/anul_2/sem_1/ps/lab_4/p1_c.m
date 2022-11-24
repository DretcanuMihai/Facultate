function p1_c(m,k,p)
  pasi_dreapta=[];
  for i=1:1:m
    pozitii=p1_a(k,p);
    #nr total de pasi : k
    #stanga+dreapta=k
    #dreapta-stanga=pozitia finala
    #dreata=(k+pozitia finala)/2
    dreapta=(k+pozitii(end))/2;
    pasi_dreapta=[pasi_dreapta dreapta];
  endfor
  pasi_dreapta_medie=mean(pasi_dreapta);
  disp(pasi_dreapta_medie);
end
