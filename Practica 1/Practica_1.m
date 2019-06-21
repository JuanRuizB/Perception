clear all, close all, clc
%% Ejercicio 3.
A = [3 1 2 0.5];
F = [1 2 4 18];
Fase = [pi/4 0 pi/2 pi/2];
Fs = 100; 
N = 200;

[x,y] = sindiscreta_compuesta(A,F,Fase,Fs,N);

figure,plot(x,y);

%% Ejercicio 4.
Fourier = fft(y);
%% Ejercicio 5.
figure,bar(abs(Fourier)); %Se observa que la componente continua es 0 y que
                        % es totalmente simetrica.
%% Ejercicio 6.
frecuencias = linspace(0,Fs,N+1);
figure,bar(frecuencias(1:end-1),abs(Fourier)/(N/2));
% Punto 1: La relacion entre las posiciones de las barras y la señal es la
% frecuencia ya que en las barras que sobresalen corresponen a la
% frecuencia de cada señal. No siempre ya que dependera de la resolucion
% espectral, ya que a una muy alta no se podria determinar la frecuencia.

%Punto 2: La funcion bar de Matlab escala las barras N/2 por lo que para
%mostrar las barras con valores autenticos habrá que dividir entre N/2.

%Punto 3: Si,siempre aparece. En este caso es 0.

%Punto 4: La frecuencia fundamental es 1 ya que las demas son multiplos de
%el.
%% Ejercicio 7 y 8.
y = y + 5;
figure,plot(x,y);
Fourier = fft(y);
figure,bar(abs(Fourier)); %Se observa que ahora la componente continua es 10.
frecuencias = linspace(0,Fs,N+1);
figure,bar(frecuencias(1:end-1),abs(Fourier)/(N/2));

%Se observa que la constante continua ha aumentado hasta 10 y que ahora la 
%grafica se centra en la posicion del eje x = 5.
%

%% Ejercicio 9.
figure,bar(imag(Fourier));
figure,bar(real(Fourier));

%% Ejercicio 10


