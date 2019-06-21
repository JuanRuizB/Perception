
booleano=0;
matrizinicial=zeros(7);
for i=1:size(matrizinicial,2)
   
   matrizinicial(size(matrizinicial,1),i)=1;
   
end
for i=1:size(matrizinicial,1)
   matrizinicial(i,1)=1;
   matrizinicial(i,size(matrizinicial,1))=1;
end
matrizinicial(4,:)=1;
matrizinicial(size(matrizinicial,1)-1,2)=inf;
fil=size(matrizinicial,1)-1,col=2
while booleano==0
   jugada=engine();
   anterior=matrizinicial(fil,col);
   filaanterior=fil;
   columnaanterior=col;
   anterior=matrizinicial(filaanterior,columnaanterior);
   if(strcmp(jugada,"terminar")==1)
      booleano=1;
      disp("entra en termina");
   else
       if(strcmp(jugada,"delante")==1)
           fil=fil-1;
           col=col;
           disp("entra en delante");
            if matrizinicial(fil-1,col)==1
                          disp("TE VAS A CHOCAR MONGOLO"); 
                           
            end
       else
           if(strcmp(jugada,"abajo")==1)
               fil=fil+1;
               col=col;
               disp("entra en abajo");
                if matrizinicial(fil+1,col)==1
                          disp("TE VAS A CHOCAR MONGOLO"); 
                           
                       end
           else
               if(strcmp(jugada,"izquierda")==1)
                   fil=fil;
                   col=col-1;
                   disp("entra en izquierda");
                    if matrizinicial(fil,col-1)==1
                          disp("TE VAS A CHOCAR MONGOLO"); 
                           
                       end
               else
                   if(strcmp(jugada,"derecha")==1)
                       disp("entra en derecha");
                       fil=fil;
                       col=col+1;
                       if (matrizinicial(fil,col+1)==1)
                          disp("TE VAS A CHOCAR MONGOLO"); 
                           
                       end
                   end
               end
           end
       end
   end
   
                       
    pause;
    
    disp(fil);
    disp(col);
    matrizinicial(filaanterior,columnaanterior)=0;
    matrizinicial(fil,col)=2;
    
    matrizinicial
    
    pause;
    
    
    
    
end



