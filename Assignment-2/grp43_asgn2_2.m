l = 0.36; g = 9.8;
m = 0.26; M = 2.4;

m2 = 1/M; m0 = -g/(M*l);
z0 = -(M+m)*g/(M*l); n0 = -1/(M*l);
xi = 0.7279; wn = 1.9905;

g1 = 8; g2 = 8; g3 = 8;


syms a1 a0 p1 p0 q0;
eq1 = q0 - (g1 + g2 + g3 + 2*xi*wn) == 0;
eq2 = z0 + 15*a1*m2 + 15*n0*p1 - (g1*g2 + g2*g3 + g1*g3 + 2*xi*wn*(g1+g2+g3) + wn^2) == 0;
eq3 = z0*q0 + 15*a0*m2 + 15*n0*p0 - (g1*g2*g3 + 2*xi*wn*(g1*g2 + g2*g3 + g1*g3) + (g1+g2+g3)*wn^2) == 0;
eq4 = 15*m0*a1 - (2*xi*wn*g1*g2*g3 + (g1*g2 + g2*g3 + g1*g3)*wn^2) == 0;
eq5 = 15*m0*a0 - (g1*g2*g3*wn^2) == 0;

S = solve([eq1, eq2, eq3, eq4, eq5]);

a1 = double(S.a1); a0 = double(S.a0);
p1 = double(S.p1); p0 = double(S.p0);
q0 = double(S.q0);

s1 = tf(1, [1 q0 (z0 + 15*a1*m2 + 15*n0*p1) 15*m0*a1 15*m0*a0]);
margin(s1);
% e02;