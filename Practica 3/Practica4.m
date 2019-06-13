clear all, close all, clc;

t = 2;
Fs = 8000;
Ch = 1;
num_bits = 8;

[senal,recObj] = grabacion (t, Fs, Ch, num_bits);

senal = preenfasis (senal, 0.95);

num_muestras = 30;
desp = 10;

segmentos = segmentacion(senal,num_muestras,desp);

segmentos_palabra = inicio_fin (segmentos, 10);

segmentos_enventanados = eventanado(segmentos_palabra, 'haming');


palabra = inv_segmentacion(segmentos_enventanados,10);

aux = lpc (palabra, 13);

a = aux;

c(1) = -a(1);

for i = 2:13
    for m = 1:i-1
        hola(m) = (1-m/i)*a(m)*c(i-m);
    end
    c(i) = -a(i) - sum(hola)
end

k = 2;
for i = 1:14
    for n = 1:k*2
        aux1(n) = n*c(i+n);
        aux2(n) = n^2;
    end
    
    Dc(i) = sum(aux1)/sum(aux2);
    
end

estsenal = filter([0 -c(2:end)],1,palabra);
plot(estsenal);
xlabel('Estimación de la senal');


rcepstrum = real(ifft(log(abs(fft(palabra)))));

aux = rcepstrum(:,2:13);

[y,ym] = rceps(palabra);

fu = fft(palabra);


