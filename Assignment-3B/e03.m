close all; clc; clear;

K = 24.0522; b = 0.2895; T = 0.093;
t1 = 0.95; a = 10;

gp = tf(10,[1 10 0]);
gc1 = tf([K*T K],[b*T 1]);
gc2 = tf([a*t1 a], [a*t1 1]);
gc = gc1*gc2;

[m1, p1, w1] = bode(gc*gp, 0.01:0.001:1000);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);


wc1 = 0.5; mg1 = 40.803;
wc2 = 20; mg2 = 0; ph2 = -122.7;

% fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
% sgtitle('Magnitude Plot of $G(j\omega)=G_c(j\omega)\cdot G_p(j\omega)$', Interpreter='latex');
% semilogx(w1, m1);
% grid on;
% xline(wc); yline(mg);
% hold on;
% scatter(wc, mg);
% text(wc+0.1, mg+6, '$|G(j0.5)|=4.458$dB', Interpreter='latex');
% hold off;
% xlabel('$\omega$ (rad/s)', Interpreter='latex');
% ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
% yticks(-120:20:40);


fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle('Bode plot of $G(j\omega)=G_{c1}\cdot G_{c2}\cdot G_p(j\omega)$', Interpreter='latex');

subplot(2,1,1); semilogx(w1, m1);
grid on;
xline(wc1); yline(mg1);
xline(wc2); yline(mg2);
hold on;
scatter(wc1, mg1);
text(wc1+0.05, mg1+6, '$|G(j0.5)|=40.1$dB', Interpreter='latex');
scatter(wc2, 0);
text(wc2+4, mg2+6, '$|G(j20)|=0$dB', Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:120);
title('Magnitude', Interpreter='latex');

subplot(2,1,2); semilogx(w1, p1);
grid on;
xline(wc2); yline(ph2);
hold on;
scatter(wc2, ph2);
text(wc2+1, ph2+4, '$\angle G(j20)=-122.7$deg', Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$\angle G(j\omega)$ (deg)', Interpreter='latex');
yticks(-270:45:0);
title('Phase', Interpreter='latex');