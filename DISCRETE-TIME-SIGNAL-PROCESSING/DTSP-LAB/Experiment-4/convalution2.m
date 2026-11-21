clc;
clear all;
close all;

x = [3, 1, 2, -1, 4, 2];
h = [2, 3, 0, -1, 2];

y = conv(x,h);

n1 = 0:1:5;
n2 = 0:1:4;
n = 0:1:9;

subplot(3,1,1);
stem(n1,x);
xlabel('Time');
ylabel('Amplitude');
title('First Input Signal');

subplot(3,1,2);
stem(n2,h);
xlabel('Time');
ylabel('Amplitude');
title('Second Input Signal');

subplot(3,1,3);
stem(n,y);
xlabel('Time');
ylabel('Amplitude');
title('Convolution of Two Signals');
