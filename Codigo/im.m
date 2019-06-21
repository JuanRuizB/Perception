function res=im()
%load('FIN.mat');
load('uno.mat');
load('dos.mat');
load('tres.mat');
load('salida.mat');
% Create the webcam object.
cam = webcam();

videoFrame = snapshot(cam);
frameSize = size(videoFrame);
videoFrame=edge(rgb2gray(videoFrame), 'canny');
ele = strel('square',3);
% Dilatación
imagen_dilatada = imdilate(videoFrame,ele);
ele = strel('square',3);    
% Erosión
imagen_erosionada = imerode(imagen_dilatada ,ele);
imshow(imagen_erosionada )

% Calcula la correlación entre el recorte y A
cc = normxcorr2(uno, imagen_erosionada);
c2 = normxcorr2(Ndos, imagen_erosionada);
c3 = normxcorr2(tres, imagen_erosionada);
c4 = normxcorr2(salida, imagen_erosionada);
 %Obtiene el índice donde la correlación es máxima (1)
[max_cc1, imax] = max(abs(cc(:)));
[max_cc2, imax2] = max(abs(c2(:)));
[max_cc3, imax3] = max(abs(c3(:)));
[max_cc4, imax4] = max(abs(c4(:)));
[maximo,pos]=max([max_cc1 max_cc2 max_cc3 max_cc4 ]);
% Convierte el índice a coordenas y,x
[fil, col] = ind2sub(size(cc),maximo);

fil 
col

trure=1;
i=1;
while trure
videoFrame = snapshot(cam);
frameSize = size(videoFrame);

videoFrame=edge(rgb2gray(videoFrame), 'canny');
ele = strel('square',3);
% Dilatación
imagen_dilatada = imdilate(videoFrame,ele);
ele = strel('square',3);
% Erosión
imagen_erosionada = imerode(imagen_dilatada ,ele);
imshow(imagen_erosionada )



% Calcula la correlación entre el recorte y A
cc = normxcorr2(uno, imagen_erosionada);
c2 = normxcorr2(Ndos, imagen_erosionada);
c3 = normxcorr2(tres, imagen_erosionada);
c4 = normxcorr2(salida, imagen_erosionada);
 %Obtiene el índice donde la correlación es máxima (1)
[max_cc1, imax] = max(abs(cc(:)));
[max_cc2, imax2] = max(abs(c2(:)));
[max_cc3, imax3] = max(abs(c3(:)));
[max_cc4, imax4] = max(abs(c4(:)));
ma=[imax imax2 imax3 imax4];
[maximo,pos]=max([max_cc1 max_cc2 max_cc3 max_cc4 ]);
maximo
% Convierte el índice a coordenas y,x
[fil, col] = ind2sub(size(cc),ma(pos));
fils
cols
if maximo<0.28 
   disp("no se reconoce"); 
elseif pos==1
    res(i)=1;
    i=i+1;
    i
    disp("uno");
    
  
elseif  pos==2
  res(i)=2;
  i=i+1;
  i
    disp("dos");
elseif pos==3
    res(i)=3;
    i=i+1;
    i
    disp("tres");
elseif pos==4
    trure=0;
disp("termina");


end
pause;
end





end
