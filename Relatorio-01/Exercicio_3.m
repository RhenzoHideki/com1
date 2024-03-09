pkg load signal;
clc
clear all
close all

fs = 10e3;
Ts = 1/fs;
t_final = 1;
t = 0:Ts:t_final;

ruido = randn(size(t));
passo_f = 1;
f = (-fs/2) : passo_f : (fs/2);

Ruido_f = fftshift(fft(ruido)/length(ruido));

ac = xcorr(ruido);

t_ac = (-length(ruido)+1:length(ruido)-1) * Ts;

filtro = fir1(50, (1000*2)/fs);

sinal_filtrado = filter(filtro, 1, ruido);

Sinal_filtrado_f = fft(sinal_filtrado) / length(sinal_filtrado);


figure(1);
hist(ruido,100);

figure(2);
subplot(2,1,1);
plot(t, ruido);

subplot(2,1,2);
plot(f, Ruido_f);

figure(3);
plot(t_ac, ac);

figure(4);
freqz(filtro);

figure(5);
subplot(2,1,1);
plot(t, sinal_filtrado);
title('Sinal Filtrado (Domínio do Tempo)');

subplot(2,1,2);
plot(f, fftshift(abs(Sinal_filtrado_f)));
title('Sinal Filtrado (Domínio da Frequência)');
xlabel('Frequência');


figure(6);
hist(sinal_filtrado, 500);
title('Histograma do Sinal Filtrado');
