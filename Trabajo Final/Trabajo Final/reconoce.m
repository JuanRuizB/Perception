function resultado = reconoce(img)
% Sección carga la base de datos del reconocedor.
    load('S.mat');
    load('M.mat');
    load('P.mat');
    load('X.mat');
    load('Total.mat');
% Sección preprocesado de la imagen del mapa.
    gray = rgb2gray(img);
    bin = imbinarize(gray);
    binCuadra = quitarBordes(bin);

    videoFrame=edge(binCuadra, 'canny');
    ele = strel('square',3);
    % Dilatación
    imagen_dilatada = imdilate(videoFrame,ele);
    ele = strel('square',3);
    % Erosión
    imagen_erosionada = imerode(imagen_dilatada ,ele);
    
% Sección de segmentación de las celdas de la cuadricula y ajuste de las
% celdas.
    celdas_filas = dividirCeldas(imagen_erosionada);
    celdas_filas = ajusta(celdas_filas);


% Sección en la que se inicializan las variables del clasificador
    cellSize = [4 4];

    hogFeatureSize = length(X_training);


    numImages = 70;
    img_test = zeros(numImages, hogFeatureSize, 'single');
% Sección del clasificador que saca la letra o su ausencia utilizando la base de datos
% mediante un clasificador multiclase utilizando SVM binarios.
    for i = 1:numImages
        img = celdas_filas{i};
        img_test(i, :) = extractHOGFeatures(img, 'CellSize', cellSize);  
    end % Sacamos las caracteristicas de cada celda.
    
        classifier = fitcecoc(Total_training,clases);
        predictedLabels = predict(classifier, img_test); %Sacamos su clase estimada.
        
    for i = 1:length(celdas_filas)
        if sum(sum(celdas_filas{i})) < 1150 % Si tiene menos pixeles blancos que 
            res(i) = '0'; % este umbral se considera un espacio en blanco.
        else
            if predictedLabels(i)==2
                res(i)='P';
            elseif predictedLabels(i)==4
                res(i)='M';
            elseif predictedLabels(i)==1
                res(i)='X';
            elseif predictedLabels(i)==3
                res(i)='S';
            end
        end
    end
% Sección para devolver el resultado en el formato indicado para su postprocesado.
    a = 1; b = 10;
    for p = 1:7
        resultado(p,:) = res(a:b);
        a = a + 10;
        b = b + 10;
    end
    resultado = char(resultado);
end