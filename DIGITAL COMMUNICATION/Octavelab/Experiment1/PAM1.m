% Natural Sampling
clear all;
clc;
close all;

pkg load signal;   % Required for square, butter, filtfilt

% Sampling parameters
Fs = 1000;            % Sampling frequency
Ts = 1/Fs;
t = 0:Ts:2-Ts;

% Message signal
Fm = 3;               % Message frequency
m = sin(2*pi*Fm*t);   % Message signal

figure(1);
plot(t, m, 'r', 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Message Signal');
axis([0 2 -1.05 1.05]);

% Pulse carrier
Fc = 20 * Fm;         % Carrier frequency
dutycycle = 50;

p = square(2*pi*Fc*t, dutycycle);  % Square wave
p(p < 0) = 0;                      % Make unipolar

figure(2);
plot(t, p, 'b', 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Pulse Carrier Signal');
axis([0 2 -0.1 1.1]);

% Natural sampling (Amplitude Modulation)
s = m .* p;           % Element-wise multiplication

figure(3);
plot(t, s, 'k', 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
grid on;
title('Natural Sampling');
axis([0 2 -1.5 1.5]);

% Demodulation using Low-pass Filter (Butterworth)
fc = 10;              % Cut-off frequency (Hz)
[b, a] = butter(4, fc/(Fs/2));  % 4th order LPF
sn = filtfilt(b, a, s);

figure(4);
plot(t, 2*sn, 'r', 'LineWidth', 2);
hold on;
plot(t, m, 'k--', 'LineWidth', 2);
hold off;

xlabel('Time');
ylabel('Amplitude');
grid on;
title('Reconstruction from Natural Sampling');
legend('Reconstructed Signal', 'Original Signal');
axis([0 2 -1.5 1.5]);

