close all; clc; clear;

gp = tf(10,[1 10 0]);

[m1, p1, w1] = bode(gp, 0.01:0.001:1000);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);

wc = 20; ph = -153.435;

% Bode Plot
fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle('Phase plot of $G(j\omega)=G_p(j\omega)$ (without any compensation)', Interpreter='latex');
semilogx(w1, p1);
grid on;
xline(wc); yline(ph);
hold on;
scatter(wc, ph);
text(wc+0.1, ph+4, '$\angle G(j20)=-153.435$deg', Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$\angle G(j\omega)$ (deg)', Interpreter='latex');
yticks(-270:45:0);



K = 1; b = 0.2895; T = 0.093;
gc1 = tf([K*T K],[b*T 1]);

[m1, p1, w1] = bode(gp*gc1, 0.01:0.001:1000);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);

wc = 20; mg = -27.6231;

fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle('Magnitude Plot of $G(j\omega)=G_{c1}(j\omega)\cdot G_p(j\omega)$', Interpreter='latex');
semilogx(w1, m1);
grid on;
xline(wc); yline(mg);
hold on;
scatter(wc, mg);
text(wc+1, mg+4, '$|G(j20)|=-27.6231$dB', Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-120:20:40);