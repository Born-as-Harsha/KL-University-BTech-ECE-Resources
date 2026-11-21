clc;
clear all;
close all;

x = [1, 2, 3, 4];
h = [3, 4, 5, 2];

y = conv(x, fliplr(h));

n1 = 0:1:3;
n2 = 0:1:3;
n3 = -3:1:3;

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
stem(n3,y);
xlabel('Time');
ylabel('Amplitude');
title('Cross Correlation of Two Signals');
