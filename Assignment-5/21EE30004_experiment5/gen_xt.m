
function xt = gen_xt(n, A, B, K, x0, p)

xt = zeros(length(x0),n+1); ut = zeros(height(K),n+1);
k = (rand(1,n+1)>p);
xt(:,1) = x0; ut(:,1) = K*x0*k(1);

for i = 2:n+1
    xt(:,i) = A*xt(:,i-1) + B*ut(:,i-1);
    ut(:,i) = K*xt(:,i)*k(i);
end

end

% function xt = gen_xt(n, A, B, K, x0, p)
% xt = zeros(length(x0),n+1);
% ut = zeros(height(K),n+1);
% k = (rand(1,n+1)>p);
% xt(:,1) = x0;

% for i = 1:n
%     xt(:,i+1) = A*xt(:,i) + B*ut(:,i);
%     ut(:,i) = K*xt(:,i)*k(i);
% end
% end