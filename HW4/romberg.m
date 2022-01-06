function [I,fcount]=romberg(f,a,b,tol)

tic

itmax=25;

k=0;
n=1;
R=(b-a)*(f(a)+f(b))/2.;
fcount=2;
T=R;
A(1)=R;
E=1;
%[k R E 0]
   
while E>tol
     k=k+1;
     if k>itmax
       break
     end 
     Rold=R;
     Told=T;
     Eold=E;
     n=2*n;     
     h=(b-a)/n;
     xodd=a+h:2*h:b-h;
     sumodd=sum(f(xodd));
     fcount=fcount+length(xodd);
     T=h*sumodd+Told/2.;
     B=A;
     A(1)=T;
     m=1;
     for i=1:k
         m=4*m;
         A(i+1)=(m*A(i)-B(i))/(m-1.);
     end
     R=A(k+1);
     E=abs(R-Rold);
%     [k R E log2(Eold/E)]
end

I=R;

toc

