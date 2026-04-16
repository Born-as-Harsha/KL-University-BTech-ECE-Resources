clc; clear; close all;

% Parameters
N = 50000;
SNR_dB = 0:2:20;
samples_per_bit = 100;

data = randi([0 1], N, 1);

BER = zeros(length(SNR_dB),1);

for k = 1:length(SNR_dB)

    % ---- Modulation (0 and 1) ----
    tx_signal = repelem(data, samples_per_bit);

    % ---- Normalize Energy ----
    tx_signal = tx_signal / sqrt(samples_per_bit);

    % ---- AWGN ----
    SNR_linear = 10^(SNR_dB(k)/10);
    noise_variance = 1/(2*SNR_linear);

    noise = sqrt(noise_variance) * randn(size(tx_signal));
    rx_signal = tx_signal + nuoise;

    % ---- Matched Filter ----
    matched = ones(samples_per_bit,1)/sqrt(samples_per_bit);
    filtered = conv(rx_signal, matched, 'same');

    % ---- Sample at center ----
    sampled = filtered(samples_per_bit/2:samples_per_bit:end);

    % ---- Decision ----
    detected = sampled > 0.5;

    % ---- BER ----
    errors = sum(detected ~= data);
    BER(k) = errors/N;

end

% Avoid zero for log plot
BER(BER==0) = 1e-6;

% ---- Plot ----
figure;
semilogy(SNR_dB, BER, 'o-', 'LineWidth',2);
grid on;
xlabel('SNR (dB)');
ylabel('BER');
title('BER vs SNR for Rectangular Pulse ');

