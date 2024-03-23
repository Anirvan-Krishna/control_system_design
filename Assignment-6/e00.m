close all; clear; clc;

A = [
    0,1,0,0;
    3,0,0,2;
    0,0,0,1;
    0,-2,0,0;
    ];

B = [
    0,0;
    1,0;
    0,0;
    0,1;
    ];

C=[
    1,0,0,0;
    0,0,1,0;
    ];

D = [
    0,0;
    0,0;
    ];

Ts = 0.5;

s1 = ss(c2d(ss(A,B,C,D),Ts));
Ad = s1.A; Bd = s1.B;
Cd = s1.C; Dd = s1.D;

disp("Ad:"); disp(Ad);
disp("Bd:"); disp(Bd);
disp("Cd:"); disp(Cd);
disp("Dd:"); disp(Dd);

Co = [Bd Ad*Bd Ad^2*Bd Ad^3*Bd];
Ob = [Cd; Cd*Ad; Cd*Ad^2; Cd*Ad^3];

disp("Rank of Controllability matrix: "+rank(Co));
disp("Rank of Observability matrix: "+rank(Ob));

p = [0.05,0.06,0.07,0.08];

Ld = (place(Ad',Cd',p))';
disp("Ld:"); disp(Ld);

Kd = place(Ad, Bd, 10*p);
disp("Kd:"); disp(Kd);