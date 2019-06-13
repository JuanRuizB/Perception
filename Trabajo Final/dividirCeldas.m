function celdas = dividirCeldas(bin)

    celdas = [];
    sizey = size(bin,1);
    sizex = size(bin,2);
    
    Ny = fix(sizey/7)-1;
    Nx = fix(sizex/10)-1;
    
    cont = 1;
    
    for i = 1:Ny:sizey-Ny
        for j = 1:Nx:sizex-Nx
            celdas{cont} = bin(i:i+Ny,j:j+Nx);
            cont = cont+1;
        end
    end
end