clc;
clear all;
close all;

n = 0:1:7;
x = [0, 1, 2, 3, 4, 5, 6, 7];

y = fliplr(x);
m = fliplr(n);

subplot(2,1,1);
stem(n, x);
xlabel('Time');
ylabel('Amplitude');
title('Input of the given signal');

subplot(2,1,2);
stem(-m, y);
xlabel('Time');
ylabel('Amplitude');
title('Folded Signal');
