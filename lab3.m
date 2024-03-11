pkg load signal;
close all;
clc;
clear all;

Am_t = 1;
Ac_t = 1;

fm = 1e3;
fc = 10e3;

fs = 10*fc
Ts = 1/fs;
T = 1/fm;

t_final = 2

t = [0:Ts:t_final];

passo_f = 1/t_final;
f = [-fs/2:passo_f:fs/2];


xm_t = Am_t * cos(2*pi*fm*t);
xc_t = Ac_t * cos(2*pi*fc*t);

xr_t = xm_t .* xc_t;
rr_t = xr_t .* xc_t;


xm_f = fft(xm_t)/length(xm_t);
xm_f = fftshift(xm_f);
xc_f = fft(xc_t)/length(xc_t);
xc_f = fftshift(xc_f);
xr_f = fft(xr_t)/length(xr_t);
xr_f = fftshift(xr_f);

rr_f = fft(rr_t)/length(rr_t);
rr_f = fftshift(rr_f);

amdsbtc_t = Am_t.*(1 + cos(2*pi*fm*t)).*Ac_t.*cos(2*pi*fc*t);

amdsbtc_f = fft(amdsbtc_t)/length(amdsbtc_t);
amdsbtc_f = fftshift(amdsbtc_f);

f_cut = 2000;
filtro_pb = [zeros(1, 96e3) ones(1,8001) zeros(1, 96e3)];

m_f_pb = rr_f .* filtro_pb;
m_t_pb = ifft(m_f_pb)/length(m_f_pb);



figure(1)
subplot(311)
plot(t,xm_t,"r")
xlim([0 3*T])

subplot(312)
plot(t,xc_t,"g")
xlim([0 3*T])

subplot(313)
plot(t,xr_t,"b")
xlim([0 3*T])

figure(2)
subplot(511);
plot(f,abs(xm_f),"r")
title("X_m(f)");
xlim([-3*fc 3*fc])

subplot(512);
plot(f,abs(xc_f),"g")
title("X_c(f)");
xlim([-3*fc 3*fc])

subplot(513);
plot(f,abs(xr_f),"b")
title("X_r(f)");
xlim([-3*fc 3*fc])

subplot(514);
plot(f,abs(rr_f),"k")
title("X_r(f)");
xlim([-3*fc 3*fc])

subplot(515);
plot(f,abs(m_f_pb),"c")
title("X_r(f)");
xlim([-3*fc 3*fc])

figure(3)
subplot(211)
plot(t,amdsbtc_t,"r")
xlim([0 3*T])

subplot(212);
plot(f,abs(amdsbtc_f),"r")
title("X_m(f)");
xlim([-3*fc 3*fc])


