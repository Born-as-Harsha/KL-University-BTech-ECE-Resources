clc;
clear all;
close all;

pkg load signal

rp = 0.15;
rs = 60;

fp = 1500;
fs = 3000;
Fs = 7000;

w1 = 2*pi*fp/Fs;
w2 = 2*pi*fs/Fs;

[bn, wbn] = buttord(w1/pi, w2/pi, rp, rs);

disp("Order of Digital Butterworth Filter:");
disp(bn);

disp("Cutoff Frequency of Digital Filter:");
disp(wbn);

Wp = 2*pi*fp;
Ws = 2*pi*fs;

[n, wn] = buttord(Wp, Ws, rp, rs, 's');

disp("Order of Analog Butterworth Filter:");
disp(n);

disp("Cutoff Frequency of Analog Filter:");
disp(wn);

[b, a] = butter(bn, wbn);

[H, f] = freqz(b, a, 1024, Fs);

figure;

subplot(2,1,1);
plot(f, abs(H));
grid on;
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Magnitude Spectrum");

subplot(2,1,2);
plot(f, angle(H));
grid on;
xlabel("Frequency (Hz)");
ylabel("Phase (Radians)");
title("Phase Spectrum");
