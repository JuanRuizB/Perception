%% Examen parcial 1. Fourier 1D_Ejercicios 1 y 2 caen seguro
clear all; close all; clc;
load muestra_1D_A.mat
%% 1- Componente continua 
N             = length(y);
Fourier       = fft(y);
comp_continua = real(Fourier(1))/N;

%% 2- Amplitud, fase, frecuencia 
Fs = 100;
ok = find(abs(Fourier) > 0.5);

amplitud   = abs(Fourier(ok(2:end)))/(N/2);
fases      = angle(Fourier(ok(2:end)));
frecuencia = linspace(0, Fs, N+1);
frec       = frecuencia(ok);

%% 3- Ancho de banda
ancho_banda = Fs/2;

%% 4- Resolución espectral
res_espectral = Fs/N;

%% 5- Elimina la frecuencia más baja
Fourier([ok(2) ok(end)]) = 0;
figure, plot(ifft(Fourier));

%% 6- Visualizar la parte real e imag, qué observas?
Fourier = fft(y);
R = real(Fourier);
I = imag(Fourier);
bar(R), figure, bar(I);

