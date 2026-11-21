
clc;
clear;
close all;

pkg load signal;

x = [1 2 2];
h = [1 2 3 4];

N = 4;

x = [x 0];

% Circular convolution
y = cconv(x,h,N);

disp('Circular Convolution Output:');
disp(y);

figure(1);

subplot(3,1,1);
stem(0:3,x,'r','filled','LineWidth',1.5);
xlabel('Time index --->');
ylabel('Magnitude --->');
title('Sequence x[n]');
grid on;

subplot(3,1,2);
stem(0:3,h,'b','filled','LineWidth',1.5);
xlabel('Time index --->');
ylabel('Magnitude --->');
title('Sequence h[n]');
grid on;

subplot(3,1,3);
stem(0:3,y,'m','filled','LineWidth',1.5);
xlabel('Time index --->');
ylabel('Magnitude --->');
title('Circular Convolution y[n]');
grid on;

drawnow;

