N = 1000; % nr. de simulari
r = rand(1, N); % daca r < 0.4 => I1, altfel => I2
% a)
y = exprnd(5, 1, N) .* (r <= 0.4) + unifrnd(4, 6, 1, N) .* (r > 0.4); % timpul de printare

mean(y)
std(y)

% b)
mean(y > 5)

% c)

sum((r > 0.4) & (y > 5) ) / sum(y > 5)

countTime = 0;
countPrinter = 0;

for i = 1 : N
  
  r = rand;
  
  if r <= 0.4
    I = 1;
    T = exprnd(5);
  else
    I = 2;
    T = unifrnd(4,6);
  endif
  
  if T >5
    countTime++;
    if I == 2
      countPrinter++;
    endif
  endif
endfor

countPrinter/countTime