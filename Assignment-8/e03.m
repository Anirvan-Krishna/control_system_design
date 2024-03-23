clear; close all; clc;

%% Parameter feeding to Simulink
R = 3; C = 0.5;
L = 2;
sys = tf([1],[L*C, R*C, 1]);

%% Plot the Bode plot using System Transfer function
figure;
bode(sys);
grid on;
title('Bode Plot of RLC Circuit');

%% Initialize and Run the Simulink Circuit
open_system("e03");
out = sim("e03");

% Export output to workspace
Vc = out.Vc;
Vin = out.Vin;

%% Preparing BODE PLOT (RUN ONLY WITH SINUSOIDAL INPUT)
% Compute the FFT of the input and output signals
input_fft = fft(Vin);
output_fft = fft(Vc);

% Frequency axis
N = length(Vin);
freq = (0:N-1)*(1/N); % Frequency vector

% Calculate magnitude and phase
magnitude = 20*log10(abs(output_fft ./ input_fft));
phase = rad2deg(angle(output_fft ./ input_fft));

% Plotting magnitude
figure;
subplot(2, 1, 1);
semilogx(freq, magnitude);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Bode Plot - Magnitude');
grid on;

% Plotting phase
subplot(2, 1, 2);
semilogx(freq, phase);
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
title('Bode Plot - Phase');
grid on;