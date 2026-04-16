clc;                        % Clear command window
clear
close all;

a=2;                        % Amplitude of input signal
t=0:2*pi/50:2*pi;           % Time axis
x=a*sin(2*pi/10*t);         % Input sinusoidal signal (moderate frequency)

l=length(x);                % Length of input signal
plot(x,'r','linewidth',2);  % Plot input signal

delta=0.2;                  % Step size for delta modulation
hold on
xn=0;                       % Initial approximation value

for i=1:l                   % Delta modulation loop
    if x(i)>xn(i)           % Comparator operation
        d(i)=1;             % Output bit = 1
        xn(i+1)=xn(i)+delta;% Step increment
    else
        d(i)=0;             % Output bit = 0
        xn(i+1)=xn(i)-delta;% Step decrement
    end
end

stairs(xn,'b','linewidth',2)% Staircase approximation
hold on
plot(xn,'g','linewidth',2); % Delta modulated signal

xlabel('TIME');
ylabel('AMPLITUDE');
title('DELTA MODULATION','fontsize',18);
legend('input signal','staircase appproximaton','delta modulated signal');
grid on

