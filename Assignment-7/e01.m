clear; close all; clc;

R1 = 1e3; C1 = 1e-3;
R2 = 2e3; C2 = 4e-3;
L = 0.5;

A = [
    -1/(R1*C1), 0, -1/C1;
    0, -1/(R2*C2), 1/C2;
    1/L, -1/L, 0;
    ];
B = [1/(R1*C1); 0; 0];
D = 0;

Co = ctrb(A,B);
disp("Rank of the controllability matrix is: "+rank(Co));

C11 = [1, 0,0]; Ob1 = obsv(A,C11);
C12 = [0, 1,0]; Ob2 = obsv(A,C12);
C13 = [1,-1,0]; Ob3 = obsv(A,C13);

disp("Rank of the observability matrix when output is v1: "+rank(Ob1));
disp("Rank of the observability matrix when output is v2: "+rank(Ob2));
disp("Rank of the observability matrix when output is v1-v2: "+rank(Ob3));

Kd = [100,100,100];

fs = 1e3; Ts = 1/fs;
p = [1-1e-3, 1-2e-3, 1-3e-3];

s1 = ss(c2d(ss(A,B,C11,D), Ts));
s2 = ss(c2d(ss(A,B,C12,D), Ts));
s3 = ss(c2d(ss(A,B,C13,D), Ts));

Ad1 = s1.A; Bd1 = s1.B;
Cd1 = s1.C; Dd1 = s1.D;

Ad2 = s2.A; Bd2 = s2.B;
Cd2 = s2.C; Dd2 = s2.D;

Ad3 = s3.A; Bd3 = s3.B;
Cd3 = s3.C; Dd3 = s3.D;

Ld1 = (place(Ad1',Cd1',p))';
Ld2 = (place(Ad2',Cd2',p))';
Ld3 = (place(Ad3',Cd3',p))';
