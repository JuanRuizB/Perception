function mapa = dibujarNivel(nivel)	
%Cargamos todos los niveles
load niveles;
nivelesCod = niveles;
niveles = ['..\Trabajo Final\skins\mapas\Niveles\nivel1.png';
            '..\Trabajo Final\skins\mapas\Niveles\nivel2.png';
            '..\Trabajo Final\skins\mapas\Niveles\nivel3.png';
            '..\Trabajo Final\skins\mapas\Niveles\nivel4.png';
            '..\Trabajo Final\skins\mapas\Niveles\nivel5.png'];


% Detectaremos las casillas en las que se encuentran los elementos
mapa = imread(niveles(nivel,:));

if nivel==1
    PersonajeAleatorio = 4;
    FondoMapa = 1;
end

if nivel==2
    PersonajeAleatorio = 2;
    FondoMapa = 1;
end

if nivel==3
    PersonajeAleatorio = 2;
    FondoMapa = 2;
end

if nivel==4
    PersonajeAleatorio = 3;
    FondoMapa = 2;
end

if nivel==5
    PersonajeAleatorio = 3;
    FondoMapa = 3;
end

%% %%%%%%%% COMIENZA LA EJECUCIÓN %%%%%%%%%%%%%%%%  
% 
data = struct('mapa',mapa,'indexPers',PersonajeAleatorio,'codmapa',nivelesCod{nivel},'indexFondo',FondoMapa);
MapaRunning(data);

end