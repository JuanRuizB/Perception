 function inv=inv_segmentacion(seg,desplazamiento)
aux=seg(:,1)';
i=2:size(seg,2);
aux=seg(desplazamiento+1:end,i);
aux=aux(:);
aux2=[aux aux'];
inv=aux2;
end