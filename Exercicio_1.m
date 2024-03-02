pkg load signal;
clc
clear all
close all



A1 = 6;
A2 = 2;
A3 = 4;

f1 = 1000;
f2 = 3000;
f3 = 5000;

fs = 50*f2;
Ts = 1/fs;
T = 1/f1;

t_final = 2
t = [0:Ts:t_final];

x1_t = A1*cos(2*pi*f1*t);
x2_t = A2*cos(2*pi*f2*t);
x3_t = A3*cos(2*pi*f3*t);



s_t = x1_t + x2_t + x3_t;

%Transformando no Dominio da Frequencia
S_f = fft(s_t)/length(s_t);
S_f = fftshift(S_f);
passo_f = 1/t_final;
f = [-fs/2:passo_f:fs/2];

% Plot no Dominio do tempo
figure(1)
plot(t,s_t)
xlim([0 3*T])

% Plot no Dominio da Frequencia
figure(2)
plot(f,abs(S_f))
grid on

%Potencia media do sinal S
Pot_media_s = norm(s_t)

% Plot Densidade Espectral de Potencia do sinal
figure(3)
pwelch(s_t)
