function v=vanderint(x,y,u)

A=vander(x);
c=A\y.';
v=polyval(c,u);

end

