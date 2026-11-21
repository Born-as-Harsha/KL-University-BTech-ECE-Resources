clc;
clear all;
close all;

x1 = [2, 1, -1, 3, -1, 5];
x2 = [2, 3, 4, 3, 2, 1];

n = 0:length(x1)-1;

subplot(4, 1, 1);
stem(n, x1);
xlabel("Time");
ylabel("Amplitude");
title("Input signal - 1");

subplot(4, 1, 2);
stem(n, x2);
xlabel("Time");
ylabel("Amplitude");
title("Input signal - 2");

subplot(4, 1, 3);
y1 = x1 + x2;
stem(n, y1);
xlabel("Time");
ylabel("Amplitude");
title("Addition of two signals");

subplot(4, 1, 4);
y2 = x1 - x2;
stem(n, y2);
xlabel("Time");
ylabel("Amplitude");
title("Subtraction of two signals");
