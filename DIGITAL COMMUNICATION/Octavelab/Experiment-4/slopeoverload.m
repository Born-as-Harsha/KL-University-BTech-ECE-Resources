% case 2  → Slope Overload Distortion in Delta Modulation
clc;
clear
close all;

a=2;                        % Signal amplitude
t=0:2*pi/50:2*pi;           % Time axis
x=a*sin(2*pi/5*t);          % Higher frequency input (causes slope overload)

l=length(x);
plot(x,'r','linewidth',2);  % Input signal
delta=0.2;                  % Step size (insufficient for fast signal)
hold on

xn=0;                       % Initial approximation

for i=1:l                   % Delta modulation process
    if x(i)>xn(i)
        d(i)=1;             % Comparator output
        xn(i+1)=xn(i)+delta;% Increment step
    else
        d(i)=0;
        xn(i+1)=xn(i)-delta;% Decrement step
    end
end

stairs(xn,'b','linewidth',2)% Staircase output
hold on
plot(xn,'g','linewidth',2); % Delta modulated signal

xlabel('TIME');
ylabel('AMPLITUDE');
title('SLOPE OVERLOAD DISTORTION','fontsize',18);
legend('input signal','staircase appproximaton','slope overload distortedsignal');
grid on

