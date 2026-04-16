clc;
clear;
close all;

% Parameters
Nb = 8;
Rb = 1e3;
Tb = 1/Rb;
fs = 100 * Rb;
ts = 1 / fs;
fc = 4e3;   % carrier frequency

% Transmitter: bits
b = randi([0 1], 1, Nb);

t = 0:ts:(Nb * Tb - ts);
Ns = round(Tb/ts);

% NRZ mapping: 0 -> -1, 1 -> +1
b_nrz = 2*b - 1;

% Upsample
data_up = kron(b_nrz, ones(1, Ns));
data_up = data_up(1:length(t));

% Carrier
c = cos(2*pi*fc*t);

% BPSK modulation
s_bpsk = data_up .* c;

% Coherent Demodulation
b_hat = zeros(1, Nb);

for k = 1:Nb
    idx = (k-1)*Ns + 1 : k*Ns;
    t_bit = t(idx);

    % Local carrier
    c_bit = cos(2*pi*fc*t_bit);

    % Correlator
    y = sum(s_bpsk(idx) .* c_bit);

    % Decision
    b_hat(k) = (y > 0);
end

% Display
disp('Input bits:');
disp(b);
disp('Demodulated bits:');
disp(b_hat);

% ================== PLOTTING ==================
figure('Position', [100 100 900 700], 'color', 'w');

% Time ticks (fix overlap issue)
xt = 0:0.002:Nb*Tb;

subplot(4,1,1);
stairs((0:Nb-1)*Tb, b, 'LineWidth', 1.5);
ylim([-0.2 1.2]);
ylabel('b');
title('BPSK Input Bits');
grid on;

subplot(4,1,2);
plot(t, c, 'LineWidth', 1);
ylabel('c(t)');
title('Carrier Signal');
grid on;
xticks(xt);
xtickangle(45);

subplot(4,1,3);
plot(t, s_bpsk, 'LineWidth', 1.2);
ylabel('s_{bpsk}(t)');
title('BPSK Signal');
grid on;
xticks(xt);
xtickangle(45);

subplot(4,1,4);
stem(0:Nb-1, b_hat, 'filled');
ylim([-0.2 1.2]);
xlabel('Bit Index');
ylabel('b');
title('BPSK Demodulated Bits');
grid on;
