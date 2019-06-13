function salida = magnitud(segmentos)
    N = size(segmentos,1);
    Num_seg = size(segmentos,2);
    
    aux = zeros(1,Num_seg);
    for k = 1:Num_seg
        for i = 1:N
            aux(k) = aux(k) + abs(segmentos(i,k));    
        end
    end

    
%     for k = 1:Num_seg
%         for i = 1:N
%             aux(k) = aux(k) + abs(segmentos(i,k))*segmentos_enventanados(i,k);    
%         end
%     end
    
    salida = aux;
end