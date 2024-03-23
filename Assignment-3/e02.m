close all; clc;

k = 1;
s1 = tf(6*k,[1 6 11 6]);

% bode(s1);
[m1, p1, w1] = bode(s1, 0.01:0.001:100);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:);
w1 = w1(:,:);

ph = -120; wc = 1.505; mg = -8.0624;

fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
semilogx(w1, p1);
grid on;
xline(wc);
yline(ph);
hold on;
scatter(wc, ph);
text(wc+0.1, ph+6, '$\angle G(j1.505)=-120$deg', Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$\angle G(j\omega)$ (deg)', Interpreter='latex');
yticks(-270:90:0);
title('Phase plot', Interpreter='latex');

fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
semilogx(w1, m1);
xline(wc); yline(mg);
hold on;
scatter(wc, mg);
text(wc+0.1, mg+3, '$|G(j1.505)| = -8.0624$dB', Interpreter='latex');
% text(wc, 0.7, "0dB", Interpreter='latex');
hold off;
grid on;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(s)|$ (dB)', Interpreter='latex');
yticks(-120:20:20);
title('Magnitude plot', Interpreter='latex');