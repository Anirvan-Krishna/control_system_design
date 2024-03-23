close all; clc;

k = 1;
s1 = tf(6*k,[1 6 11 6]);

% bode(s1);
[m1, p1, w1] = bode(s1, 0.01:0.001:100);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:);
w1 = w1(:,:);

wc = 0.3; g1 = m1(w1==wc);

fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
semilogx(w1, m1); ylim([-120, 20]);
xline(wc); yline(g1);
hold on;
scatter(wc, g1);
text(wc+0.1, g1+2, ['$|G(j0.3)|=', num2str(g1),'$'], Interpreter='latex');
% text(wc, 0.7, "0dB", Interpreter='latex');
hold off;
grid on;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:20);
title('Magnitude plot', Interpreter='latex');