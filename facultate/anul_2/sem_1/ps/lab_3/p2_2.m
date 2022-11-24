function retval = p2_2 (n)
  x=binornd(5,1/3,1,n);
  retval=sum(x==2)/n;
endfunction
