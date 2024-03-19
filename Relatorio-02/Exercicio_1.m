pkg load signal
close all;
clear all;
clc;

Am = 1;
Ac = 1;

fm = 2e3;
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
fm1 = 0.25 ;
fm2 = 0.5 ;
fm3 = 0.75 ;
fm4 = 1;
fm5 = 1.5 ;

s1_deslocado = m_t + fm1;
s2_deslocado = m_t + fm2;
s3_deslocado = m_t + fm3;
s4_deslocado = m_t + fm4;
s5_deslocado = m_t + fm5;

t1c_t = s1_deslocado .* c_t;
t2c_t = s2_deslocado .* c_t;
t3c_t = s3_deslocado .* c_t;
t4c_t = s4_deslocado .* c_t;
t5c_t = s5_deslocado .* c_t;

%--------------------------------------------------------------------------------------------------------------------------------
% Mudança de dominio para frequência
M_f = fftshift(fft(m_t)/length(m_t));
C_f = fftshift(fft(c_t) / length(c_t));

T1C_f = fftshift(fft(t1c_t) / length(t1c_t));
T2C_f = fftshift(fft(t2c_t) / length(t2c_t));
T3C_f = fftshift(fft(t3c_t) / length(t3c_t));
T4C_f = fftshift(fft(t4c_t) / length(t4c_t));
T5C_f = fftshift(fft(t5c_t) / length(t5c_t));

SC_f = fftshift(fft(sc_t) / length(sc_t));

%Plot 1 - PLOT DOS SINAIS Portadora e Sinal -------------------------------------------------------------------------------------------------------
figure(1)
subplot(411)
plot(t,m_t,"r")
xlim([0 3*T])
title("m(t)")

subplot(412)
plot(f,abs(M_f),"r")
xlim([-fs fs])
title("M(f)")

subplot(413)
plot(t,c_t,"g")
xlim([0 3*T])
title("c(t)")

subplot(414)
plot(f,abs(C_f),"g")
xlim([-fs fs])
title("C(f)")

%Plot 1 - PLOT DOS SINAIS DSB-------------------------------------------------------------------------------------------------------
figure(2)
subplot(211)
plot(t,t1c_t,"k")
xlim([0 3*T])
title("am-dsb-tc-0.25 (t)")

subplot(212)
plot(f,abs(T1C_f),"k")
xlim([-fs fs])
title("am-dsb-tc-0.25 (f)")

figure(4)
subplot(211)
plot(t,t2c_t,"k")
xlim([0 3*T])
title("am-dsb-tc-0.5 (t)")

subplot(212)
plot(f,abs(T2C_f),"k")
xlim([-fs fs])
title("am-dsb-tc-0.5 (f)")

figure(5)
subplot(211)
plot(t,t3c_t,"k")
xlim([0 3*T])
title("am-dsb-tc-0.75 (t)")

subplot(212)
plot(f,abs(T3C_f),"k")
xlim([-fs fs])
title("am-dsb-tc-0.75 (f)")

figure(6)
subplot(211)
plot(t,t4c_t,"k")
xlim([0 3*T])
title("am-dsb-tc-1.00 (t)")

subplot(212)
plot(f,abs(T4C_f),"k")
xlim([-fs fs])
title("am-dsb-tc-1.00 (f)")

figure(7)
subplot(211)
plot(t,t5c_t,"k")
xlim([0 3*T])
title("am-dsb-tc-1.25 (t)")

subplot(212)
plot(f,abs(T5C_f),"k")
xlim([-fs fs])
title("am-dsb-tc-1.25 (f)")

##
##figure(7)
##subplot(211)
##plot(t,sc_t,"b")
##xlim([0 3*T])
##title("am-dsb-sc (t)")
##
##subplot(212)
##plot(f,abs(SC_f),"b")
##xlim([-fs fs])
##title("am-dsb-sc (f)")
##



%--------------------------------------------------------------------------------------------------------------------------------




filtro_pb_t = fir1(80,(fm*2)/fs);

sc_t_demod = sc_t;

sc_t_filtrado = filter(filtro_pb_t,1,sc_t_demod);
sc_f_filtrado = fftshift(fft(sc_t_filtrado ));

figure(8)
subplot(211)
plot(t,sc_t_filtrado,"b")
xlim([0 3*T])
title("am-dsb-sc (t) - filtrado")

subplot(212)
plot(f,abs(sc_t_filtrado));
xlim([-fs fs])

%--------------------------------------------------------------------------------------------------------------------------------




filtro_pb_t = fir1(80,(fm*2)/fs);

tc_t_demod = t5sc_t .* c_t;


tc_t_filtrado = filter(filtro_pb_t,1,tc_t_demod);
tc_f_filtrado = fftshift(fft(tc_t_filtrado ));

figure(9)
subplot(211)
plot(t,tc_t_filtrado,"b")
xlim([0 3*T])
title("am-dsb-tc(t)-1.25 - filtrado")

subplot(212)
plot(f,abs(tc_t_filtrado));
xlim([-fs fs])

