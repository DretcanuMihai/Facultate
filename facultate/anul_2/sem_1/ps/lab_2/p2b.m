function out=p2b(N)
  contor=0;
  clf;hold on;axis square;
  rectangle('Position',[0 0 1 1]);
  for step=1:1:N
    x=rand();
    y=rand();
    dc=pdist([x y;0.5 0.5]);
    d1=pdist([x y;0 0]);
    d2=pdist([x y;0 1]);
    d3=pdist([x y;1 0]);
    d4=pdist([x y;1 1]);
    if dc<d1 && dc<d2 && dc<d3 && dc<d4
      plot(x,y,'dm','MarkerSize',7,'MarkerFaceColor','m');
      contor++;
    endif
  endfor
  out=contor/N;
end