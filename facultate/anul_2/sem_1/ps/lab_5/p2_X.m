function p2_X()
  
  nr_sim=1000;
  x1=p2(nr_sim,1/12);
  x2=exprnd(12,1,nr_sim);
  
  [mean(x1),mean(x2)]
  [std(x1,1),std(x2,1)]
  
endfunction