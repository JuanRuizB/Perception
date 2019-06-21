function en=engine()
load('todo3.mat');
load('todoAmpliado.mat');
disp("Di el movimiento que prefieras");
audio=practica4();
aleatorio=rand();
p1=[];p2=[];p3=[];p4=[];p5=[];
if aleatorio<0.5
p1(1)=crearmatriz(audio,delante);
p1(2)=crearmatriz(audio,delante2);
p1(3)=crearmatriz(audio,delante3);
p1(4)=crearmatriz(audio,delante4);
p1(5)=crearmatriz(audio,delante5);
p1=min(p1);
p2(1)=crearmatriz(audio,vuelta);
p2(2)=crearmatriz(audio,vuelta2);
p2(3)=crearmatriz(audio,vuelta3);
p2(4)=crearmatriz(audio,vuelta4);
p2(5)=crearmatriz(audio,vuelta5);
p2=min(p2);
p3(1)=crearmatriz(audio,derecha);
p3(2)=crearmatriz(audio,derecha2);
p3(3)=crearmatriz(audio,derecha3);
p3(4)=crearmatriz(audio,derecha4);
p3(5)=crearmatriz(audio,derecha5);
p3=min(p3);
p4(1)=crearmatriz(audio,izquierda);
p4(2)=crearmatriz(audio,izquierda2);
p4(3)=crearmatriz(audio,izquierda3);
p4(4)=crearmatriz(audio,izquierda4);
p4(5)=crearmatriz(audio,izquierda5);
p4=min(p4);
p5(1)=crearmatriz(audio,salir);
p5(2)=crearmatriz(audio,salir2);
p5(3)=crearmatriz(audio,salir3);
p5=min(p5);
else    
p1(1)=crearmatriz2(audio,delante,5);
p1(2)=crearmatriz2(audio,delante2,5);
p1(3)=crearmatriz2(audio,delante3,5);
p1(4)=crearmatriz2(audio,delante4,5);
p1(5)=crearmatriz2(audio,delante5,5);
p1=min(p1);
p2(1)=crearmatriz2(audio,vuelta,5);
p2(2)=crearmatriz2(audio,vuelta2,5);
p2(3)=crearmatriz2(audio,vuelta3,5);
p2(4)=crearmatriz2(audio,vuelta4,5);
p2(5)=crearmatriz2(audio,vuelta5,5);
p2=min(p2);
p3(1)=crearmatriz2(audio,derecha,5);
p3(2)=crearmatriz2(audio,derecha2,5);
p3(3)=crearmatriz2(audio,derecha3,5);
p3(4)=crearmatriz2(audio,derecha4,5);
p3(5)=crearmatriz2(audio,derecha5,5);
p3=min(p3);
p4(1)=crearmatriz2(audio,izquierda,5);
p4(2)=crearmatriz2(audio,izquierda2,5);
p4(3)=crearmatriz2(audio,izquierda3,5);
p4(4)=crearmatriz2(audio,izquierda4,5);
p4(5)=crearmatriz2(audio,izquierda5,5);
p4=min(p4);
p5(1)=crearmatriz2(audio,salir,5);
p5(2)=crearmatriz2(audio,salir2,5);
p5(3)=crearmatriz2(audio,salir3,5);
p5=min(p5);
end

[~,esc]=min([p1;p2;p3;p4;p5]);
if esc==1
    en=4;
else
    if esc==2
        en=2;
    else
        if esc==3
        en=1;
        else
            if esc==5
                en=5;
            else
            en=3;
            end
    end
end
end
clear delante delante2 delante3 delante4 delante5 vuelta vuelta2 vuelta3 vuelta4 vuelta5 ...
    derecha derecha2 derecha3 derecha4 derecha5 izquierda izquierda2 izquierda3 izquierda4 ...
    izquierda5 salir salir2 salir3;
clear audio;
end