clc;
clear;
close all;

N = 32;

% Rectangular window
w1 = ones(N,1);
[H1,f] = freqz(w1,1,1024);

figure(1);

subplot(3,1,1);
plot(f/pi,20*log10(abs(H1)/max(abs(H1))+eps),'r');
grid on;
title('Rectangular Window');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
axis([0 1 -100 5]);

% Hanning window
w2 = 0.5-0.5*cos(2*pi*(0:N-1)'/(N-1));
[H2,f] = freqz(w2,1,1024);

subplot(3,1,2);
plot(f/pi,20*log10(abs(H2)/max(abs(H2))+eps),'b');
grid on;
title('Hanning Window');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
axis([0 1 -100 5]);

% Hamming window
w3 = 0.54-0.46*cos(2*pi*(0:N-1)'/(N-1));
[H3,f] = freqz(w3,1,1024);

subplot(3,1,3);
plot(f/pi,20*log10(abs(H3)/max(abs(H3))+eps),'g');
grid on;
title('Hamming Window');
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');
axis([0 1 -100 5]);

drawnow;
