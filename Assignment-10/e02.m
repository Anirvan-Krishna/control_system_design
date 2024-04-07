clear; close all; clc;
A=[1.5 0;1 -1.5];
B=[1;0];
T = 10;

[all_x0, all_ut] = gen_x0_ut_b(A,B,T);


C = [1;1];

b1 = bin_search_bound(A,B,C,T,all_x0,all_ut,1);
b2 = bin_search_bound(A,B,C,T,all_x0,all_ut,2);
b3 = bin_search_bound(A,B,C,T,all_x0,all_ut,3);
disp("b1: "+b1);
disp("b2: "+b2);
disp("b3: "+b3);


function y = bin_search_bound(A,B,C,T,all_x0,all_ut,idx);
lo = 0;
hi = 1.5;
mid = 0;
for j = 1:30
    if lo>hi
        break;
    end
    mid = (lo+hi)/2;
    scc = zeros(1,1000);
    for i = 1:1000
        if idx==1
            scc(i) = gen_scc(A,B,C,T,all_x0,all_ut,idx,mid,0);
        elseif idx==2
            scc(i) = gen_scc(A,B,C,T,all_x0,all_ut,idx,0,mid);
        elseif idx==3
            scc(i) = gen_scc(A,B,C,T,all_x0,all_ut,idx,mid,mid);
        end
    end
    temp = mean(scc);
    if temp<0.99
        hi = mid;
    elseif temp>0.99
        lo = mid;
    end
    
    if(abs(temp-0.99)<1e-5)
        break
    end
    
    % disp("mean scc: "); disp(temp);
    % disp("m: "); disp(mid);
    
end
y = mid;
end


function scc = gen_scc(A,B,C,T,x0b,utb,fid,band1,band2)
wt = rand(1,T)*2*band1 - band1;
wpt = rand(1,T)*2*band2 - band2;
cnt = 0;
if fid==1
    for i = 1:width(x0b)
        xt = gen_xt_wns(A,B,C,T,x0b(:,i),utb(i,:),wt);
        cnt = cnt + check_xt(xt);
    end
elseif fid==2
    for i = 1:width(x0b)
        xt = gen_xt_wps(A,B,T,x0b(:,i),utb(i,:),wpt);
        cnt = cnt + check_xt(xt);
    end
elseif fid==3
    for i = 1:width(x0b)
        xt = gen_xt_wpns(A,B,C,T,x0b(:,i),utb(i,:),wpt,wt);
        cnt = cnt + check_xt(xt);
    end
end
scc = cnt/width(x0b);
end

function xt = gen_xt_wpns(A, B, C, T, x0, ut, wpt, wt)
xt = zeros(height(x0),T+1);
xt(:,1) = x0;
for i = 2:T+1
    xt(:,i) = (A + [wpt(:,i-1), 0; 0,0])*xt(:,i-1) + B*ut(:,i-1) + C*wt(:,i-1);
end
end

function xt = gen_xt_wps(A,B,T,x0,ut,wpt)
xt = zeros(height(x0),T+1);
xt(:,1) = x0;
for i = 2:T+1
    xt(:,i) = (A + [wpt(:,i-1), 0; 0,0])*xt(:,i-1) + B*ut(:,i-1);
end
end

function xt = gen_xt_wns(A,B,C,T,x0,ut,wt)
xt = zeros(height(x0),T+1);
xt(:,1) = x0;
for i = 2:T+1
    xt(:,i) = A*xt(:,i-1) + B*ut(:,i-1) + C*wt(:,i-1);
end
end

function [x0b, utb] = gen_x0_ut_b(A,B,T)
x0b = zeros(width(A),1);
utb = zeros(1,T);
for i = 1:1000000
    x0 = rand(width(A),1)*20 - 10;
    ut = rand(width(B),T)*10 - 5;
    xt = gen_xt(A,B,T,x0,ut);
    if check_xt(xt)
        x0b = [x0b, x0];
        utb = [utb; ut];
    end
end
x0b = x0b(:,2:end);
utb = utb(2:end,:);
end

function xt = gen_xt(A,B,T,x0,u)
xt = zeros(height(x0), T+1);
xt(:,1) = x0;
for i = 2:T+1
    xt(:,i) = A*xt(:,i-1) + B*u(:,i-1);
end
end

function y = check_xt(xt)
a = (xt>-10) .* (xt<10);
if sum(a(:)) == width(xt)*height(xt)
    y = 1;
else
    y = 0;
end
end