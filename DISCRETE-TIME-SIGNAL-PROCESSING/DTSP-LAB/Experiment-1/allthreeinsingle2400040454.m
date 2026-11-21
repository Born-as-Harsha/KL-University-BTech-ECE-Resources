clc;
clear all;
close all;

n = -3:1:3;

subplot(3,1,1);
y1 = [0 0 0 1 0 0 0];
stem(n,y1,'filled');
xlabel('Time');
ylabel('Amplitude');
title('Unit Impulse Signal');
legend('2400040454');
grid on;

subplot(3,1,2);
y2 = [0 0 0 1 1 1 1];
stem(n,y2,'filled');
xlabel('Time');
ylabel('Amplitude');
title('Unit Step Signal');
legend('2400040454');
grid on;

subplot(3,1,3);
stem(n,n,'filled');
xlabel('Time');
ylabel('Amplitude');
title('Ramp Signal');
legend('2400040454');
grid on;
