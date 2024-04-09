#import "../typst-ifsc/templates/article.typ": article


#show: doc => article(
  title: "Relatório 03",
  subtitle: "	Sistemas de comunicação I (COM029007)",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors:("Rhenzo Hideki Silva Kajikawa",),
  date: "17 de março de 2024",
  doc,
)

= Introdução

Este relatório apresenta as atividades realizadas em MATLAB para simular um modulador/demodulador de fase e quadratura (IQ). Além disso, são resumidas as seções 5.1, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9 e 5.10 do livro "Software Defined Radio Using MATLAB & Simulink and the RTL-SDR", que abordam conceitos fundamentais para a compreensão e implementação dessa técnica

= Conteúdo teórico
== 5.1 Real and Complex Signals — it’s all Sines and Cosines

Esta seção explora a representação de sinais reais e complexos na engenharia de sinais, utilizando a fórmula de Euler para simplificar matematicamente a manipulação de sinais em termos de exponenciais complexas. A representação complexa dos sinais facilita a análise matemática, mesmo operando com sinais reais no mundo físico.
== 5.4 Quadrature Modulation and Demodulation (QAM)

Introduz o conceito de modulação em quadratura e demonstra sua implementação no RTL-SDR. Explica a motivação por trás do uso da modulação em quadratura para melhorar a eficiência espectral e destaca o processo de recuperação de sinais de banda base a partir do sinal recebido.
== 5.5 Quadrature Amplitude Modulation using Complex Notation

Descreve a modulação de amplitude em quadratura (QAM) usando notação complexa, simplificando a representação e manipulação de sinais QAM. Apresenta um exemplo prático de modulação de sinais para transmissão.
== 5.6 Quadrature Amplitude Demodulation using Complex Notation

Explora o processo de demodulação de amplitude em quadratura usando notação complexa, evidenciando como a notação complexa facilita a extração de sinais de banda base do sinal recebido.
== 5.7 Spectral Representation for Complex Demodulation

Examina a representação espectral de sinais complexos e sua aplicação na demodulação, detalhando a transformação espectral de sinais modulados em frequência para sua baseband complexa.
== 5.8 Frequency Offset Error and Correction at the Receiver

Discute o erro de deslocamento de frequência no receptor e métodos para corrigi-lo, especialmente em relação ao uso do RTL-SDR.
== 5.9 Frequency Correction using a Complex Exponential

Descreve um método de correção de frequência usando uma exponencial complexa, apresentando uma técnica para ajustar a frequência de sinais recebidos por meio da multiplicação por uma exponencial complexa.
== 5.10 RTL-SDR Quadrature / Complex Architecture

Conecta os conceitos de modulação complexa e demodulação com a arquitetura do RTL-SDR, explicando como os princípios de modulação e demodulação em quadratura são implementados nessa arquitetura.

#pagebreak()
= Desenvolvimento
A atividade em MATLAB que simula um modulador/demodulador de fase e quadratura com aúdio seguiu com este código:
```MATLAB
pkg load signal;
clear all;
close all;
clc;

[sinal1, Fs] = audioread('audio-1.wav');
fcc = 10e3;
Ac = 1 ;
duracao = length(sinal1)/Fs;
Ts = 1/Fs;
t = [0:Ts:duracao-Ts];

[sinal2, Fs] = audioread('audio-2.wav');


sinal1 = transpose(sinal1);
sinal2 = transpose(sinal2);
sinal2 = sinal2(1:length(sinal1));



c1_t = Ac*cos(2*pi*fcc*t);
c2_t = -Ac*sin(2*pi*fcc*t);

sinal1_f = fftshift(fft(sinal1)/length(sinal1));
sinal2_f = fftshift(fft(sinal2)/length(sinal2));


s1_t = sinal1 .* c1_t;
s2_t = sinal2 .* c2_t;


passo_f = 1/duracao;
f = [-Fs/2:passo_f:Fs/2 - passo_f];


s1_f = fftshift(fft(s1_t)/length(s1_t));
s2_f = fftshift(fft(s2_t)/length(s2_t));

y_t = s1_t + s2_t;
y_f = fftshift(fft(y_t)/length(y_t));

audiowrite('audio-y.wav',y_t,Fs);

sa_t = y_t .* c1_t;
sb_t = y_t .* c2_t;

sa_f = fftshift(fft(sa_t)/length(sa_t));
sb_f = fftshift(fft(sb_t)/length(sb_t));

filtro_pb = [zeros(1, (length(f) - 2*Fs)/2 ) ones(1,2*Fs) zeros(1, (length(f) - 2*Fs)/2)];

ya_f = sa_f .* filtro_pb;
yb_f = sb_f .* filtro_pb;

ya_t = ifft(ifftshift(ya_f)) * length(sa_f);
yb_t = ifft(ifftshift(yb_f)) * length(sa_f);

audiowrite('audio-a.wav',ya_t,Fs);
audiowrite('audio-b.wav',yb_t,Fs);


figure(1)
subplot(211);
plot(t,sinal1);
title("Sinal 1 - original");

subplot(212);
plot(t,sinal2);
title("Sinal 2 - original");

figure(2)
subplot(411);
plot(f,abs(sinal1_f));
title("Sinal 1 - original");
subplot(412);
plot(f,abs(s1_f));
title("Sinal 1 - Deslocado (Modulando)");

subplot(413);
plot(f,abs(sinal2_f));
title("Sinal 2 - original");
subplot(414);
plot(f,abs(s2_f));
title("Sinal 2 - Deslocado (Modulando");

figure(3)
subplot(211)
plot(t,y_t);
title("Sinal Resultante - Dominio do tempo");
subplot(212)
plot(f,abs(y_f));
title("Sinal Resultante - Dominio da frequência");

figure(4)
subplot(211);
plot(f,abs(sa_f));
title("Sinal 1 - Deslocado (Demodulando)");
subplot(212);
plot(f,abs(sb_f));
title("Sinal 2 - Deslocado (Demodulando)");

figure(5)
subplot(411);
plot(f,abs(sinal1_f));
title("Sinal 1 - original");

subplot(412);
plot(f,abs(ya_f));
title("Sinal 1 - Pós demodulado");

subplot(413);
plot(f,abs(sinal2_f));
title("Sinal 2 - original");

subplot(414);
plot(f,abs(yb_f));
title("Sinal 2 - Pós demodulado");
```
Este código gerou os resultados a seguir.

#figure(
  image("./Figuras/sinaisOriginais.png",width:100%),
  caption: [
     Sinais gerados pelos audios \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Na figura 1 mostra 2 sinais são sinais gerados por 2 aúdios diferentes. Estes estão sendo mostrados no dominio do tempo.

#figure(
  image("./Figuras/modulandoSinais.png",width:100%),
  caption: [
     Sinais gerados sendo modulados \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Na figura 2 é apresentado os 2 sinais de aúdio , porém agora no dominio da frequência , junto aos sinais originais também são mostrados os sinais modulados

#figure(
  image("./Figuras/difentesDominiosModulado.png",width:100%),
  caption: [
     Sinais somados nos diferentes Dominios \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Na figura 3 é mostrado o sinal resultante da soma dos 2 sinais , está sendo apresentada em ammbos os dominios

#figure(
  image("./Figuras/demodulandoSemFiltro.png",width:100%),
  caption: [
     Sinais sendo demodulado sem o filtro \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Descolando os sinais para fazer a demodulação dos sinais

#figure(
  image("./Figuras/demodulandoComFiltro.png",width:100%),
  caption: [
     Sinais demodulado filtrado \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Sinais recuperados , fazendo a demodulação


= Conclusão
O trabalho realizado demonstrou a importância dos conceitos abordados nas seções do livro para a implementação do modulador/demodulador de fase e quadratura (IQ) no MATLAB. A compreensão desses conceitos é fundamental para o desenvolvimento de sistemas de comunicação eficientes e de alta qualidade.