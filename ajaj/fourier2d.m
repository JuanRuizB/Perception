%% transp 23
close all;
Fs = 100;
[X,Y]=meshgrid(-1:1/Fs:1,-1:1/Fs:1);
A = 1;
Fr1=8;
Fr2=8;
Z=A*sin(2*pi*Fr1*X+2*pi*Fr2*Y);
figure, imagesc(Z), colormap gray;
T=fft2(Z);
figure, imagesc(abs(T)), colormap gray;
J=fftshift(T);
figure, imagesc(abs(J)), colormap gray;

%% transp 25
close all;
% Fs = 100;
% [X,Y]=meshgrid(-1:1/Fs:1,-1:1/Fs:1);
% Fr1=25;
% Fr2=12;
% Z1=sin(2*pi*Fr1*X+4*pi*Fr2*Y);
% Fr1=8;
% Fr2=0;
% Z2=sin(2*pi*Fr1*X+4*pi*Fr2*Y);
% Z = Z1 + Z2;
% figure, imagesc(Z), colormap gray;

semin = imread('seminarista.jpg');
T=fft2(semin);
figure, imagesc(abs(T)), colormap gray;
J=fftshift(T);
figure, imagesc(abs(J)), colormap gray;
[x,y] = ginput(1);
x = round(x); y =round(y);
J_new=J;
radio = 20;
J(y-radio:y+radio,x-radio:x+radio)=0;
J(size(J,1)-(y+radio):size(J,1)-(y-radio),size(J,2)-(x+radio):size(J,2)-(x-radio))=0;
T_new = ifftshift(J);
Z_new = real(ifft2(T_new));
figure,imagesc(Z_new),colormap gray;
caxis([-1 1])

J2 = log(1+abs(J));
figure, imshow(J2, []);





