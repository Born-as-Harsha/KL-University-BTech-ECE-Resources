
clc;
clear;
close all;
% Input sequences
x = [1 2 2];
h = [1 2 3 4];
% Length of DFT
N = max(length(x), length(h));
% Zero padding
x = [x zeros(1, N-length(x))];
h = [h zeros(1, N-length(h))];

% DFT of input sequences
X = fft(x, N);
H = fft(h, N);

% Multiplication in frequency domain
Y = X .* H;

% IDFT to obtain circular convolution
y = ifft(Y, N);

% Display results
disp('DFT of x[n]:');
disp(X);

disp('DFT of h[n]:');
disp(H);

disp('Circular Convolution using DFT and IDFT:');
disp(real(y));

% Plot input sequences
n = 0:N-1;

figure;

subplot(3,2,1);
stem(n,x,'filled');
title('Input Sequence x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,2,2);
stem(n,h,'filled');
title('Input Sequence h[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot magnitude spectrum
subplot(3,2,3);
stem(n,abs(X),'filled');
title('Magnitude Spectrum X[k]');
xlabel('k');
ylabel('Magnitude');
grid on;

subplot(3,2,4);
stem(n,abs(H),'filled');
title('Magnitude Spectrum H[k]');
xlabel('k');
ylabel('Magnitude');
grid on;

% Plot circular convolution
subplot(3,2,5);
stem(n,real(y),'filled');
title('Circular Convolution y[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot output spectrum
subplot(3,2,6);
stem(n,abs(Y),'filled');
title('Output Spectrum Y[k]');
xlabel('k');
ylabel('Magnitude');
grid on;

