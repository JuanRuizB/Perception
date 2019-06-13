%% Examen parcial 1. Fourier 2D
clear all; close all; clc;
load muestra_2D_A.mat

%% 1- Componente continua 
Fourier = fft2(z);
comp_cont = Fourier(1, 1)/prod(size(z));

%% 2- Amplitud, frecuencia y fase
[y, x] = find(abs(Fourier) > 1);    % y = filas, x = columnas
% Si la señal se encuentra pegada al borde (fila = 1 o columna = 1), la
% frecuencia entonces será 0
FsX = 100; FsY = 100; Fs = 100;

imagesc(abs(Fourier)), colormap gray;
fase       = zeros(1, 6);
frecx      = zeros(1, 6);
frecy      = zeros(1, 6);
amplitud   = zeros(1, 6);
todas_frec = linspace(0, Fs, size(z, 1)+1);
for i=1:6
    amplitud(i) = abs(Fourier(y(i+1), x(i+1)))/(prod(size(z))/2);
    fase(i)     = angle(Fourier(y(i+1), x(i+1)));
    frecx(i)    = todas_frec(x(i+1));
    frecy(i)    = todas_frec(y(i+1));
end
% Para las frec descartamos las que están por encima de la frec max de muestreo

%% 3- Ancho de banda: 50, 50. Mitad de la Fs
ancho_bandaX = FsX/2;
ancho_bandaY = FsY/2;

%% 4- Res. espectral: Fs/num_muestras
N = prod(size(z));
res_espectralX = FsX/N;
res_espectralY = FsY/N;

