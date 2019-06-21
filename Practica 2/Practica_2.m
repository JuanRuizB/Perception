clear all,close all, clc;
Nx = 200;
Ny = 200;
Fs = 100;
[x1,y1,z1] = sindiscreta2D(Nx,Ny,Fs,Fs,1,15,0,0);
[x2,y2,z2] = sindiscreta2D(Nx,Ny,Fs,Fs,1,0,15,0);
[x3,y3,z3] = sindiscreta2D(Nx,Ny,Fs,Fs,1,15,15,0);

x = x1+x2+x3;
y = y1+y2+y3;
z = z1+z2+z3;

surf(x,y,z),figure,imagesc(x,y,z),colormap gray;

tf = fft2(z);

surf(abs(tf)),figure,imagesc (abs(tf)), colormap gray;

[coefsX,coefsY] = find(abs(tf) > 0.5); %Posicion en la matriz tf de los 
% coeficientes espectrales.

J=fftshift(tf);
figure, imagesc(abs(J)), colormap gray; %Muestra los valores de la frecuencia
% 0 en el centro.
pause;
%--------------------------------------------------------------------------
% Ejercicio 3.
clear all,close all; 
A = 1;
Fs = 100;
Fx = [eps 5 10 25 50];
Fy = 0;
Fase = 0;
Nx = 200;
Ny = 200;
for i = 1:5
[x,y,z] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx(i),Fy,Fase);
figure,surf(x,y,z),figure,imagesc(x,y,z);

tf = fft2(z);

[coefsX,coefsY] = find(abs(tf) > 0.5); %Posicion en la matriz tf de los 
% coeficientes espectrales.
end
pause;
%--------------------------------------------------------------------------
% Ejercicio 4
clear all,close all;

Nx = 200;
Ny = 200;
Fs = 100;
[x1,y1,z1] = sindiscreta2D(Nx,Ny,Fs,Fs,1,15,0,0);
[x2,y2,z2] = sindiscreta2D(Nx,Ny,Fs,Fs,1,0,15,0);
[x3,y3,z3] = sindiscreta2D(Nx,Ny,Fs,Fs,1,15,15,0);

x = x1+x2+x3;
y = y1+y2+y3;
z = z1+z2+z3;

x = [x zeros(1,1024-length(x))];
y = [y zeros(1,1024-length(y))];
c = zeros(1024,1024);
c(1:length(z),1:length(z)) = z;
z = c;

figure,surf(x,y,z),figure,imagesc(x,y,z),colormap gray;

tf = fft2(z,1024,1024);

figure,surf(abs(tf)),figure,imagesc (abs(tf)), colormap gray;

[coefsX,coefsY] = find(abs(tf) > 0.5); %Posicion en la matriz tf de los 
% coeficientes espectrales.

J=fftshift(tf);
figure, imagesc(abs(J)), colormap gray; %Muestra los valores de la frecuencia
% 0 en el centro.
pause;

%--------------------------------------------------------------------------
% Ejercicio 5
clear all,close all;
A = 1;
Fs = 100;
Fx = [eps 5 10 25 50];
Fy = 0;
Fase = 0;
Nx = 200;
Ny = 200;
for i = 1:5
[x,y,z] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx(i),Fy,Fase);

figure,surf(x,y,z),figure,imagesc(x,y,z);



tf = log(1+abs(fft2(z,1024,1024)));

[coefsX,coefsY] = find(abs(tf) > 0.5); %Posicion en la matriz tf de los 
% coeficientes espectrales.
end
pause;

%--------------------------------------------------------------------------
% Ejercicio 6
clear all, close all;
A = 1;
Fs = 100;
F = 0;
Nx = 200;
Ny = 200;

Fx1 = 25; Fy1 = 0;
Fx2 = 5; Fy2 = 5;

[x1,y1,z1] = cosdiscreta2D(Nx,Ny,Fs,Fs,A,Fx1,Fy1,F);
[x2,y2,z2] = cosdiscreta2D(Nx,Ny,Fs,Fs,A,Fx2,Fy2,F);

x = x1+x2;
y = y1+y2;
z = z1+z2;

surf(x,y,z),figure,imagesc(x,y,z),colormap gray;

tf = fft2(z);

surf(abs(tf)),figure,imagesc (abs(tf)), colormap gray;

[coefsX,coefsY] = find(abs(tf) > 0.5); %Posicion en la matriz tf de los 
% coeficientes espectrales.

pause;

%--------------------------------------------------------------------------
% Ejercicio 7
clear all, close all;


