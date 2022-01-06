function I=boolc(f,a,b,n)

if mod(n,4)~=0
  'n not multiple of 4'
  I=0;
  return
end  

h=(b-a)/(4*n);
xeve=a+2*h:2*h:b-2*h;
x0 = a:4*h:b-4*h;
x1 = a+h:4*h:b-3*h;
x2 = a+2*h:4*h:b-2*h;
x3 = a+3*h:4*h:b-1*h;
x4 = a+4*h:4*h:b;


I=(7*sum(f(x0))+32*sum(f(x1))+12*sum(f(x2))+32*sum(f(x3))+7*sum(f(x4)));
I=2*h*I/45.;

end