function segmentos = segmentacion(senal,num_muestras,despl)

% Si pones 'nodelay' no pone al principio tantos 0 como desp.
segmentos = buffer(senal,num_muestras,despl,'nodelay'); 

end