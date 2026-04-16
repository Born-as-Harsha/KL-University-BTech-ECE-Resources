clc;
clear;
close all;

% Parameters
Nb = 8;
Rb = 1e3;
Tb = 1/Rb;
fs = 100 * Rb;
ts = 1 / fs;
f1 = 4e3; % bit 0
f2 = 8e3; % bit 1

% Transmitter: bits
b = randi([0 1], 1, Nb);

t = 0:ts:(Nb * Tb - ts);

Ns = round(Tb/ts);   % IMPORTANT FIX

% NRZ (Octave-safe)
data_up = kron(b, ones(1, Ns));
data_up = data_up(1:length(t));

% FSK modulation
c1 = cos(2*pi*f1*t);
c2 = cos(2*pi*f2*t);

s_fsk = (data_up == 0).*c1 + (data_up == 1).*c2;

% Coherent Demodulation (FIXED)
b_hat = zeros(1, Nb);

for k = 1:Nb
    idx = (k-1)*Ns + 1 : k*Ns;

    t_bit = t(idx); % local time

    % Local carriers (IMPORTANT FIX)
    c1_bit = cos(2*pi*f1*t_bit);
    c2_bit = cos(2*pi*f2*t_bit);

    y1 = sum(s_fsk(idx).*c1_bit);
    y2 = sum(s_fsk(idx).*c2_bit);

    b_hat(k) = (y2 > y1); % detect bit 1
end

% Display check
disp('Input bits:');
disp(b);
disp('Demodulated bits:');
disp(b_hat);

% Plotting
figure;

subplot(4,1,1);
stairs((0:Nb-1)*Tb, b, 'LineWidth', 1.5);
ylim([-0.2 1.2]);
ylabel('b');
title('FSK Input Bits');
grid on;

subplot(4,1,2);
plot(t, c1, 'LineWidth', 1);
ylabel('c1(t)');
grid on;

subplot(4,1,3);
plot(t, s_fsk, 'LineWidth', 1.2);
ylabel('s_{fsk}(t)');
grid on;

subplot(4,1,4);
stem(0:Nb-1, b_hat, 'filled');
ylim([-0.2 1.2]);
xlabel('bit index');
ylabel('b');
title('FSK Demodulated Bits');
grid on;
