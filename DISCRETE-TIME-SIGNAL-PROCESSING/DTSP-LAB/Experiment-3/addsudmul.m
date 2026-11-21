clc;
clear all;
close all;

x1 = [-1, 2, 3, 2.5, 5];
x2 = [0, 0, 1, 2, 3];
x3 = [-1, 2, 3, 2, 1];

n = -2:2;

subplot(3,2,1);
stem(n, x1);
xlabel("Time");
ylabel("Amplitude");
title("Input Signal - 1");

subplot(3,2,2);
stem(n, x2);
xlabel("Time");
ylabel("Amplitude");
title("Input Signal - 2");

subplot(3,2,3);
stem(n, x3);
xlabel("Time");
ylabel("Amplitude");
title("Input Signal - 3");

subplot(3,2,4);
y1 = x1 + x2;
stem(n, y1);
xlabel("Time");
ylabel("Amplitude");
title("Addition");

subplot(3,2,5);
y2 = x1 - x2;
stem(n, y2);
xlabel("Time");
ylabel("Amplitude");
title("Subtraction");

subplot(3,2,6);
y3 = x1 .* x2;
stem(n, y3);
xlabel("Time");
ylabel("Amplitude");
title("Multiplication");
