function resul=practica4()
%%Practica 4 como función para grabar
t=2;
%%Grabación de la señal
Fs=8000;
Ch=1;
num_bits=16;
s2=grabacion(t, Fs, Ch, num_bits);
%Preénfasis
senal=preenfasis(s2,0.9);
%Segmentación
segmentos=segmentacion(senal,240,80);
%Enventanado
enventanados=enventanado(segmentos,'hamming');
%Energía
energias=energia(enventanados);
%Magnitud
magnitudes = magnitud (enventanados);
%Cruces por cero
cruces = crucesporcero (enventanados);
%Longitud del segmento que vamos a coger
long=Rabiner(magnitudes,cruces);
%Cogemos los segmentos que queremos
final=inicio_fin(segmentos,long);


%%Cálculo de coeficientes Cepstrum, nos quedamos con los 13
prince=fft(final);
cepstrum= real(ifft(log(abs(prince))));
ceps2=cepstrum(2:13,:);
%Cálculo de coeficientes delta con las matrices A,
i=1:size(ceps2,2);
A=repmat([-3:3],12,1);
p=3;
j=1;
B=[repmat(0,12,3),ceps2,repmat(0,12,3)];
sup=[];
E=zeros(1,size(B,2));[fil,col]=find(B~=0);E(col)=1;D=[-3:3];delta=[];
for i=1:size(ceps2,2)
    num(:,i)=sum(A.*B(:,i:i+2*p),2);
    den(:,i)=sum(D.*E(:,i:i+2*p).^2);
    delta(:,i)=num/den;
end
% Normalización

medias=mean(ceps2);
desviacion=std(ceps2);
normalizado=(ceps2-medias)./desviacion;
%%Devuelvo solo los cepstrum porque para la práctica es suficiente
resul=normalizado;
end
