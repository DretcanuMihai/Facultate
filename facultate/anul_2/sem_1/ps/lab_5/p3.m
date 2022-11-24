function [X,Y]=p3(N)
  
  U=rand(2,N);
  R=sqrt(-2*log(U(1, :)));
  V=2*pi*U(2, :);
  
  X=R .* cos(V);
  Y=R .* sin(V);
  
endfunction