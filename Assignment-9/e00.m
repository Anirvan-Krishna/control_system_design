clear; close all; clc;

a = 1/33; b = 1/33000;
c = 0; d = 100/33;
x1_b = 1/33; x2_b = 100;


A = [
    -a, 0;
    -x2_b, -(a+c);
    ];
B = [b; 0;];
C = [0, 1];
D = 0;

s = tf('s');
s1 = C * inv(s*eye(2) - A)*B;

[nu, de] = ss2tf(A,B,C,D);
s1 = tf(nu, de);
pzplot(s1);

disp("Eigenvalues of A: "); disp(eig(A));

f = 1/5; g = 1/5;

A1 = [
    -a, 0, b;
    -x2_b, -(a+c), 0;
    0,0,-f;
    ];
B1 = [0;0;g];
C1 = [0,1,0];
D1 = 0;

[nu, de] = ss2tf(A1,B1,C1,D1);
s2 = tf(nu,de);
disp("Transfer fn from y_t to u_t: ");

y_b = 100;
s = tf('s');
td = 38; ti = 100;
Gc = 1 + td*s + 1/(ti*s);

fig = figure; fig.Position(3) = 1000; fig.Position(4) = 600; movegui('center');
rlocus(-Gc*s2);

% Luenburger Observer
kp = 0.17;