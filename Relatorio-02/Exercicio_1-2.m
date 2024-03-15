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
r_t = s_t .* c_t;

dsb_tc = Ac *(1 + m_t) .* cos(2*pi*fc*t);




subplot(411);
plot(t, m_t);
title('Message Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0 3*T])


subplot(412);
plot(t, c_t);
title('Carrier Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0 3*T])


subplot(413);
plot(t, dsb_tc);
title('DSB-TC Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0 3*T])


subplot(414);
plot(t, s_t);
title('DSB-SC Modulated Signal');
xlabel('Time');
ylabel('Amplitude');
xlim([0 3*T])

