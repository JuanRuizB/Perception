function salida = cruces_por_cero(segmentos)
    N = size(segmentos,1);
    Num_seg = size(segmentos,2);
    aux = zeros(1,Num_seg);
    
    for k = 1:Num_seg
        for i = 1:N-1
            aux(k) = aux(k) + abs(sign(segmentos(i+1,k)) - sign(segmentos(i,k)));    
        end
        aux(k) = aux(k)/(2*N);
    end

%     for k = 1:Num_seg
%         for i = 1:N-1
%             aux(k) = aux(k) + (abs(sign(segmentos(i+1,k)) - sign(segmentos(i,k)))*segmentos_enventanados(i,k))/2;    
%         end
%         aux(k) = aux(k)/N;
%     end
    
    salida = aux;
end