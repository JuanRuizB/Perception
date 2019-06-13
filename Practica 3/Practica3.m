t = 2;
Fs = 8000;
Ch = 1;
num_bits = 8;

[senal,recObj] = grabacion (t, Fs, Ch, num_bits);

senal = preenfasis (senal, 0.95);

num_muestras = 16;
desp = 8;

segmentos = segmentacion(senal,num_muestras,desp); %num_muestras = N y 
                                                   %desp = M (N>M)
segmentos_enventanados = eventanado(segmentos, 'haming');

play(recObj);

% salida = energia(segmentos,segmentos_enventanados);

segmentos_palabra = inicio_fin (segmentos_enventanados, 10);

palabra = inv_segmentacion(segmentos_palabra,desp);

audio = audioplayer(segmentos_palabra,Fs,num_bits);

play(ans);

                                                   
                                                   