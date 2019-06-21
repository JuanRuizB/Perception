% Examen Percepcion Parte 1. Juan Ruiz Bonald
clear all, close all, clc;
load('muestra01.mat');

% Componente Continua
Fs = 100;
Fourier = fft(y);
N = length(y);
comp_continua = real(Fourier(1))/N;

% Amplitud, Fase y frecuencia
ind = find(abs(Fourier) > 0.5);

amplitud   = abs(Fourier(ind(2:end)))/(N/2);
fases      = angle(Fourier(ind(2:end)));
frecuencia = linspace(0, Fs, N+1);
frec       = frecuencia(ind); %Con las frecuencias sacamos la frecuencia fundamental
% y los armonicos

% Ancho de Banda
Ancho_banda = Fs/2;

% Resolucion Espectral
Res_espectral = Fs/N;

% Visualizacion de la parte imaginaria y parte real
R = real(Fourier);
I = imag(Fourier);
bar(R), figure, bar(I);