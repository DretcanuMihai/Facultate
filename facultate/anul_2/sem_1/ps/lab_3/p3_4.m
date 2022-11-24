function out=p3_4(N)
  contor=0;
  step=1;
  while step<=N
    roll_sum=sum(randi(6,1,4));
    if roll_sum<=20
      step++;
      if roll_sum>=10
        contor++;
      endif
    endif
  endwhile
 probabilities=p3_3();
 p_up=0;
 p_down=0;
 for i=1:1:17
   p_down=p_down+probabilities(2,i);
   if i>=7
     p_up=p_up+probabilities(2,i);
   endif
 endfor
 p=p_up/p_down;
 disp('Theoretical probability is:');
 disp(p);
 out=contor/N; 
end