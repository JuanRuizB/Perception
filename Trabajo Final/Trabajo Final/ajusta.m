function celda_ajustadas = ajusta(celdas)
% Tamaños a los que tenemos que ajustar las celdas que recibe.
    filas = 127;
    columnas = 141;
% Tamaños de las celdas que recibe.
    filasCeldas = size(celdas{1},1);
    columnasCeldas = size(celdas{1},2);
% Proceso por el cual ajusta las celdas al tamaño deseado borrando filas y
% columnas en caso de ser mayor al deseado o rellenando con filas y
% columnas de ceros en caso de ser menor.
    if filasCeldas < filas
        if columnasCeldas < columnas
            for i = 1:length(celdas)
                celdas{i}(filasCeldas+1:filas,columnasCeldas+1:columnas) = 0;
            end
        elseif columnasCeldas >= columnas
            for i = 1:length(celdas)
                celdas{i}(filasCeldas+1:filas,:) = 0;
                celdas{i} = celdas{i}(:,1:columnas);
            end
        end
    else
        if columnasCeldas < columnas
            for i = 1:length(celdas)
                celdas{i}(:,columnasCeldas+1:columnas) = 0;
                celdas{i} = celdas{i}(1:filas,:);
            end
        elseif columnasCeldas >= columnas
            for i = 1:length(celdas)
                celdas{i} = celdas{i}(1:filas,1:columnas);
            end
        end

    end
    celda_ajustadas = celdas;
        
end