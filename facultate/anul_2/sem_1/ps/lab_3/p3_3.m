function out=p3_3()
  res=[4:24;zeros(1,21)];
  for step1=1:1:6
    for step2=1:1:6
      for step3=1:1:6
        for step4=1:1:6
          sum=step1+step2+step3+step4;
          res(2,sum-3)++;
        endfor
      endfor
    endfor
  endfor
  val=6*6*6*6;
  for step=1:1:21
    res(2,step)=res(2,step)/val;
  endfor
  out=res;
end