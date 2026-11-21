clc;
clear all;
close all;

n = 0:31;
a = 1;
f = 1/16;
phi = 0;

y = a*sin(2*pi*f*n + phi);

stem(n,y,'filled');
grid on;
xlabel('Sample Number');
ylabel('Amplitude');
title('Discrete Time Sine Wave');
legend('2400040454');
axis([0 31 -1.2 1.2]);
