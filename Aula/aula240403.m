clear all;
close all;
clc;

Ac = 1;
Am = 1;

fm = 15e3;
fc = 150e3;
fs = 20.*fc;
kf = 75e3

df = 75e3

beta = 5;

Ts = 1/fs;
T = 1/fm;
t_final = 1;
t = [0:Ts:t_final];


passo_f = 1;
f = [ -fs/2:fs/2];

m_t = Am.*cos(2.*fm.*pi.*t);
c_t = Ac.*cos(2.*fc.*pi.*t);

s_t = Ac.*cos(2*pi*fc*t + 2*pi*kf*cumsum(m_t));

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

derivada_FM = [diff(s_t) 0]*fs;
y_t = derivada_FM/(2*pi*kf);

figure(3)
plot(t,y_t);
xlim([0 3*T]);
hold on;
plot(t,m_t,'r')
