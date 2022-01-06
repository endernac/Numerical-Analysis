function v=baryctrint(x,y,u)

n=length(x);
w=baryctrwt(x);
z=w.*y;

prod=ones(size(u));
sum=zeros(size(u));

for k=1:n
  prod=(u-x(k)).*prod;
  sum=sum+z(k)./(u-x(k));
end
    
v=prod.*sum;

end
