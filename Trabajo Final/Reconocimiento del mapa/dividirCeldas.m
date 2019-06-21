function celdas = dividirCeldas(bin)
% Sacamos los tamaños de la imagen y el tamaño de cada celda en su eje x e y.
    celdas = [];
    sizey = size(bin,1);
    sizex = size(bin,2);
    
    Ny = fix(sizey/7)-1;
    Nx = fix(sizex/10)-1;
    
% Sacamos y guardamos cada celda mediante sus tamaños a lo largo de la
% cuadricula.
    cont = 1;
    
    for i = 1:Ny:sizey-Ny
        for j = 1:Nx:sizex-Nx
            celdas{cont} = bin(i:i+Ny,j:j+Nx);
            cont = cont+1;
        end
    end
end