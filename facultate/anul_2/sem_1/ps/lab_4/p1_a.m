function out=p1_a(k,p)
  simulare=rand(1,k);
  poz=0;
  pozitii=[0];
  for i=1:1:k
    if simulare(i)<p
      poz++;
    else
      poz--;
    endif
    pozitii=[pozitii poz];
  endfor
  out=pozitii;
end
