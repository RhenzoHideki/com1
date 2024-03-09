pkg load signal;
clc
clear all
close all

f1 = 1e3;
f2 = 3e3;
f3 = 5e3;
fs = 10*f3

Ts = 1/fs;
t_final = 2
T = 1/f1;


A1 = 5;
A1 = 5;
A2 = 5/3;
A3 = 1;

t = [0:Ts:t_final];

x1_t = A1*cos(2*pi*f1*t);
x2_t = A2*cos(2*pi*f2*t);
x3_t = A3*cos(2*pi*f3*t);

s_t = x1_t + x2_t + x3_t;

%Transformando no Dominio da Frequencia
X1_f = fft(x1_t)/length(x1_t);
X1_f = fftshift(X1_f);

X2_f = fft(x2_t)/length(x2_t);
X2_f = fftshift(X2_f);

X3_f = fft(x3_t)/length(x3_t);
X3_f = fftshift(X3_f);

S_f = fft(s_t)/length(s_t);
S_f = fftshift(S_f);


passo_f = 1/t_final;
f = [-fs/2:passo_f:fs/2];

filtro_pb = [zeros(1, 46e3) ones(1,8001) zeros(1, 46e3)];
filtro_pa = [ones(1, 42e3) zeros(1,16001) ones(1, 42e3)];
filtro_pf = [zeros(1, 42e3) ones(1,4000) zeros(1,8001) ones(1,4000) zeros(1, 42e3)];


S_pb_f = (S_f .* filtro_pb);
S_pa_f = (S_f .* filtro_pa);
S_pf_f = (S_f .* filtro_pf);

S_pb_t = fft(fftshift(S_pb_f))*length(S_pb_f);
S_pa_t = fft(fftshift(S_pa_f))*length(S_pa_f);
S_pf_t = fft(fftshift(S_pf_f))*length(S_pf_f);

%-------------------------------------------------------------------------------------------
%Transformando no Dominio da Frequencia
figure(1);
S_f = fft(s_t)/length(s_t);
S_f = fftshift(S_f);
passo_f = 1/t_final;
f = [-fs/2:passo_f:fs/2];

% Plot no Dominio do tempo
% Subplot X1
figure(1)
subplot(2,2,1);
plot(t,x1_t,"r")
title("x_1(t)");
xlim([0 3*T])

%Subplot X2
subplot(2,2,2);
plot(t,x2_t,"g")
title("x_2(t)");
xlim([0 3*T])

%Subplot X3
subplot(2,2,3);
plot(t,x3_t,"b")
title("x_3(t)");
xlim([0 3*T])

%Subplot S_t
subplot(2,2,4);
plot(t,s_t,"k")
title("s(t)");
xlim([0 3*T])

% Plot no Dominio da Frequencia
% Subplot X1
figure(2)
subplot(2,2,1);
plot(f,abs(X1_f),"r")
title("X_1(f)");
xlim([-2*f3 2*f3])

%Subplot X2
subplot(2,2,2);
plot(f,abs(X2_f),"g")
title("X_2(f)");
xlim([-2*f3 2*f3])

%Subplot X3
subplot(2,2,3);
plot(f,abs(X3_f),"b")
title("X_3(f)");
xlim([-2*f3 2*f3])

subplot(2,2,4);
plot(f,abs(S_f),"k")
title("S(f)");
xlim([-2*f3 2*f3])

%-------------------------------------------------------------------------------------------
%Filtros
figure(3)
subplot(3,1,1);
plot(f,filtro_pb,"r");
ylim([0 1.2]);
title("Filtro Passa Baixa 2kHz");

subplot(3,1,2);
plot(f,filtro_pa,"g");
ylim([0 1.2]);
title("Filtro Passa Alta 4kHz");


subplot(3,1,3);
plot(f,filtro_pf,"b");
ylim([0 1.2]);
title("Filtro Passa Faixa 2kHz-4kHz");

%-------------------------------------------------------------------------------------------
%Sinal Filtrado
figure(4)
subplot(3,2,1);
plot(f,S_pb_f,"r");
xlim([-2*f3 2*f3])
title("Sinal com Filtro Passa Baixa na Frequencia");
subplot(3,2,2);
plot(t,S_pb_t,"r");
xlim([0 3*T])
title("Sinal com Filtro Passa Baixa no Tempo");

subplot(3,2,3);
plot(f,S_pa_f,"r");
xlim([-2*f3 2*f3])
title("Sinal com Filtro Passa Alta na Frequencia");
subplot(3,2,4);
plot(t,S_pa_t,"r");
xlim([0 3*T])
title("Sinal com Filtro Passa Alta no Tempo");

subplot(3,2,5);
plot(f,S_pf_f,"r");
xlim([-2*f3 2*f3])
title("Sinal com Filtro Passa Baixa na Frequencia");
subplot(3,2,6);
plot(t,S_pf_t,"r");
xlim([0 3*T])
title("Sinal com Filtro Passa Baixa no Tempo");


