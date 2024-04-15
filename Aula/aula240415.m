close all;
clear all;
clc;

pkg load signal;
pkg load communications;

[sinal, Fs] = audioread('audio-1.wav');
L = 31;

sinal = transpose(sinal);

delta = (max(sinal)-min(sinal))/L;

niveis = (sinal + abs(min(sinal)))/delta;
niveis = round(niveis);
bits = de2bi(niveis);

bits = reshape(bits , 1 ,[]);

N = 20;

s_t = upsample(sinal,N-1);

