function celda_ajustadas = ajusta(celdas)
    filas = 127;
    columnas = 141;

    filasCeldas = size(celdas{1},1);
    columnasCeldas = size(celdas{1},2);

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