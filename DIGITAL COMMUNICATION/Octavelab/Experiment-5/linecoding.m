function unipolar_linecoding()

clc; clear; close all;

X = [1 0 1 1 1 0 0];
Tb = 1;                    % Bit duration
n = length(X);

% Create time axis (one sample per bit)
t = 0:Tb:n*Tb;

% ======================
% UNIPOLAR NRZ
% ======================
nrz = [X X(end)];          % Extend last value for stairs

figure;

subplot(2,1,1)
stairs(t, nrz, 'b', 'LineWidth', 2)
axis([0 n  -0.5 1.5])
grid on
title('Unipolar NRZ Line Coding')
xlabel('Time')
ylabel('Amplitude')

% ======================
% UNIPOLAR RZ
% ======================
t_rz = [];
rz = [];

for i = 1:n
    % First half of bit
    t_rz = [t_rz (i-1) (i-0.5)];
    rz   = [rz X(i) 0];

    % Second half
    t_rz = [t_rz (i-0.5) i];
    rz   = [rz 0 0];
end

subplot(2,1,2)
stairs(t_rz, rz, 'r', 'LineWidth', 2)
axis([0 n  -0.5 1.5])
grid on
title('Unipolar RZ Line Coding')
xlabel('Time')
ylabel('Amplitude')

end

