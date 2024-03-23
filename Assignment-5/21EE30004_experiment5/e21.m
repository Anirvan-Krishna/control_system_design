clear; close all; clc;

A1 = [
    0.47, 0.12;
    -3.90, 0.19
    ];

A2 = [
    -0.03, 0.78;
    0.60, 0.47;
    ];

A = zeros(2,2,2);
A(:,:,1) = A1;
A(:,:,2) = A2;

x0 = [-1;1];

s1 = [1,1,2,2,2,2,1,1,2,2,2,2,1,1,2];
s2 = [1,1,1,2,2,1,1,1,2,2,1,1,1,2,2];

n=15;
xt = zeros(length(x0), n+1);
xt(:,1) = x0;

for i = 1:n
    xt(:,i+1) = A(:,:,s1(i))*xt(:,i);
end

t = 0:15;
xt1 = gen_xt1(15,A,s1,x0);
xt2 = gen_xt1(15,A,s2,x0);


fig = figure; fig.Position(3) = 2000; fig.Position(4) = 1000; movegui('center');
sgtitle('State Trajectory', Interpreter='latex');

subplot(1,2,1);
hold on;
plot(t,xt1(1,:));
plot(t,xt1(2,:));
hold off;
xlabel('$t$', Interpreter='latex');
ylabel('$x^{(1)}(t)$', Interpreter='latex');
legend('$x_1$', '$x_2$',Interpreter='latex');

subplot(1,2,2);
hold on;
plot(t,xt2(1,:));
plot(t,xt2(2,:));
hold off;
xlabel('$t$', Interpreter='latex');
ylabel('$x^{(2)}(t)$', Interpreter='latex');
legend('$x_1$', '$x_2$',Interpreter='latex');