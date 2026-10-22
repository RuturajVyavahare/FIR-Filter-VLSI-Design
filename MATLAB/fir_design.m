clc;
clear;
close all;

% FIR Filter Specifications
Fs = 48000;       % Sampling frequency in Hz
Fpass = 5000;     % Passband edge in Hz
Fstop = 8000;     % Stopband edge in Hz
N = 31;           % Filter order
numTaps = N + 1;

% Design Low-Pass FIR Filter
Wn = (Fpass + Fstop)/2 / (Fs/2);
h = fir1(N, Wn, 'low', hamming(numTaps));

% Display Coefficients
disp('FIR Filter Coefficients:');
disp(h);

% Plot Frequency Response
[H, f] = freqz(h, 1, 2048, Fs);

figure;
plot(f, 20*log10(max(abs(H), 1e-10)));
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('FIR Low-Pass Filter Frequency Response');
xlim([0 Fs/2]);

% Export Floating-Point Coefficients
writematrix(h(:), 'fir_coefficients.txt');

% Quantize Coefficients to Signed Q1.15
scale = 2^15;
h_fixed = round(h * scale);
h_fixed = min(max(h_fixed, -32768), 32767);

disp('Q1.15 Integer Coefficients:');
disp(h_fixed);

writematrix(h_fixed(:), 'fir_coefficients_q15.txt');

disp('FIR design completed.');