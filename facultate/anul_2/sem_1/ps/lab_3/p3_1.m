function out=p3_1(N)
  res=[4:24;zeros(1,21)];
  for step=1:1:N
    my_sum=sum(randi(6,1,4));
    res(2,my_sum-3)++;
  endfor
  disp(res);
end