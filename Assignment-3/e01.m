close all; clc;

k = 1;
s1 = tf(6*k,[1 6 11 6]);

% bode(s1);
[m1, p1, w1] = bode(s1, 0.01:0.001:100);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);

wc = 2; u1 = m1(w1==wc); u2 = p1(w1==wc);

% Bode Plot
fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle(['Bode plot of $G(s)$ with $K=', num2str(k), '$'], Interpreter='latex');
subplot(2,1,1); semilogx(w1, m1);
grid on;
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

fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
semilogx(w1, p1);
grid on; 
xline(wc); yline(u2);
hold on;
scatter(wc, u2);
text(wc+0.1, u2+6, ['$\angle G(j2)=', num2str(u2), '$deg'], Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$\angle G(j\omega)$ (deg)', Interpreter='latex');
yticks(-270:90:0);
title('Phase plot', Interpreter='latex');

% Magnitude plot
fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
semilogx(w1, m1);
xline(wc); yline(u1);
hold on;
scatter(wc, u1);
text(wc+0.1, u1+2, ['$|G(j2)|=', num2str(u1), '$dB'], Interpreter='latex');
% text(wc, 0.7, "0dB", Interpreter='latex');
hold off;
grid on;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:20);
title('Magnitude plot', Interpreter='latex');

% fig = figure; fig.Position(3) = 600; fig.Position(4) = 400;
% semilogx(w1, m1);
% xline(wc); yline(u1);
% hold on;
% scatter(wc, u1);
% text(wc+0.1, u1+2, ['Gain = ', num2str(u1), 'dB'], Interpreter='latex');
% % text(wc, 0.7, "0dB", Interpreter='latex');
% hold off;
% grid on;
% xlabel('$\omega$ (rad/s)', Interpreter='latex');
% ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
% yticks(-120:20:20);
% title('Magnitude plot with $K=3.8005$', Interpreter='latex');
