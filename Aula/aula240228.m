clear all
clc
close all
pkg load signal

fs = 100e3;
f1 = 1e3;
f2 = 3e3;

ts = 1/fs;
t = [0:ts:1];

A1 = 10;
A2 = 5;

x1_t = A1*cos(2*pi*f1*t);
x2_t = A2*cos(2*pi*f2*t);
s_t = x1_t + x2_t;


passo_f = 1;
f = [ -fs/2:fs/2];
S_f = fftshift(fft(s_t)/length(s_t));

filtro_pb = [zeros(1, 48e3) ones(1,4001) zeros(1, 48e3)];

ordem = 80;
f_cut = 1000;

filtro_pb_t = fir1(ordem, (f_cut*2)/fs);



Y_f = S_f .* filtro_pb;

y_t = fft(ifftshift(Y_f))*length(Y_f);
y1_t = filter(filtro_pb_t, 1 ,s_t);

figure(1)
subplot(211)
plot(t,s_t)
xlim([0 5*(1/f1)])
subplot(212)
plot(f,abs(S_f));

figure(2)
subplot(311)
plot(f,abs(S_f));
ylim([0 1.2*A2]);

subplot(312)
plot(f,filtro_pb);
ylim([0 1.2]);
subplot(313)
plot(f,Y_f)
ylim([0 1.2*A2]);

figure(3)
subplot(211)
plot(f,Y_f)
ylim([0 1.2*A2]);
subplot(212)
plot(t,y_t);
xlim([0 5*(1/f1)]);

figure(4)
subplot(211)
stem(filtro_pb_t)
subplot(212)
plot(t,y1_t)
xlim([0 5*(1/f1)]);

figure(5)
freqz(filtro_pb_t)
