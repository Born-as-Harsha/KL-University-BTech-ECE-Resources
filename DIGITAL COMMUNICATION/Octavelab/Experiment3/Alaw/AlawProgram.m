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
apar = mu;

%----signal generation---
t = 0:ts:1;
s1 = a1*sin(2*pi*fm*t);
s2 = a2*sin(2*pi*fm*t);

x = [s1 s2];
t_full = 0:ts:(length(x)-1)*ts;

figure;
plot(t_full, x);
title('original signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

% normalization
x_normal = x / max(abs(x));

% a-law compression (piecewise)
ax = abs(x_normal);
sgn = sign(x_normal);
y_a = zeros(size(x_normal));
th = 1/apar;

% region 1: |x| < 1/a
idx1 = (ax < th);
y_a(idx1) = sgn(idx1) .* (apar * ax(idx1) / (1 + log(apar)));

% region 2: |x| >= 1/a
idx2 = ~idx1;
y_a(idx2) = sgn(idx2) .* ((1 + log(apar * ax(idx2))) / (1 + log(apar)));

figure;
plot(t_full, y_a);
title('A-law compressed signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

% a-law expansion (inverse piecewise)
ay = abs(y_a);
sgny = sign(y_a);
y_th = 1 / (1 + log(apar));
x_hat_norm = zeros(size(y_a));

% region 1 inverse
idx1e = (ay < y_th);
x_hat_norm(idx1e) = sgny(idx1e) .* ...
    (ay(idx1e) * (1 + log(apar)) / apar);

% region 2 inverse
idx2e = ~idx1e;
x_hat_norm(idx2e) = sgny(idx2e) .* ...
    (exp(ay(idx2e) * (1 + log(apar)) - 1) / apar);

figure;
plot(t_full, x_hat_norm);
title('Expanded signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
