function out=p3_2(N)
  clf; grid on; hold on;
  res=[];
  for step=1:1:N
    my_sum=sum(randi(6,1,4));
    res=[res,my_sum];
  endfor
  x=hist(res,4:24);
  bar(4:24,x/N,'hist','FaceColor','b');  
end