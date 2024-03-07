pkg load signal;
clc
clear all
close all

% Gerar um vetor representando um ruído com distribuição
% normal utilizando a função 'randn' do matlab. Gere 1 segundo
% de ruído considerando um tempo de amostragem de 1/10k.

fs = 10e3;
Ts = 1/fs;
t_final = 2;
t = 0:Ts:t_final-Ts; % Vetor de tempo

ruido = randn(size(t));

% Plotar o histograma do ruído para observar a distribuição
% Gaussiana. Utilizar a função 'histogram'
figure(1);
% histogram(ruido, 50);
hist(ruido, 50);

% Plotar o ruído no domínio do tempo e da frequência
figure(2);
subplot(2,1,1);
plot(t, ruido);

passo_f = 1/t_final;
f = (-fs/2) : passo_f : (fs/2 - passo_f);

subplot(2,1,2);
Ruido_f = fft(ruido) / length(ruido);
Ruido_f = fftshift(Ruido_f);
plot(f, Ruido_f);

% Utilizando a função 'xcorr', plote a função de autocorrelação do ruído
figure(3);
autocorrelacao = xcorr(ruido);
t_autocorr = (-length(ruido)+1:length(ruido)-1) * Ts;
plot(t_autocorr, autocorrelacao);

% Utilizando a função 'filtro=fir1(50,(1000*2)/fs)',
% realize uma operação de filtragem passa baixa do ruído.
filtro = fir1(50, (1000*2)/fs);
figure(4);
freqz(filtro);

% Plote, no domínio do tempo e da frequência, a saída
% do filtro e o histograma do sinal filtrado.
% Aplicar o filtro ao sinal de ruído
sinal_filtrado = filter(filtro, 1, ruido);

% Plotar a saída do filtro no domínio do tempo e da frequência
figure(5);
subplot(2,1,1);
plot(t, sinal_filtrado);
title('Sinal Filtrado (Domínio do Tempo)');

subplot(2,1,2);
Sinal_filtrado_f = fft(sinal_filtrado) / length(sinal_filtrado);
plot(f, fftshift(abs(Sinal_filtrado_f)));
title('Sinal Filtrado (Domínio da Frequência)');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

grid on;

% Plotar o histograma do sinal filtrado
figure(6);
hist(sinal_filtrado, 500);
title('Histograma do Sinal Filtrado');