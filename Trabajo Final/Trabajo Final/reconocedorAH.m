function [comando] = reconocedorAH()

    load('VoiceMatrix.mat');

    audio = procesar_audio();
    
    x1 = []; x2 = []; x3 = []; x4 = []; x5 = [];
    
    p = rand();
    
    if p < 0.5
        
        x1(1) = alg_DTW(audio,sube);
        x1(2) = alg_DTW(audio,sube2);
        x1(2) = alg_DTW(audio,sube3);
        x1=min(x1);

        x2(1) = alg_DTW(audio,baja);
        x2(2) = alg_DTW(audio,baja2);
        x2(2) = alg_DTW(audio,baja3);
        x2=min(x2);

        x3(1) = alg_DTW(audio,izquierda);
        x3(2) = alg_DTW(audio,izquierda2);
        x3(3) = alg_DTW(audio,izquierda3);
        x3=min(x3);

        x4(1) = alg_DTW(audio,derecha);
        x4(2) = alg_DTW(audio,derecha2);
        x4(3) = alg_DTW(audio,derecha3);
        x4=min(x4);

        x5(1) = alg_DTW(audio,fuego);
        x5(2) = alg_DTW(audio,fuego2);
        x5(2) = alg_DTW(audio,fuego3);
        x5=min(x5);
        
    else

        x1(1) = alg_DTW_2(audio,sube,5);
        x1(2) = alg_DTW_2(audio,sube2,5);
        x1(2) = alg_DTW_2(audio,sube3,5);
        x1=min(x1);

        x2(1) = alg_DTW_2(audio,baja,5);
        x2(2) = alg_DTW_2(audio,baja2,5);
        x2(2) = alg_DTW_2(audio,baja3,5);
        x2=min(x2);

        x3(1) = alg_DTW_2(audio,izquierda,5);
        x3(2) = alg_DTW_2(audio,izquierda2,5);
        x3(3) = alg_DTW_2(audio,izquierda3,5);
        x3=min(x3);

        x4(1) = alg_DTW_2(audio,derecha,5);
        x4(2) = alg_DTW_2(audio,derecha2,5);
        x4(3) = alg_DTW_2(audio,derecha3,5);
        x4=min(x4);

        x5(1) = alg_DTW_2(audio,fuego,5);
        x5(2) = alg_DTW_2(audio,fuego2,5);
        x5(2) = alg_DTW_2(audio,fuego3,5);
        x5=min(x5);   
    end

    [~,en] = min([x1;x2;x3;x4;x5]);
    
    clear sube sube2 sube3 baja baja2 baja3 izquierda izquierda2 izquierda3 ...
          derecha derecha2 derecha3 fuego fuego2 fuego3;
      
    clear audio;
    
    switch en
        case 1
%             disp('Sube')
            comando = 'S'; 
            
        case 2
%             disp('Baja')
            comando = 'B';
            
        case 3
%             disp('Izquierda')
            comando = 'I';
            
        case 4
%             disp('Derecha')
            comando = 'D';
            
        case 5
%             disp('Fuego')
            comando = 'F';
    end
end


