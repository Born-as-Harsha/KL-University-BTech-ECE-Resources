clc;                    % Clear command window
clear
close all;

a=2;                    % Amplitude of input signal
t=0:2*pi/50:2*pi;       % Time vector
x=a*sin(2*pi/20*t);     % Input sinusoidal signal

l=length(x);            % Length of input signal
plot(x,'r','linewidth',2);   % Plot input signal

delta=0.23;             % Step size for delta modulation
hold on
xn=0;                   % Initial approximation value

for i=1:l               % Delta modulation process
    if x(i)>xn(i)       % Comparator
        d(i)=1;         % Output bit = 1
        xn(i+1)=xn(i)+delta; % Increase step
    else
        d(i)=0;         % Output bit = 0
        xn(i+1)=xn(i)-delta; % Decrease step
    end
end

stairs(xn,'b','linewidth',2) % Staircase approximation
hold on
plot(xn,'g','linewidth',2);  % Delta modulated signal

xlabel('TIME');
ylabel('AMPLITUDE');
title('GRANULAR NOISE','fontsize',18);
legend('input signal','staircase appproximation','delta modulated signal');
grid on;

