function out=p2_b(m)
  #m -> nr de simulari
  rez=p2_a(m);
  nr_cazuri_favorabile=sum(rez>=10);
  disp('Aproximarea probabilitatii:');
  disp(nr_cazuri_favorabile/m);
  prob_aux=1;
  p=hygepdf(3,49,6,6);
  for i=0:1:9
    prob_aux=prob_aux-geopdf(i,p);
  endfor
  prob_teoretica=prob_aux;
  disp('Probabilitatea teoretica:');
  disp(prob_teoretica);
endfunction