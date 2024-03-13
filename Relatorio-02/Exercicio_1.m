pkg load signal
close all;
clear all;
clc;

Am = 1;
Ac = 1;

fm = 1e3;
fc = 10e3;

fs = 10*fc;
Ts = 1/fs;
t_final = 2;
T = 1/fm;

t = [0:Ts:t_final];

passo_f = 1/t_final;
f = [-fs/2:passo_f:fs/2];

m_t = Am * cos(2*pi*fm*t);
c_t = Ac * cos(2*pi*fc*t);

s_t = m_t .* c_t;
r_t = r_t .* c_t;

am_dsb_tc_t = Am.*(1 + cos(2*pi*fm*t)).*Ac.*cos(2*pi*fc*t);
am_dsb_sc_t = Ac.*cos(2*pi*fc*t).*m_t;

am_dsb_tc_f = fft(am_dsb_tc_t)/length(am_dsb_tc_t);
am_dsb_tc_f = fftshift(am_dsb_tc_f);

am_dsb_sc_f = fft(am_dsb_sc_t)/length(am_dsb_sc_t);
am_dsb_sc_f = fftshift(am_dsb_sc_f);


ordem = 80;
f_cut = 1e3;
filtro_pb_t = fir1(ordem,(f_cut*2)/fs);


ordem = 80;
f_cut = 1e3;
filtro_pb_t = fir1(ordem,(f_cut*2)/fs);
am_dsb_tc_f_filtrado =


am_dsb_sc_t_filtrado = filter(filtro_pb_t,1,am_dsb_sc_t);
am_dsb_sc_f_filtrado = fftshift(fft(am_dsb_sc_t_filtrado ))/ length(am_dsb_sc_t_filtrado );

figure(1)
subplot(411)
plot(t,m_t,"r")
xlim([0 3*T])
title("m(t)")

subplot(412)
plot(t,c_t,"g")
xlim([0 3*T])
title("c(t)")

subplot(413)
plot(t,am_dsb_tc_t,"k")
xlim([0 3*T])
title("am-dsb-tc (t)")

subplot(414)
plot(t,am_dsb_sc_t,"b")
xlim([0 3*T])
title("am-dsb-sc (t)")

figure(2)
subplot(211)
plot(f,am_dsb_tc_f)
xlim([-3*fc 3*fc])

subplot(212)
plot(f,am_dsb_sc_f)
xlim([-3*fc 3*fc])

figure(3)
freqz(filtro_pb_t)

figure(4)
subplot(211)
plot(t,am_dsb_sc_t_filtrado,"k")
xlim([0 3*T])
subplot(212)
plot(f,am_dsb_sc_f_filtrado)
xlim([-3*fc 3*fc])

