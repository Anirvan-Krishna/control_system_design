clear; close all; clc;

A = [
    1.5, 0;
    1, -1.5;
    ];
B = [1;0];
T = 10;

[all_x0, all_ut] = get_x0_ut(A,B,T);

C = [1;1];
wt = rand(width(C),T)*1-0.5;
xt = gen_xt_wns(A,B,C,all_x0(:,1),all_ut(1,:),wt,T);

cnt = 0;
for i = 1:width(all_x0)
    xt = gen_xt_wns(A,B,C,all_x0(:,i),all_ut(i,:),wt,T);
    cnt = cnt + check_xt(xt);
end

disp("cnt: "+cnt);
disp("all_x0: "+width(all_x0));
disp(all_x0);
disp(all_ut);

%%
function xt = gen_xt_wns(A,B,C,x0,ut,w,T)
    xt = zeros(width(A), T+1);
    xt(:,1) = x0;
    for i = 2:T+1
        xt(:,i) = A*xt(:,i-1) + B*ut(:,i-1) + C*w(:,i-1);
    end
end

function [x0_b, ut_b] = get_x0_ut(A,B,T)
x0_b = zeros(width(A),1);
ut_b = zeros(1,T);
for i = 1:100000
    ut = rand(1,T)*10 - 5;
    x0 = rand(width(A),1)*20 - 10;
    xt = gen_xt(A, B, x0, ut, T);
    if check_xt(xt)
        x0_b = [x0_b,x0];
        ut_b = [ut_b;ut];
    end
end
x0_b = x0_b(:,2:end);
ut_b = ut_b(2:end,:);
end

function xt = gen_xt(A, B, x0, ut, T)
xt = zeros(width(A),T+1);
xt(:,1) = x0;

for i = 2:T+1
    xt(:,i) = A*xt(:,i-1) + B*ut(:,i-1);
end
end

function y = check_xt(xt)
x = (xt>-10) .* (xt<10);
if sum(x(:)) == height(xt)*width(xt)
    y = 1;
else
    y = 0;
end
end