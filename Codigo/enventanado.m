function segmentos_enventanados = enventanado(segmentos,ventana) 

%%Minimizar las discontinuidades para que no se produzca el efecto Gibbs
%%En los extremos tiene un valor cercano a 0 y es simétrica respecto del
%%centro.
%%Convolución de la señal y la ventana
if (strcmp('hamming',ventana)==1)
    ven=hamming(size(segmentos,1));
    segmentos_enventanados=segmentos.*ven;
    
end
if (strcmp('rectangular',ventana)==1)
    ven=rectwin(size(segmentos,1));
      segmentos_enventanados=segmentos.*ven;
    
end
if (strcmp('hanning',ventana)==1)
   ven=hanning(size(segmentos,1));
      segmentos_enventanados=segmentos.*ven;
  
end

end