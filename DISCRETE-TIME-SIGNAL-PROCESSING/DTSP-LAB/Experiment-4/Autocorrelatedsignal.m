clc;
clear all;
close all;

x = [1, 2, 3, 4];

y = conv(x, fliplr(x));

n1 = 0:1:3;
n2 = -3:1:3;

subplot(2,1,1);
stem(n1,x);
xlabel('Time');
ylabel('Amplitude');
title('First Input Signal');

subplot(2,1,2);
stem(n2,y);
xlabel('Time');
ylabel('Amplitude');
title('Autocorrelation of Signal');
