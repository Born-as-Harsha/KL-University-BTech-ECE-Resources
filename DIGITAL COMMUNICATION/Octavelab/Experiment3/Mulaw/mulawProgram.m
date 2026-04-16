clc;
clear;
close all;

%---parameter--
fm = 1;
a1 = 8;
a2 = 0.5;
mu = 100;
fs = 1000 * fm;
ts = 1/fs;

%----signal generation---
t = 0:ts:1;
s1 = a1*sin(2*pi*fm*t);
s2 = a2*sin(2*pi*fm*t);

x = [s1 s2];
t_full = 0:ts:(2+ts);

figure;
plot(t_full, x);
title('original signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

%---Normalization--
x_normal = x / max(abs(x));

%---mu-law compression--
y_mu = sign(x_normal) .* log(1 + mu*abs(x_normal)) ./ log(1 + mu);

figure;
plot(t_full, y_mu);
title('\mu law compressed signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

%-----mu-law expansion (inverse)---
x_hat_norm = (1/mu) * ((1 + mu).^abs(y_mu) - 1) .* sign(y_mu);

figure;
plot(t_full, x_hat_norm);
title('\mu law expanded (reconstructed) signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
