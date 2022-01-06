function I=simpc(f,a,b,n)

if mod(n,2)~=0
  'n not even in Simpson'
  I=0;
  return
end  

h=(b-a)/n;
xodd=a+h:2*h:b-h;
xeve=a+2*h:2*h:b-2*h;
I=4*sum(f(xodd))+2*sum(f(xeve))+f(a)+f(b);
I=h*I/3.;
