clc;
clear;
close all;

%% Parameters
Am = 8;
fm = 5;          % Message frequency
fs = 50;         % Sampling frequency
n = 4;
l = 2^n;

t = 0:1/fs:1/fm;

%% Message signal
m = Am*sin(2*pi*fm*t);

%% Sampling
sampled_signal = m;

%% Quantization
delta = (2*Am)/l;

Qlevels = zeros(1,l);
for i = 1:l
    Qlevels(i) = (i*delta) - Am - (delta/2);
end

%% Quantized signal
k = length(m);
quantized_signal = zeros(1,k);

for i = 1:k
    p = m(i);
    [~, k1] = min(abs(p - Qlevels));
    quantized_signal(i) = Qlevels(k1);
end

%% Encoding PCM code (Octave compatible)
pcm_code = zeros(length(m), n);

for i = 1:length(m)
    k2 = quantized_signal(i);
    idx = find(Qlevels == k2) - 1;
    binstr = dec2bin(idx, n);
    pcm_code(i,:) = binstr - '0';
end

%% Plotting
figure;
plot(t, m, 'LineWidth', 1.5);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

figure;
stem(t, sampled_signal, 'filled');
title('Sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

figure;
stem(t, quantized_signal, 'filled');
title('Quantized Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

figure;
stairs(t, quantized_signal, 'LineWidth', 1.5);
title('PCM Staircase');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

figure;
stairs(reshape(pcm_code.',1,[]),'LineWidth',1.5);
title('PCM Bit Stream');
xlabel('Bit Index');
ylabel('Bit Value');
ylim([-0.2 1.2]);
grid on;

%% Display Output
disp('Quantization Levels:');
disp(Qlevels);

disp('Quantized Signal:');
disp(quantized_signal);

disp('PCM Code (Binary Representation):');
disp(pcm_code);

disp('Serial PCM Bit Stream:');
disp(reshape(pcm_code.',1,[]));

