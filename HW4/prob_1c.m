f = @(x) exp(-x.^2);
g = @(x) 1./(1+x.^2);

t_f = sqrt(pi)/2*erf(1);
t_g = 2*atan(4);

n = [8,16,32,64,128,256,512,1024];

err_simp = [];
err_bool = [];

% for i=n
%     i
%     err_simp = [err_simp, abs(t_f - simpc(f,0,1,i))];
%     err_bool = [err_bool, abs(t_f - boolc(f,0,1,i))];
% end


for i=n
    i
    err_simp = [err_simp, abs(t_g - simpc(g,-4,4,i))];
    err_bool = [err_bool, abs(t_g - boolc(g,-4,4,i))];
end

loglog(n,err_simp);
loglog(n,err_bool);

polyfit(log(n), log(err_simp), 1)
polyfit(log(n), log(err_bool), 1)
