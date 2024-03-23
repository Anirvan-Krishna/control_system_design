close all; clc; clear;

k = 1;
s1 = tf(6*k,[1 6 11 6]);

% bode(s1);
[m1, p1, w1] = bode(s1, 0.01:0.001:100);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:);
w1 = w1(:,:);

kp = 20*log10(5);   

fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
semilogx(w1, m1);
yline(kp);
yline(0); xline(0.02);
hold on;
text(1, kp+2, ['$k_p=  $',num2str(kp),'dB'], Interpreter='latex');
scatter(0.02,0);
text(0.022, +2, '$|G(j0.02)|=0$ dB', Interpreter='latex');
hold off;
grid on;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:20);
title('Magnitude plot', Interpreter='latex');