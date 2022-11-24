function p1_X()
  
  clf; hold on; grid on;
  nr_sim=1000;
  x1=p1([1:4],[0.46,0.4,0.1,0.04],nr_sim);
  x2=randsample([1:4],nr_sim,replacement=true,[0.46,0.4,0.1,0.04]);

  frecv_rel_1= histc(x1,1:4)/nr_sim;
  bar(1:4,frecv_rel_1,'hist','FaceColor','b');
  
  frecv_rel_2=histc(x2,1:4)/nr_sim;  
  bar(1:4,frecv_rel_2,'FaceColor','y');
  
  set(findobj('type','patch'),'facealpha',0.7);
  xticks(1:4);xlim([0 5]);
  
endfunction