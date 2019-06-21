function [norm] = procesar_audio()
    
    %% Grabación
    t = 2;
    Fs = 8000;
    Ch = 1;
    bits = 16;
    
    audio = audiorecorder(Fs,bits,Ch);
    disp('Habla');
    recordblocking(audio,t);
    disp('Audio acabado');
    senial = getaudiodata(audio);
    
    %% Preénfasis
    senial = filter([1 -0.9], 1, senial);
    
    %% Segmentación
    segs = buffer(senial,240,80,'nodelay');
    
    %% Enventanado
    ven = hamming(size(segs,1));
    envs = segs.*ven;
    
    %% Magnitud
    mags = sum(abs(envs));
    
    %% Cruces por cero
    j = 2:size(envs,1);
    cruces = sum(abs(sign(envs(j,:))-sign(envs(j-1,:)))/2)/size(envs,2);
    
    %% Inicio y fin de la palabra
    [ini,fin] = detect_IniFin(mags,cruces);
    
    % Elementos del segmento
    elems = segs(:,ini:fin);
    
    %% Coeficientes Cepstrum
    ceps = rceps(elems);
    ceps = ceps(2:13,:);
    
    %% Normalización
    medias = mean(ceps);
    desv = std(ceps);
    norm = (ceps-medias)./desv;

end