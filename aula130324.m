pkg load signal;
clear all;
close all;
clc;

[sinal1, Fs] = audioread('audio-1.wav');
fcc = 10e3;
Ac = 1 ;
duracao = length(sinal1)/Fs;
Ts = 1/Fs;
t = [0:Ts:duracao-Ts];

[sinal2, Fs] = audioread('audio-2.wav');


sinal1 = transpose(sinal1);
sinal2 = transpose(sinal2);
sinal2 = sinal2(1:length(sinal1));



c1_t = Ac*cos(2*pi*fcc*t);
c2_t = -Ac*sin(2*pi*fcc*t);

sinal1_f = fftshift(fft(sinal1)/length(sinal1));
sinal2_f = fftshift(fft(sinal2)/length(sinal2));


s1_t = sinal1 .* c1_t;
s2_t = sinal2 .* c2_t;


passo_f = 1/duracao;
f = [-Fs/2:passo_f:Fs/2 - passo_f];


s1_f = fftshift(fft(s1_t)/length(s1_t));
s2_f = fftshift(fft(s2_t)/length(s2_t));

y_t = s1_t + s2_t;
y_f = fftshift(fft(y_t)/length(y_t));

audiowrite('audio-y.wav',y_t,Fs);

sa_t = y_t .* c1_t;
sb_t = y_t .* c2_t;

sa_f = fftshift(fft(sa_t)/length(sa_t));
sb_f = fftshift(fft(sb_t)/length(sb_t));

filtro_pb = [zeros(1, (length(f) - 2*Fs)/2 ) ones(1,2*Fs) zeros(1, (length(f) - 2*Fs)/2)];

ya_f = sa_f .* filtro_pb;
yb_f = sb_f .* filtro_pb;

ya_t = ifft(ifftshift(ya_f)) * length(sa_f);
yb_t = ifft(ifftshift(yb_f)) * length(sa_f);

audiowrite('audio-a.wav',ya_t,Fs);
audiowrite('audio-b.wav',yb_t,Fs);


figure(1)
subplot(211);
plot(t,sinal1);
title("Sinal 1 - original");

subplot(212);
plot(t,sinal2);
title("Sinal 2 - original");

figure(2)
subplot(411);
plot(f,abs(sinal1_f));
title("Sinal 1 - original");
subplot(412);
plot(f,abs(s1_f));
title("Sinal 1 - Deslocado (Modulando)");

subplot(413);
plot(f,abs(sinal2_f));
title("Sinal 2 - original");
subplot(414);
plot(f,abs(s2_f));
title("Sinal 2 - Deslocado (Modulando");

figure(3)
subplot(211)
plot(t,y_t);
title("Sinal Resultante - Dominio do tempo");
subplot(212)
plot(f,abs(y_f));
title("Sinal Resultante - Dominio da frequência");

figure(4)
subplot(211);
plot(f,abs(sa_f));
title("Sinal 1 - Deslocado (Demodulando)");
subplot(212);
plot(f,abs(sb_f));
title("Sinal 2 - Deslocado (Demodulando)");

figure(5)
subplot(411);
plot(f,abs(sinal1_f));
title("Sinal 1 - original");

subplot(412);
plot(f,abs(ya_f));
title("Sinal 1 - Pós demodulado");

subplot(413);
plot(f,abs(sinal2_f));
title("Sinal 2 - original");

subplot(414);
plot(f,abs(yb_f));
title("Sinal 2 - Pós demodulado");
