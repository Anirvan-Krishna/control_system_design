clc; clear; close all;

A = [
    -2 -13 9;
    -5 -10 9
    -10 -11 12;
    ];

B = [1;4;7];
K = [2.2225 -10.44 5.5944];
x0 = [2; 5; 8];
t = 0:15;
xt = zeros(3,16); xt(:,1) = x0;
ut = zeros(1,16); ut(1) = K*x0;

%for i = 2:16
%    xt(:,i) = A*xt(:,i-1) + B*ut(i-1);
%    ut(i) = K*xt(:,i);
%end

xt = gen_xt(15,A,B,K,x0,0);

fig = figure; fig.Position(3) = 1000; fig.Position(4) = 1000; movegui('center');
sgtitle('State Trajectory', Interpreter='latex');

hold on;
plot(t,xt(1,:));
plot(t,xt(2,:));
plot(t,xt(3,:));
hold off;
xlabel('$t$', Interpreter='latex');
ylabel('$x(t)$', Interpreter='latex');
legend('$x_1$', '$x_2$', '$x_3$',Interpreter='latex');