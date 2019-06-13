clear all, close all, clc;
load muestra_1D_A;
Fourier = fft(y);
N = 400;
Fs = 100;

tf = fft2(z);

surf(abs(tf)),figure,imagesc (abs(tf)), colormap gray;

[coefsX,coefsY] = find(abs(tf) > 0.5); 

pairs = [coefsX';coefsY'];
for i = 1:7
abs(tf(pairs(:,i))/((N*N)/2))
end
frecuencias = linspace(0,Fs,N+1);
figure,bar(frecuencias(1:end-1),abs(Fourier)/(N/2));

ind = find(abs(Fourier) > 0.5);

abs(Fourier(ind)/(N/2))

figure,bar(frecuencias(1:end-1),angle(Fourier));
[x,y1] = sindiscreta_compuesta(A,F,Fase,Fs,N)
fases = angle(Fourier(ind))

figure,bar(imag(Fourier)/(N/2));
figure,bar(real(Fourier)/(N/2));