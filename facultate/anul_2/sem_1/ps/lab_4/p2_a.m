function out=p2_a(m)
  #m -> nr de simulari
  p=hygepdf(3,49,6,6); #probabilitatea de succes
  x=geornd(p,1,m);
  out=x;
endfunction