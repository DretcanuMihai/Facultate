function out=p2a(N)
  clf;hold on;axis square;
  rectangle('Position',[0 0 1 1]);
  xc=[0,1,1,0,0];
  yc=[0,0,1,1,0];
  plot(xc,yc,'-r');
  contor=0;
  for step=1:1:N
    x=rand();
    y=rand();
    if pdist([x y;0.5 0.5])<0.5
      plot(x,y,'dm','MarkerSize',7,'MarkerFaceColor','m');
      contor++;
    endif
  endfor
  out=contor/N;
end
