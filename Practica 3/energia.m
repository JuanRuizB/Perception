function salida = energia(segmentos)
    N = size(segmentos,1);
    Num_seg = size(segmentos,2);   
    
    aux = zeros(1,Num_seg);
    for i = 1:N
        aux = aux + segmentos(i,k).^2;    
    end


%     for k = 1:Num_seg
%         for i = 1:N
%             aux(k) = aux(k) + segmentos(i,k)^2*segmentos_enventanados(i)^2;    
%         end
%     end
    salida = aux;
end