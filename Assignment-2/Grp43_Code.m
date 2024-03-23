l = 0.36; g = 9.8;
m = 0.26; M = 2.4;

A = [
    0 1 0 0;
    0 0 -m*g/M 0;
    0 0 0 1;
    0 0 (m+M)*g/(M*l) 0
];

B = [
    0;
    1/M;
    0;
    -1/M*l
];

C1 = [1, 0, 0, 0];
C2 = [0, 0, 1, 0];
D = [0];

[num1, den1] = ss2tf(A, B, C1, D)
[num2, den2] = ss2tf(A, B, C2, D)

sys1 = tf(num1, den1)
sys2 = tf(num2, den2)

