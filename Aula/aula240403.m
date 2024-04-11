clear all;
close all;
clc;



Am = 1;  % Amplitude da mensagem
fm = 10e3;  % Frequência da mensagem
T = 1 / fm;  % Período da mensagem

Ac = 1;  % Amplitude da portadora
fc = 150e3;  % Frequência da portadora

kf = 75e3;  % Sensibilidade de frequência


delta_f = kf * Am;  % Desvio de frequência
beta = delta_f / fm;  % Índice de modulação

fs = 50 * fc;  % Frequência de amostragem
Ts = 1 / fs;  % Período de amostragem
t = 0:Ts:1-Ts;  % Eixo do tempo

passo_f = 1;
f = [ -fs/2:(fs/2-1) ];

m_t = Am.*cos(2.*fm.*pi.*t);
c_t = Ac.*cos(2.*fc.*pi.*t);

k0 = 2*pi*kf;

s_t = Ac.*cos(2*pi*fc*t + Ts*k0*cumsum(m_t));

% derivada_FM = [diff(s_t) 0]*fs;
% s_t_demod = derivada_FM/(2*pi*kf)

figure(1)
subplot(311);
plot(t,m_t);
xlim([0 3*T]);

subplot(312);
plot(t,c_t);
xlim([0 3*T]);

subplot(313);
plot(t,s_t);
xlim([0 3*T]);

m_f = fftshift(fft(m_t)/length(m_t));
c_f = fftshift(fft(c_t)/length(c_t));
S_f = fftshift(fft(s_t)/length(s_t));

figure(2)
subplot(311);
plot(f,m_f);
xlim([-2*fc 2*fc]);

subplot(312);
plot(f,c_f);
xlim([-2*fc 2*fc]);

subplot(313);
plot(f,S_f);
xlim([-2*fc 2*fc]);

derivada_FM = [0 diff(s_t)]*fs;
y_t = derivada_FM/(2*pi*kf);

Y_f = fftshift(fft(y_t)/length(y_t));

figure(3)
subplot(211)
plot(t,y_t);
xlim([0 3*T]);
hold on;
plot(t,m_t,'r')
subplot(212);
plot(f,Y_f);
xlim([-2*fc 2*fc]);
