function c=vandercoeff(x,y)

A=vander(x);
c=A\y.';

end

