function pb2 (g,a,b,M,n=500,subpunct='a')
  
  %g1 = @(x) exp(- x .^ 2)
  %g2 = @(x) abs(sin(exp(x)))
  %g3 = g3 = @(x) x .^ 2 ./ (1 + x .^ 2) .* (x<=0)+ sqrt(2 * x - x .^2) .* (x>0)
  
  if subpunct == 'a'
    %pb2(g1,-2,2,1)
    %pb2(g2,-2,2,1)
    %pb2(g3,-2,2,1)
    
    clf; hold on;
    X = unifrnd(a, b, 1, n);
    Y = unifrnd(0, M, 1, n);
    
    plot(X(g(X)<=Y), Y(g(X) <= Y), '*r','MarkerSize',10);
    plot(X(g(X)>Y), Y(g(X) > Y), '*b','MarkerSize',10);
    
    t=linspace(a, b, 1000);
    plot(t, g(t), '-k', 'LineWidth',3)
   
  else
    
    int = MC1(g, a, b, M, n)
    int = MC2(g, a, b, n)
    integral(g, a, b)
    
  endif

endfunction
