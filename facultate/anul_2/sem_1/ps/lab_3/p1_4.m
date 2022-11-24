function out=p1_4(n)
  contorA=0;
  contorAB=0;
  sample=['r','r','r','r','r','a','a','a','v','v'];
  for step=1:1:n
    extragere=randsample(sample,3);
    if(any(extragere=='r'))
      contorA++;
      if(length(unique(extragere))==1)
        contorAB++;
      endif
    endif
  endfor
  out=contorAB/contorA;
end