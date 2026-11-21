clc;
clear all;
close all;

pkg load signal

rp = 0.15;
rs = 60;

fp = 3000;
fs = 1500;

Wp = 2*pi*fp;
Ws = 2*pi*fs;

[n, wn] = buttord(Wp, Ws, rp, rs, 's');

disp("Order of the filter:");
disp(n);

disp("Cutoff frequency:");
disp(wn);

[b, a] = butter(n, wn, 'high', 's');

w = logspace(2, 5, 1000);
H = freqs(b, a, w);

figure;

subplot(2,1,1);
plot(w, abs(H));
grid on;
xlabel("Frequency (rad/sec)");
ylabel("Magnitude");
title("High Pass Magnitude Spectrum");

subplot(2,1,2);
plot(w, angle(H));
grid on;
xlabel("Frequency (rad/sec)");
ylabel("Phase (Radians)");
title("High Pass Phase Spectrum");
