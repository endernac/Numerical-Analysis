Y = @ (t) exp(t)/(1+t);
f = @ (t, y) t*y/(1+t);

N = 4;
tspan = [0, 1];
Y_a = 1;
Y_b = feval(Y, tspan(2));

fprintf('N\tApprox\t\tExact\t\tError\t\t\tLog Error-Ratio\n');

for i = 1:10 
    [t, y] = rk3(f, tspan, Y_a, N, 0);
    y_b = y(1+N, :);
    err(i) = y_b-Y_b;
    
    if i==1
        log_err = 0;
    else
        log_err = log2(err(i-1)/err(i));
    end
    
    fprintf('%d\t%f\t%f\t%e\t\t%f\n', N, y_b, Y_b, err(i), log_err);
    
    N = 2*N;
end
