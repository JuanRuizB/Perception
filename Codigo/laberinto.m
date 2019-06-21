function laberinto(hor,ver)
if nargin==0
CELDAS_HORIZONTAL = 5;
CELDAS_VERTICAL = 5;
elseif nargin==1
CELDAS_HORIZONTAL = hor;
CELDAS_VERTICAL = 5;
else
CELDAS_HORIZONTAL = hor;
CELDAS_VERTICAL = ver;
end

ANCHO_FIGURA = 800;
ALTO_FIGURA = 600;
RATIO_ASPECTO_FIGURA = ANCHO_FIGURA/ALTO_FIGURA;

ResToNext=[];

% Se leen las texturas
texWall = imread('texWall.png');
texFloor = imread('texFloor.png');
texCeiling = imread('texCeiling.png');
texMirror = imread('espejo.png');
texMirror1 = imread('espejo1.png');
texMirror2 = imread('espejo2.png');
texMirror3 = imread('espejo3.png');

% Bits para indicar puntos cardinales
BIT_N = 1;
BIT_E = 2;
BIT_S = 3;
BIT_O = 4;

rng('shuffle'); % Semillas

ancho = 5;
tamano = ancho/RATIO_ASPECTO_FIGURA; % Redimension de las texturas de paredes
VectorAncho = [0 0 tamano];
coordenadasX = CELDAS_HORIZONTAL;
coordenadasY = CELDAS_VERTICAL;
numCeldas = coordenadasX*coordenadasY;

CasillaCerrada = bin2dec('1111'); % Celda con todas las paredes cerradas


lab = CasillaCerrada*ones(coordenadasY, coordenadasX);
numVisitados = 1;
pila = [];

corX = ceil(rand()*coordenadasX);
corY = ceil(rand()*coordenadasY);

while numVisitados < numCeldas
    visitados = [];
    
    if corX > 1
        if bitxor(lab(corY, corX-1), CasillaCerrada) == 0
            visitados(end+1,:) = [corX-1, corY]; 
        end
    end
    
    if corY > 1
        if bitxor(lab(corY-1, corX), CasillaCerrada) == 0
            visitados(end+1,:) = [corX, corY-1];
        end
    end
    
    if corX < coordenadasX
        if bitxor(lab(corY, corX+1), CasillaCerrada) == 0
            visitados(end+1,:) = [corX+1, corY]; 
        end
    end
    
    if corY < coordenadasY
        if bitxor(lab(corY+1, corX), CasillaCerrada) == 0
            visitados(end+1,:) = [corX, corY+1];
        end
    end
    
    if numel(visitados) == 0
        corX = pila(end,1);
        corY = pila(end,2);
        pila(end,:) = [];
    else
        randIndice = ceil(rand()*size(visitados,1));
        newX = visitados(randIndice, 1);
        newY = visitados(randIndice, 2);
        pila(end+1,:) = [corX corY];
        
        if newY < corY
            lab(corY, corX) = bitset(lab(corY, corX), BIT_N, 0);
            lab(newY, newX) = bitset(lab(newY, newX), BIT_S, 0);
        end
        
        if newX > corX
            lab(corY, corX) = bitset(lab(corY, corX), BIT_E, 0);
            lab(newY, newX) = bitset(lab(newY, newX), BIT_O, 0);
        end
        
        if newY > corY
            lab(corY, corX) = bitset(lab(corY, corX), BIT_S, 0);
            lab(newY, newX) = bitset(lab(newY, newX), BIT_N, 0);
        end
        
        if newX < corX
            lab(corY, corX) = bitset(lab(corY, corX), BIT_O, 0);
            lab(newY, newX) = bitset(lab(newY, newX), BIT_E, 0);
        end
       
        numVisitados = numVisitados + 1;
        
        corX = newX;
        corY = newY;
        
    end
    
end
% Solucion al laberinto
lab(end,end)=0;

% Preparamos Figura

figManejo = figure;

set(figManejo, 'Color', 'black');
set(figManejo, 'MenuBar', 'none');
PropiedadesPantalla = get(0, 'ScreenSize');
set(figManejo, 'Position', [(PropiedadesPantalla(3)-ANCHO_FIGURA)/2 (PropiedadesPantalla(4)-ALTO_FIGURA)/2 ANCHO_FIGURA ALTO_FIGURA]);
set(figManejo, 'Name', 'MATLAB 3D Maze', 'NumberTitle', 'off');
set(figManejo, 'Renderer', 'OpenGL');

set(gca, 'DataAspectRatio', [1 1 1]);
set(gca, 'Visible', 'off');
set(gca, 'Position', [0 0 1 1]);
set(gca, 'CameraViewAngle', 90);
set(gca, 'Projection', 'perspective');

% Vectores de visor
% Orden: NOSE

AngulosVisor = [-90 180 90 0];
offsetVisor = [0 -1; -1 0; 0 1; 1 0];

% Punto inicial de reaparición aleatorio
corX = ceil(rand()*coordenadasX);
corY = ceil(rand()*coordenadasY);
indice = ceil(rand()*4);

% Coloca la camara en la posición
set(gca, 'CameraPosition', ancho*[corX-0.5 corY-0.5 0] + 0.5*VectorAncho);
set(gca, 'CameraTarget', ancho*[corX-0.5 corY-0.5 0] + 0.5*VectorAncho + (GenerarMatriz(AngulosVisor(indice))*[1 0 0]')');
drawnow

% Misma función que salir, al puslar escape
keepRunning = true;
set(figManejo, 'KeyPressFcn', @CerradoFunc);
% Renderización del laberinto
RenderLab(1);


% Navegación por el laberinto
pause();
while keepRunning
    
    prevIndice = indice;
    prevX = corX;
    prevY = corY;
    if indice < 1
        indice = 4;
    end
    if (prevX==size(lab,2) && prevY==size(lab,1))
        logic=true;
        contador=randi(5);
        clc;
        for i=1:contador
            
            auxiliar=randi(3);
            if auxiliar==1
                ResToNext(i)=1;
                disp("1");
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX coordenadasY-1 0], texMirror1, 1);
        ColocarPared(ancho*[coordenadasX coordenadasY-1 0], ancho*[coordenadasX coordenadasY 0], texMirror1, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY 0], ancho*[coordenadasX coordenadasY 0], texMirror1, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX-1 coordenadasY 0], texMirror1, 1);
        pause(1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX coordenadasY-1 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX coordenadasY-1 0], ancho*[coordenadasX coordenadasY 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY 0], ancho*[coordenadasX coordenadasY 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX-1 coordenadasY 0], texMirror, 1);
            pause(0.5);
            elseif auxiliar==2;
                ResToNext(i)=2;
                disp("2");
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX coordenadasY-1 0], texMirror2, 1);
        ColocarPared(ancho*[coordenadasX coordenadasY-1 0], ancho*[coordenadasX coordenadasY 0], texMirror2, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY 0], ancho*[coordenadasX coordenadasY 0], texMirror2, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX-1 coordenadasY 0], texMirror2, 1);
        pause(1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX coordenadasY-1 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX coordenadasY-1 0], ancho*[coordenadasX coordenadasY 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY 0], ancho*[coordenadasX coordenadasY 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX-1 coordenadasY 0], texMirror, 1);
        pause(0.5);    
            elseif auxiliar==3;
                 ResToNext(i)=3;
                 disp("3");
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX coordenadasY-1 0], texMirror3, 1);
        ColocarPared(ancho*[coordenadasX coordenadasY-1 0], ancho*[coordenadasX coordenadasY 0], texMirror3, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY 0], ancho*[coordenadasX coordenadasY 0], texMirror3, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX-1 coordenadasY 0], texMirror3, 1);
        pause(1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX coordenadasY-1 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX coordenadasY-1 0], ancho*[coordenadasX coordenadasY 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY 0], ancho*[coordenadasX coordenadasY 0], texMirror, 1);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX-1 coordenadasY 0], texMirror, 1);
            pause(0.5);
            end
        end
        while logic
            resulth1=im();
            
            if(length(resulth1)==length(ResToNext) && sum(resulth1==ResToNext)==length(resulth1))
                logic=false;
            else 
                disp("Error. Siga Intentándolo.");
            end
        end
         newLab(CELDAS_HORIZONTAL+1,CELDAS_VERTICAL+1)
    else
    direc='Direccion:'
    pause
    dir=engine();
    indice=Modificacion(indice+dir,4);
    if dir==4
    corX = corX + offsetVisor(indice, 1)
    corY = corY + offsetVisor(indice, 2)
    elseif dir==5
        keepRunning=false;
    else
        corX = corX
        corY = corY
    end
    if corX>CELDAS_HORIZONTAL || corY>CELDAS_VERTICAL
       close all;
        newLab(CELDAS_HORIZONTAL+1,CELDAS_VERTICAL+1)
        
    end
	duration = 1.0; % Tiempo para la animación de desplazamiento visor y personaje
	transcurrido = 0.0;
	tic
    while true
		transcurrido = transcurrido + toc;
		tic
		ValidacionAnima = transcurrido/duration;
		if ValidacionAnima > 1
			ValidacionAnima = 1;
		end
        Posactual = ancho*[(prevX + ValidacionAnima*(corX-prevX))-0.5 (prevY + ValidacionAnima*(corY-prevY))-0.5 0] + 0.5*VectorAncho;
		
		Anguloactual = AngulosVisor(prevIndice) + ValidacionAnima*DiferenciaAngulos(AngulosVisor(prevIndice), AngulosVisor(indice));
        
        set(gca, 'CameraPosition', Posactual);
        set(gca, 'CameraTarget', Posactual + (GenerarMatriz(Anguloactual)*[1 0 0]')');
        drawnow
		if ValidacionAnima >= 1
			break
		end
    end
    end
    
end

close(figManejo);

	function ColocarPared(Comienzo, Fin, tex, Escala)
        vertices = [Comienzo+Escala*VectorAncho; Fin+Escala*VectorAncho; Fin; Comienzo];
        Dibujo(vertices, tex);
    end

	function CerradoFunc(sourceHandle, event)
		if strcmp('escape', event.Key)
			keepRunning = false;
		end
	end

	function RenderLab(Escalar)
        
        
        % Colocamos primero paredes negras alrededor del mazo que luego
        % se modificaran por paredes con textura.
        texNegra = [0 0 0];
        texNegra = reshape(texNegra, 1, 1, 3);
        hold on
        ColocarPared(ancho*[-1 -1 0], ancho*[coordenadasX+1 -1 0], texNegra, 1);
        ColocarPared(ancho*[-1 -1 0], ancho*[-1 coordenadasY+1 0], texNegra, 1);
        ColocarPared(ancho*[-1 coordenadasY+1 0], ancho*[coordenadasX+1 coordenadasY+1 0], texNegra, 1);
        ColocarPared(ancho*[coordenadasX+1 -1 0], ancho*[coordenadasX+1 coordenadasY+1 0], texNegra, 1);
        hold off
        
		hold on
        % Colocacion de texturas de paredes
		for actCeldaX = 1:coordenadasX
			for actCeldaY = 1:coordenadasY

				if bitget(lab(actCeldaY,actCeldaX), BIT_N) && actCeldaY == 1
					ColocarPared(ancho*[actCeldaX-1 actCeldaY-1 0], ancho*[actCeldaX actCeldaY-1 0], texWall, Escalar);
				end
				if bitget(lab(actCeldaY,actCeldaX), BIT_S)
					ColocarPared(ancho*[actCeldaX-1 actCeldaY 0], ancho*[actCeldaX actCeldaY 0], texWall, Escalar);
				end
				if bitget(lab(actCeldaY,actCeldaX), BIT_E)
					ColocarPared(ancho*[actCeldaX actCeldaY-1 0], ancho*[actCeldaX actCeldaY 0], texWall, Escalar);
				end
				if bitget(lab(actCeldaY,actCeldaX), BIT_O) && actCeldaX == 1
					ColocarPared(ancho*[actCeldaX-1 actCeldaY-1 0], ancho*[actCeldaX-1 actCeldaY 0], texWall, Escalar);
                end
                
                %Pintado de Suelos y Techos
				Suelos = ancho*[actCeldaX-1 actCeldaY 0; actCeldaX actCeldaY 0; actCeldaX actCeldaY-1 0; actCeldaX-1 actCeldaY-1 0];
				Dibujo(Suelos, texFloor);

				Techos = ancho*[actCeldaX-1 actCeldaY tamano/ancho; actCeldaX actCeldaY tamano/ancho; actCeldaX actCeldaY-1 tamano/ancho; actCeldaX-1 actCeldaY-1 tamano/ancho];
				Dibujo(Techos, texCeiling);
			end
        end
        % Sala especial para el final del laberinto
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX coordenadasY-1 0], texMirror, Escalar);
        ColocarPared(ancho*[coordenadasX coordenadasY-1 0], ancho*[coordenadasX coordenadasY 0], texMirror, Escalar);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY 0], ancho*[coordenadasX coordenadasY 0], texMirror, Escalar);
        ColocarPared(ancho*[coordenadasX-1 coordenadasY-1 0], ancho*[coordenadasX-1 coordenadasY 0], texMirror, Escalar);
		hold off
        
        drawnow;
	end

end


function newLab(h,v)
close all;
laberinto(h,v);

end

function Dibujo(v, tex)
    x = [v(1,1) v(2,1); v(4,1) v(3,1)];
    y = [v(1,2) v(2,2); v(4,2) v(3,2)];
    z = [v(1,3) v(2,3); v(4,3) v(3,3)];
    surface(x, y, z, tex, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
end

function MatrizEspecial = GenerarMatriz(ang) %Generación matriz especial para rotacion de visor.
    MatrizEspecial = [cosd(ang) -sind(ang) 0; sind(ang) cosd(ang) 0; 0 0 1];
end

function res = DiferenciaAngulos(a, b) % Calcula la diferencia entre dos angulos en grados.
    res = b - a;
    if res > 180
        res = 180 - res;
    elseif res <= -180;
        res = res + 360;
    end
end

function res = Modificacion(val, max) % Conversion a indice.
    res = mod(val, max);
    if res == 0
        res = max;
    end
end