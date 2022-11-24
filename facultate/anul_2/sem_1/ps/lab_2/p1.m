function out=p1(n)
  contor=0;
  for step=1:1:n
    v=randi(365,1,23);
    if(length(unique(v))~=23)
       contor++;
    endif
  endfor
  out=contor/n;
end
