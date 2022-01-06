
function c=baryctrcoeff(x,y)

n=length(x);
w=ones(size(x));

for j=2:n
   for k=1:j-1
      w(k)=(x(k)-x(j))*w(k);
      w(j)=(x(j)-x(k))*w(j);
   end
end
    
c=y./w;

end

