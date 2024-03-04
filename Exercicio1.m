pkg load signal;
clc
clear all
close all



A1 = 6;
A2 = 2;
A3 = 4;

f1 = 1000;
f2 = 3000;
f3 = 5000;

fs = 30*f3;
Ts = 1/fs;
T = 1/f1;

t_final = 2
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

grid on

%Potencia media do sinal S
Pot_media_s = norm(s_t).^2/length(s_t)

% Plot Densidade Espectral de Potencia do sinal
figure(3)
pwelch(s_t)
