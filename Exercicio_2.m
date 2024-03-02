pkg load signal;
clc
clear all
close all



A1 = 6;
A2 = 5/3;
A3 = 1;

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

ordem = 1000;
f1_cut = 2000;
f2_cut = 4000;


filtro_pb_t = fir1(ordem, (f1_cut*2)/fs);
filtro_pa_t = fir1(ordem,'high', (f2_cut*2)/fs);
filtro_pf_t = fir1(ordem, [(f1_cut*2)/fs (f2_cut*2)/fs]);

y1_t = filter(filtro_pa_t, 1 ,s_t);
y2_t = filter(filtro_pb_t, 1 ,s_t);
y3_t = filter(filtro_pf_t, 1 ,s_t);


%Transformando no Dominio da Frequencia
figure(1);
S_f = fft(s_t)/length(s_t);
S_f = fftshift(S_f);
passo_f = 1/t_final;
f = [-fs/2:passo_f:fs/2];

% Plot no Dominio do tempo
figure(2)
plot(t,s_t)
xlim([0 3*T])

% Plot dos filtros
figure(3)
subplot(211)
stem(filtro_pb_t)
subplot(212)
plot(t,y1_t)
xlim([0 5*(1/f1)]);
