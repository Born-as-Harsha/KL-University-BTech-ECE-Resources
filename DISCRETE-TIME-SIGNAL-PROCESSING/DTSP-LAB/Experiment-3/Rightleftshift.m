clc;
clear all;
close all;

n = 0:1:6;
x = [1, 2, 3, 4, 5, 6, 7];

nr = n + 2;
nl = n - 2;

subplot(3,1,1);
stem(n, x);
xlabel('Time');
ylabel('Amplitude');
title('Input Signal');

subplot(3,1,2);
stem(nr, x);
xlabel('Time');
ylabel('Amplitude');
title('Right Shift');

subplot(3,1,3);
stem(nl, x);
xlabel('Time');
ylabel('Amplitude');
title('Left Shift');
