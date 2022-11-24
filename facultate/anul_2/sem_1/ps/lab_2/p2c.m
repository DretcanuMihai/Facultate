function out=p2c(N)
  contor=0;
  clf;hold on;axis square;
  rectangle('Position',[0 0 1 1]);
  for step=1:1:N
    x=rand();
    y=rand();
    XA=pdist([x y;0 0]);
    XB=pdist([x y;1 0]);
    XC=pdist([x y;1 1]);
    XD=pdist([x y;0 1]);
    ok=0;
    if XA^2+XB^2>1
      ok++;
    endif
    if XB^2+XC^2>1
      ok++;
    endif
    if XC^2+XD^2>1
      ok++;
    endif
    if XD^2+XA^2>1
      ok++;
    endif
    if ok==2
      plot(x,y,'dm','MarkerSize',7,'MarkerFaceColor','m');
      contor++;
    endif
  endfor
  out=contor/N;
end