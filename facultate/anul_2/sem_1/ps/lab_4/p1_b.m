function p1_b(m,k,p)
  clf; grid on; hold on;
  pozitii_finale=[];
  for i=1:1:m
    pozitii=p1_a(k,p);
    pozitii_finale=[pozitii_finale pozitii(end)];
  endfor
  aux=hist(pozitii_finale,-k:k);
  bar(-k:k,aux/m);
  disp(pozitii_finale);
end
