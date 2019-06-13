clear all; close all; clc;

%% Ejercicio 2
Nx = 200;
Ny = 200;
Fs = 100;

A = 1; Fx = 15; Fy = 0; Fase = 0;
[x1,y1,z1] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

A = 1; Fx = 0; Fy = 15; Fase = 0;
[x2,y2,z2] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

A = 1; Fx = 15; Fy = 15; Fase = 0;
[x3,y3,z3] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

x = x1 + x2 + x3;
y = y1 + y2 + y3;
z = z1 + z2 + z3;

figure,surf(x,y,z);
figure,imagesc(x,y,z);
colormap gray;

Fourier2D = fft2(z);
figure, surf(abs(Fourier2D));
figure, imagesc(abs(Fourier2D));
colormap gray;

[coefs1, coefs2] = find(abs(Fourier2D) > 0.5);
coefs = [coefs1 coefs2];

y2 = fftshift(Fourier2D);

figure, surf(abs(y2))
figure, imagesc(abs(y2));
colormap gray;

%% Ejercicio 3
clear all; close all; clc;
A = 1; Fs = 100; freqs = [eps 5 10 25 50]; Fy = 0;
Fase = 0; Nx = 200; Ny = 200;
for Fx = freqs
    [x,y,z] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);


    Fourier2D = fft2(z);
    figure, imagesc(abs(fftshift(Fourier2D)));
    colormap gray;
end

%% Ejercicio 4
clear all; close all; clc;
Nx = 1024;
Ny = 1024;
Fs = 100;

A = 1; Fx = 15; Fy = 0; Fase = 0;
[x1,y1,z1] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

A = 1; Fx = 0; Fy = 15; Fase = 0;
[x2,y2,z2] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

A = 1; Fx = 15; Fy = 15; Fase = 0;
[x3,y3,z3] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

x = x1 + x2 + x3;
y = y1 + y2 + y3;
z = z1 + z2 + z3;

figure,surf(x,y,z);
figure,imagesc(x,y,z);
colormap gray;

Fourier2D = fft2(z, 1024, 1024);
figure, surf(abs(Fourier2D));
figure, imagesc(abs(Fourier2D));
colormap gray;

[coefs1, coefs2] = find(abs(Fourier2D) > 0.5);
coefs = [coefs1 coefs2];

y2 = fftshift(Fourier2D);

figure, surf(abs(y2))
figure, imagesc(abs(y2));
colormap gray;

%% Ejercicio 5

clear all; close all; clc;
A = 1; Fs = 100; freqs = [eps 5 10 25 50]; Fy = 0;
Fase = 0; Nx = 200; Ny = 200;

for Fx = freqs
    [x,y,z] = sindiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);
    Fourier2D = fft2(z, 1024, 1024);
    figure, imagesc(log(1+abs(Fourier2D)));
end

%% Ejercicio 6

clear all; close all; clc;
Nx = 200;
Ny = 200;
Fs = 100;

A = 1; Fx = 25; Fy = 0; Fase = 0;
[x1,y1,z1] = cosdiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

A = 1; Fx = 5; Fy = 5; Fase = 0;
[x,y,z] = cosdiscreta2D(Nx,Ny,Fs,Fs,A,Fx,Fy,Fase);

Fourier2D = fft2(z, 1024, 1024);
figure, surf(abs(Fourier2D));
figure, imagesc(abs(fftshift(Fourier2D)));
colormap gray;

%% Ejercicio 7 y 8;
clear all; close all; clc;

imag = imread('seminarista.jpg');
figure(1), imshow(imag, []);
tf = fft2(imag);
tfshifted = fftshift(tf);

radio = 30; nVeces = 3;
tfshifted2 = eliminaCoeficientes(tfshifted, radio, nVeces);

figure, imshow(log(1-tfshifted2), []);

tf2 = ifftshift(tfshifted2);
imag2 = ifft2(tf2);
figure, imshow(real(imag2), []);


%% Ejercicio 9
clear all; close all; clc;

imag = imread('barco.jpg');
figure, imshow(imag, []);
tf = fft2(imag);
tfshifted = fftshift(tf);
figure, imshow(tfshifted, []);
figure, imshow(abs(log(1-(tfshifted))), []);


centro = [round(size(imag, 1)/2) round(size(imag, 2)/2)];

mas_cara = ones(size(imag));
for radio = [10 20 30 40 50]
    [row, col] = find(imag);
    pairs = [row';col'];
    d = d_euclid(pairs, centro');
    ind = find(d < radio);
    mas_cara(ind) = 0;

%     figure, imshow(mas_cara,[]);

    enmascarado = tfshifted.*mas_cara;
%     figure, imshow(abs(log(1-enmascarado)), []);

    ft2 = ifftshift(enmascarado);
    imag21 = ifft2(ft2);
    figure, imshow(abs(imag21), []);

end

%inverted
mas_cara = zeros(size(imag));
for radio = [10 20 30 40 50]
    [row, col] = find(imag);
    pairs = [row';col'];
    d = d_euclid(pairs, centro');
    ind = find(d < radio);
    mas_cara(ind) = 1;
    
    %mostramos la mascara
    %figure, imshow(mas_cara,[]);

    enmascarado = tfshifted.*mas_cara;
    %mostramos la mascara aplicada
    %figure, imshow(abs(log(1-enmascarado)), []);

    ft2 = ifftshift(enmascarado);
    imag21 = ifft2(ft2);
    figure, imshow(abs(imag21), []);

end









