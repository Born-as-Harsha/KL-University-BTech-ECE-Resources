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
Wp = w1/pi;
Ws = w2/pi;
[bn, Wn] = buttord(Wp, Ws, rp, rs);
disp("Order of the filter:");
disp(bn);
