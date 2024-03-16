pkg load signal
close all;
clear all;
clc;

Am = 1;
Ac = 1;

fm = 1e3;
fc = 30e3;

fs = 10*fc;
Ts = 1/fs;
t_final = 2;
T = 1/fm;

t = [0:Ts:t_final];

passo_f = 1/t_final;
f = [-fs/2:passo_f:fs/2];

m_t = Am * cos(2*pi*fm*t); % Sinal
c_t = Ac * cos(2*pi*fc*t); % Portadora

%DSB-SC
rc_t = m_t .* c_t;
sc_t = rc_t .* c_t;
%sc_t = Ac.*cos(2*pi*fc*t).*m_t;

%DSB-TC
tc_t = Am.*(1 + cos(2*pi*fm*t)).*Ac.*cos(2*pi*fc*t);

%Plot 1 - PLOT DOS SINAIS -------------------------------------------------------------------------------------------------------
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
plot(t,tc_t,"k")
xlim([0 3*T])
title("am-dsb-tc (t)")

subplot(414)
plot(t,sc_t,"b")
xlim([0 3*T])
title("am-dsb-sc (t)")

%--------------------------------------------------------------------------------------------------------------------------------
% Mudança de dominio para frequência
M_f = fftshift(fft(m_t)/length(m_t));
C_f = fftshift(fft(c_t) / length(c_t));
TC_f = fftshift(fft(tc_t) / length(tc_t));
SC_f = fftshift(fft(sc_t) / length(sc_t));
%Plot 1 - PLOT DOS SINAIS -------------------------------------------------------------------------------------------------------
figure(2)
subplot(411)
plot(f,abs(M_f),"r")
xlim([-fs fs])
title("M(f)")

subplot(412)
plot(f,abs(C_f),"g")
xlim([-fs fs])
title("C(f)")

subplot(413)
plot(f,abs(TC_f),"k")
xlim([-fs fs])
title("am-dsb-tc (f)")

subplot(414)
plot(f,abs(SC_f),"b")
xlim([-fs fs])
title("am-dsb-sc (f)")

%--------------------------------------------------------------------------------------------------------------------------------



ordem = 80;
f_cut = 1e3;
filtro_pb_t = fir1(ordem,(f_cut*2)/fs);

sc_t_filtrado = filter(filtro_pb_t,1,sc_t);
sc_f_filtrado = fftshift(fft(sc_t_filtrado ))/ length(sc_t_filtrado );

figure(3)
subplot(211)
plot(t,sc_t_filtrado,"b")
xlim([0 3*T])
title("am-dsb-sc (t)")

subplot(212)
plot(f,abs(sc_t_filtrado));
xlim([-fs fs])

