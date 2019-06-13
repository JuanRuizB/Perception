function bin = quitarBordes(bin)

    sizex = size(bin,2);
    sizey = size(bin,1);
    
    encontrado_ini = false;
    encontrado_fin = false;
    
    ini = 1;
    while ~encontrado_ini || ~encontrado_fin  %Eliminar arriba y abajo
        
        if (sizex - sum(bin(ini,:))) > (sizex*1/2) %Si hay una recta negra mas grande que 2/3 de la hoja
            encontrado_ini = true;
        else
            bin(ini,:) = [];
        end
        
        fin = size(bin, 1);
        
        if (sizex - sum(bin(fin,:))) > (sizex*1/2)
            encontrado_fin = true;
        else
            bin(fin,:) = [];
        end
        
    end
    
    encontrado_ini = false;
    encontrado_fin = false;
    
    while ~encontrado_ini || ~encontrado_fin
        
        if (sizey-sum(bin(:,ini))) > (sizey*1/2)
            encontrado_ini = true;
        else
            bin(:,ini) = [];
        end
        
        fin = size(bin,2);
        
        if (sizey-sum(bin(:,fin))) > (sizey*1/2)
            encontrado_fin = true;
        else
            bin(:,fin) = [];
        end
        
    end
    
end