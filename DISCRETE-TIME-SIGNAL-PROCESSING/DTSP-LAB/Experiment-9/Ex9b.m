clc;
clear;
close all;

L = 11;
fc = 0.2;
n = 0:L-1;
a = (L-1)/2;

% Rectangular window
h = 2*fc*sinc(2*fc*(n-a));

% Normalize filter coefficients
h = h/sum(h);

[H,w] = freqz(h,1,1024);

subplot(2,1,1);
plot(w/pi,abs(H));
grid on;
title('Magnitude Response');
xlabel('Normalized Frequency');
ylabel('Magnitude');

subplot(2,1,2);
plot(w/pi,unwrap(angle(H)));
grid on;
title('Phase Response');
xlabel('Normalized Frequency');
ylabel('Phase (radians)');
