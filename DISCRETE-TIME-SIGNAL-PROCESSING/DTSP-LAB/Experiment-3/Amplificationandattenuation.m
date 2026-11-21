clc;
clear all;
close all;

n = 0:1:6;
x = [1, 2, 3, 4, 5, 6, 7];

y1 = 2 * x;
y2 = x / 2;

subplot(3,1,1);
stem(n, x);
xlabel("Time");
ylabel("Amplitude");
title("Input Signal");

subplot(3,1,2);
stem(n, y1);
xlabel("Time");
ylabel("Amplitude");
title("Amplification Signal");

subplot(3,1,3);
stem(n, y2);
xlabel("Time");
ylabel("Amplitude");
title("Attenuation Signal");
