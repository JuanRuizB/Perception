function segmentos_enventanados = eventanado(segmentos, ventana)
N = size(segmentos,1);
    switch(ventana)
        case 'rectangular'
            ventana = rectwin(N);
        
        case 'haming'
            ventana = hamming(N);
            
        case 'hanning'
            ventana = hanning(N);
    end
segmentos_enventanados = segmentos.*ventana;
end