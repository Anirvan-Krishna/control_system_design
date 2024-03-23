% System Parameters
M = 2.4;
m = 0.26;
l = 0.36;
g = 9.81;

m2 = 1/M; m0 = -g/(M*l);
z0 = -(M+m)*g/(M*l); n0 = -1/(M*l);
xi = 0.6124; wn = 1.3063;

g1 = 10; g2 = 10; g3 = 10; % Replacement for gamma

% Control systems C1 and C2
% Using values from part-1
numX = [0.4167, 0, -12.41];
den = [1, 0, -30.17, 0, 0];
numY = [-0.15, 0, 0];

G1 = tf(numX, den); % x vs u
G2 = tf(numY, den); % theta vs u

% Solving system of equations
syms a1 a0 p1 p0 q0;

e1 = g1 + g2 + g3 + 2*xi*wn == q0;
e2 = z0 + 15*a1*m2 + 15*n0*p1 == g1*g2 + g2*g3 + g1*g3 + 2*xi*wn*(g1+g2+g3) + wn^2;
e3 = z0*q0 + 15*a0*m2 + 15*n0*p0 == g1*g2*g3 + 2*xi*wn*(g1*g2 + g2*g3 + g1*g3) + (g1+g2+g3)*wn^2;
e4 = 15*m0*a1 == 2*xi*wn*g1*g2*g3 + (g1*g2 + g2*g3 + g1*g3)*wn^2;
e5 = 15*m0*a0 == g1*g2*g3*wn^2;

sol = solve([e1, e2, e3, e4, e5], [a1, a0, p1, p0, q0]);

a0 = double(sol.a0)
a1 = double(sol.a1)
p0 = double(sol.p0)
p1 = double(sol.p1)
q0 = double(sol.q0)

% Designing controllers C1 and C2 (currently random values)
num1 = [a0, a1];
num2 = [p0, p1];
denC = [1, q0];

C1 = tf(num1, denC);
C2 = tf(num2, denC);
