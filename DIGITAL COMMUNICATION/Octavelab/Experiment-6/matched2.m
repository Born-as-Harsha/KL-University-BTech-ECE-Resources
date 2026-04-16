function matched_filter_srrc()

clc; clear; close all;

overSampling_Factor = 8;
Input_bit = [1];

% -------- Oversampling (manual, Octave safe) --------
Input_bit_os = zeros(1, length(Input_bit)*overSampling_Factor);
Input_bit_os(1:overSampling_Factor:end) = Input_bit;

alpha = 0.4;   % Roll-off factor

% -------- SRRC Pulse --------
pt = srrc(overSampling_Factor, alpha);

% -------- Transmitter Filter --------
output_of_srrc_filter = conv(Input_bit_os, pt);

figure;
stem(output_of_srrc_filter);
title('Response of SRRC Filter at Tx side');
xlabel('Samples');
ylabel('Amplitude');

% -------- Add AWGN --------
output_of_srrc_filter = d_awgn(output_of_srrc_filter, 100);

% -------- Matched Filter at Receiver --------
y = conv(output_of_srrc_filter, pt);

figure;
stem(y);
title('Matched filter (SRRC) response at Rx side');
xlabel('Samples');
ylabel('Amplitude');

% -------- Truncate unwanted portion --------
midSample = length(-4:1/overSampling_Factor:4);
y_truncated = y(midSample:end);

% -------- Downsample (manual Octave safe) --------
y_down = y_truncated(1:overSampling_Factor:end);

figure;
stem(y_down);
title('Down sampled output (ADC conversion and Sampling)');
xlabel('Samples');
ylabel('Amplitude');

end


% =====================================================
% SRRC Function
% =====================================================
function response = srrc(os_factor, roll_off)

a = roll_off;
t = -4:1/os_factor:4;
p = zeros(1,length(t));

for i = 1:length(t)

    if t(i) == 0
        p(i) = (1-a) + 4*a/pi;

    elseif abs(t(i)) == 1/(4*a)
        p(i) = (a/sqrt(2)) * ...
            ((1+2/pi)*sin(pi/(4*a)) + ...
            (1-2/pi)*cos(pi/(4*a)));

    else
        p(i) = (sin(pi*t(i)*(1-a)) + ...
            4*a*t(i).*cos(pi*t(i)*(1+a))) ./ ...
            (pi*t(i).*(1-(4*a*t(i)).^2));
    end

end

% Normalize to unit energy
response = p ./ sqrt(sum(p.^2));

end


% =====================================================
% AWGN Function
% =====================================================
function y = d_awgn(x, snr_db)

signal_power = sum(abs(x).^2) / length(x);

snr_linear = 10^(snr_db / 10);

noise_power = signal_power / snr_linear;

noise = sqrt(noise_power) * randn(size(x));

y = x + noise;

end

