% State Matrices
A = [0, 1, 0, 0;
     3, 0, 0, 2;
     0, 0, 0, 1;
     0, -2, 0, 0];

B = [0, 0;
     1, 0;
     0, 0;
     0, 1]

C = [1, 0, 0, 0;
     0, 0, 1, 0];

D = [0, 0;
     0, 0];

% Transfer Functions
sys = ss(A, B, C, D);
sys_to_tf = tf(sys)

% Eigen Values
e = eig(A);

% Controllability
c = [B, A*B, A^2*B, A^3*B];
rank(c);

p=[-100, -200, -300, -400];
k = place(A,B,p);

% Observable
observable_matrix = [C;
                     C*A;
                     C*A*A;
                     C*A*A*A
                     ]

rank_o = rank(observable_matrix);
disp(rank_o);  %rank is 4 so controllable

% L matrix calculation
p1= [-10, -20, -30, -40];
L1= place(A',C',p1);
L = L1';
