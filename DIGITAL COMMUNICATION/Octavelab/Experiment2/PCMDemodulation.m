clc;
clear;
close all;

%% Parameters
Am = 8;
fm = 5;
fs = 50;
n = 4;
l = 2^n;

t = 0:1/fs:1/fm;

%% Quantization Levels
delta = (2*Am)/l;
Qlevels = zeros(1,l);
for i = 1:l
    Qlevels(i) = (i*delta) - Am - (delta/2);
end

%% Received PCM Code
pcm_code = [
    1 0 0 0
    1 0 0 1
    1 0 1 0
    1 0 1 1
    1 1 0 0
    1 0 1 1
    1 0 1 0
    1 0 0 1
    1 0 0 0
];

%% PCM Decoding
k = size(pcm_code,1);
decoded_indices = zeros(1,k);

for i = 1:k
    decoded_indices(i) = bin2dec(num2str(pcm_code(i,:)));
end

%% De-Quantization
demodulated_signal = zeros(1,k);
for i = 1:k
    demodulated_signal(i) = Qlevels(decoded_indices(i)+1);
end

%% Time for demodulated samples
t_s = linspace(0, 1/fm, k);

%% Reconstruction using interp1 (Octave-safe)
reconstructed_signal = interp1(t_s, demodulated_signal, t, 'linear');

%% Original Message
m = Am*sin(2*pi*fm*t);

%% ================= PLOTS =================

figure;
stem(t_s, demodulated_signal, 'filled');
title('Demodulated (De-Quantized) Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

figure;
plot(t, reconstructed_signal, 'LineWidth', 1.5);
title('Reconstructed Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

figure;
plot(t, m, 'b', 'LineWidth', 1.5); hold on;
plot(t, reconstructed_signal, 'r--', 'LineWidth', 1.5);
legend('Original Message','Reconstructed Signal');
title('Original vs Reconstructed Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Display Output
disp('Quantization Levels:');
disp(Qlevels);

disp('Decoded Indices:');
disp(decoded_indices);

disp('Demodulated Signal:');
disp(demodulated_signal);

