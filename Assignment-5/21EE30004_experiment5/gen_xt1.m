function xt = gen_xt1(n,A,s,x0)
    xt = zeros(length(x0), n+1);
    xt(:,1) = x0;
    for i = 1:n
        xt(:,i+1) = A(:,:,s(i))*xt(:,i);
    end
end