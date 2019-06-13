function resultaado = reconoce()
    load('E.mat');
    load('M.mat');
    load('P.mat');
    load('X.mat');
    load('Total.mat');
    
    img = imread('mapa.jpg');
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
    

    celdas_filas = dividirCeldas(imagen_erosionada);
    celdas_filas = ajusta(celdas_filas);


    
    cellSize = [4 4];

    hogFeatureSize = length(X_training);


    numImages = 70;
    img_test = zeros(numImages, hogFeatureSize, 'single');

    for i = 1:numImages
        img = celdas_filas{i};
        img_test(i, :) = extractHOGFeatures(img, 'CellSize', cellSize);  
    end
    
        classifier = fitcecoc(Total_training,clases);
        predictedLabels = predict(classifier, img_test);
        
    for i = 1:length(celdas_filas)
        if sum(sum(celdas_filas{i})) < 1150
            res(i) = '0';
        else
            if predictedLabels(i)==2
                res(i)='P';
                disp("P");
            elseif predictedLabels(i)==4
                res(i)='M';
                disp("M");
            elseif predictedLabels(i)==1
                res(i)='X';
                disp("X");
            elseif predictedLabels(i)==3
                res(i)='S';
                disp("S");
            end
        end
    end
    a = 1; b = 10;
    for p = 1:7
        resultado(p,:) = res(a:b);
        a = a + 10;
        b = b + 10;
    end
    resultado = char(resultado);
    
end