function out=f1(v,k)
out=[];
if k<0 || k>size(v)
	disp('k invalid;');
	return;
end
rez=nchoosek(v,k);
nrl=rows(rez)
for step=1:1:nrl
	out=[out;perms(rez(step,:))];
end
end
	