function out=p1_1(n)
  contor=0;
  sample=['r','r','r','r','r','a','a','a','v','v'];
  for step=1:1:n
    extragere=randsample(sample,3);
    if(any(extragere=='r'))
      contor++;
    endif
  endfor
  out=contor/n;
end