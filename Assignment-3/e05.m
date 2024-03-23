close all; clc;

k = 2.528;
s1 = tf(6*k,[1 6 11 6]);

% bode(s1);
[m1, p1, w1] = bode(s1, 0.01:0.001:100);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);

wc = 1.505; ph1 = -120;
% Bode Plot
fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle(['Bode plot of $G(s)$ with $K=', num2str(k), '$'], Interpreter='latex');
subplot(2,1,1); semilogx(w1, m1);
grid on;
yline(0); xline(wc);
hold on;
scatter(wc, 0);
text(wc+0.1, 6, '$|G(j1.505)|=0$dB', Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:0);
title('Magnitude', Interpreter='latex');
subplot(2,1,2); semilogx(w1, p1);
grid on;
xline(wc); yline(ph1);
hold on;
scatter(wc, ph1);
text(wc+0.1, ph1+15,['$\angle G(j1.505)=', num2str(ph1), '$deg'], Interpreter='latex')
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$\angle G(j\omega)$ (deg)', Interpreter='latex');
yticks(-270:90:0);
title('Phase', Interpreter='latex');


k = 5;
s1 = tf(6*k,[1 6 11 6]);

% bode(s1);
[m1, p1, w1] = bode(s1, 0.01:0.001:100);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);

wc = 0.02; g1 = 20*log10(5);
% Bode Plot
fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle(['Bode plot of $G(s)$ with $K=', num2str(k), '$'], Interpreter='latex');
subplot(2,1,1); semilogx(w1, m1);
grid on;
xline(wc); yline(g1);
hold on;
scatter(wc, g1);
text(wc, g1-6, ['$|G(j',num2str(wc),')|=13.979$ dB'], Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:0);
title('Magnitude', Interpreter='latex');
subplot(2,1,2); semilogx(w1, p1);
grid on;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$\angle G(j\omega)$ (deg)', Interpreter='latex');
yticks(-270:90:0);
title('Phase', Interpreter='latex');


k = 3.354;
s1 = tf(6*k,[1 6 11 6]);

% bode(s1);
[m1, p1, w1] = bode(s1, 0.01:0.001:100);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);

wc = 0.3; g1 = 10;
% Bode Plot
fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle(['Bode plot of $G(s)$ with $K=', num2str(k), '$'], Interpreter='latex');
subplot(2,1,1); semilogx(w1, m1);
ylim([-100 30])
grid on;
xline(wc); yline(g1);
hold on;
scatter(wc, g1);
text(wc+0.01, g1+4, ['$|G(j',num2str(wc),')|=10$dB'], Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:30);
title('Magnitude', Interpreter='latex');
subplot(2,1,2); semilogx(w1, p1);
grid on;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$\angle G(j\omega)$ (deg)', Interpreter='latex');
yticks(-270:90:0);
title('Phase', Interpreter='latex');
