pkg load signal;
close all;
clear all;
clc;

filename = 'capturingDump/gqrx_20240327_110612_100900000_1800000_fc.raw';

fileID = fopen(filename, 'rb');
dataIQ = fread(fileID, [2, Inf], 'float32');
fclose(fileID);
I = dataIQ(1,:);
Q = dataIQ(2,:);

C = I + 1i * Q;

% Calcule a FFT do sinal complexo e aplique fftshift
fft_C = fftshift(fft(C));

fs = 1.8e6; % Freqüência de amostra
N = length(C);
frequencies = (-N/2 : N/2-1) * fs / N;

figure;
plot(frequencies, abs(fftshift(fft(C))));
xlabel('Frequência (Hz)');
title('FFT do sinal');
xlim([-fs/2 fs/2]);

