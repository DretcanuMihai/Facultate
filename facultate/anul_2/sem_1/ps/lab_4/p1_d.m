function p1_d(n,m,k,p)
  #n-> puncte pe cerc
  #m-> cate simulari se fac
  #k-> nr. de pasi ce se efectueaza intr-o simulare
  #p-> sansa sa mergi la dreapta
  clf; grid on; hold on;
  pozitii_finale=[];
  for i=1:1:m
    pozitii=p1_a(k,p);
    pozitii_finale=[pozitii_finale mod(pozitii(end),n)];
  endfor
  aux=hist(pozitii_finale,0:(n-1));
  bar(0:(n-1),aux/m);
  disp(pozitii_finale);
end
