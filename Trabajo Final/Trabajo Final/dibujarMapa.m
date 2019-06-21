function mapa = dibujarMapa(mapaPers)
% Cargamos todos los posibles mapas que podremos utilizar
fondosmapas = ['..\Trabajo Final\skins\mapas\fondomapa1.png'
    '..\Trabajo Final\skins\mapas\fondomapa2.png'
    '..\Trabajo Final\skins\mapas\fondomapa3.png'];

% Cargamos la matriz de enemigos
enemigos = imread('enemigos.png');

% Cargamos todos los obstaculos
obstaculos = ['..\Trabajo Final\skins\mapas\obstaculo1.png'
    '..\Trabajo Final\skins\mapas\obstaculo2.png'
    '..\Trabajo Final\skins\mapas\obstaculo3.png'];

% Cargamos la matriz de personajes
personajes = imread('personajes.png');

% Cargamos la salida
salida = '..\Trabajo Final\skins\mapas\salida1.png';



% Detectaremos las casillas en las que se encuentran los elementos
FondoMapa = randi(size(fondosmapas,1));
mapa = imread(fondosmapas(FondoMapa,:));

if(sum(mapaPers=='S')>1 | sum(mapaPers=='S')==0)
    disp('ERROR. Numero erroneo de salidas');
    return;
end

if(sum(mapaPers=='P')>1 | sum(mapaPers=='P')==0)
    disp('ERROR. Numero erroneo de personajes');
    return;
end


ind = find(mapaPers=='X');
[indX(:,1),indX(:,2)] = ind2sub(size(mapaPers),ind);

ind = find(mapaPers=='P');
[indP(:,1),indP(:,2)] = ind2sub(size(mapaPers),ind);

ind = find(mapaPers=='M');
[indM(:,1),indM(:,2)] = ind2sub(size(mapaPers),ind);

ind = find(mapaPers=='S');
[indS(:,1),indS(:,2)] = ind2sub(size(mapaPers),ind);


% Empezaremos por añadir los obstaculos (muros)
MuroAleatorio = randi(size(obstaculos,1));

for i=1:size(indX,1) 
    
    a = 32*(indX(i,1)) - 31;
    b = 32*(indX(i,2)) - 31;
    
    mapa(a:a+31,b:b+31,:) = imread(obstaculos(MuroAleatorio,:));
    
end


% Añadimos personaje
PersonajeAleatorio = randi(size(personajes,2)/32);

    a = 32*(indP(1,1)) - 31;
    b = 32*(indP(1,2)) - 31;  
    mapa(a:a+31,b:b+31,:) = personajes((32*FondoMapa)-31:(32*FondoMapa),(32*PersonajeAleatorio)-31:(32*PersonajeAleatorio),:);
    
% Añadimos Enemigos
EnemigosAleatorios = randi(size(enemigos,2)/32);
for i=1:size(indM,1)
    
    a = 32*(indM(i,1)) - 31;
    b = 32*(indM(i,2)) - 31;  
    
    mapa(a:a+31,b:b+31,:) = enemigos(32*FondoMapa-31:32*FondoMapa,32*EnemigosAleatorios-31:32*EnemigosAleatorios,:);
end
    
% Añadimos la salida
    a = 32*(indS(1,1)) - 31;
    b = 32*(indS(1,2)) - 31;  
    
    mapa(a:a+31,b:b+31,:) = imread(salida(1,:));

    

%% %%%%%%%% COMIENZA LA EJECUCIÓN %%%%%%%%%%%%%%%%    
data = struct('mapa',mapa,'codmapa',mapaPers,'indexPers',PersonajeAleatorio,'indexFondo',FondoMapa);
MapaRunning(data);

end