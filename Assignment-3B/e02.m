close all; clc; clear;

K = 24.0522; b = 0.2895; T = 0.093;

t1 = 0.350; a = 1;

gp = tf(10,[1 10 0]);
gc1 = tf([K*T K],[b*T 1]);
gc2 = tf([a*t1 a], [a*t1 1]);

%fig = figure; fig.Position(3) = 500; fig.Position(4) = 500; movegui('center');
%bode(gp*gc1);
%margin(gp*gc1);

[m1, p1, w1] = bode(gp*gc1, 1e-2:1e-3:1e3);
m1 = 20*log10(m1(:,:));
p1 = p1(:,:); w1 = w1(:,:);

wc = 0.5; mg = 33.6414;

% Bode Plot
fig = figure; fig.Position(3) = 1200; fig.Position(4) = 900; movegui('center');
sgtitle('Magnitude plot of $G(j\omega)=G_{c1}\cdot G_p(j\omega)$', Interpreter='latex');
semilogx(w1, m1);
grid on;
xline(wc); yline(mg);
hold on;
scatter(wc, mg);
text(wc+0.1, mg+2, '$|G(j0.5)|=33.6414$dB', Interpreter='latex');
hold off;
xlabel('$\omega$ (rad/s)', Interpreter='latex');
ylabel('$|G(j\omega)|$ (dB)', Interpreter='latex');
yticks(-100:20:60);

