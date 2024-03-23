%% RLC Circuit Parameters
R = 3; C = 0.5; L = 2;
sys = tf([1],[L*C, R*C, 1]);

%% Sample and Zero-order Hold
Ts = 0.1;
H = c2d(sys, Ts);

% Least square
open_system("model");
out = sim("model");

r = out.rd.Data;
u = out.ud.Data;
w = 5;

z = r(w:end);
m = height(r);
h1 = zeros(m-w+1, w);
h2 = zeros(m-w+1, w);

for idx = w:m
    h1(idx-w+1, :) = r(idx-w+1:idx)';
    h2(idx-w+1, :) = u(idx-w+1:idx)';
end
H = [h1,h2];

x = (H' * H) \ H' * z;
disp(x);
