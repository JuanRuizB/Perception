function segmentosfinales=Rabiner(m,cru)
%%Cogemos los diez primeros (ruido) y calculamos los parámetros con el
%%ruido, y seguimos el algoritmo
 cruce=cru(1:10);
 magnitude=m(1:10);
umbralsuperiorenergia=0.5*max(m);
umbralinferiorenergia=mean(magnitude)+2*std(magnitude);
Ucru=mean(cruce)+2*std(cruce);
ln=find(m(11:end)>umbralsuperiorenergia);
ln=ln(1)+10;
i=1:ln;ok=find(m(i)<umbralinferiorenergia);
le=ok(end);
if(le-25>0)
    n=le-25;
else
    n=11;
end
cont=0;
booleano=true;
i=le;
while booleano
 if(cont>3 || i<n)
  booleano=false;
  else if(cru(i)>Ucru)
  cont=cont+1;
  i=i-1;
    else
   cont=0;
   i=i-1;
    end
    end
end

if(cont>3)
    lz=i;
else
    lz=le;
end
cruce=cru(end-9:end);
 magnitude=m(end-9:end);
 
umbralinferiorenergia=mean(magnitude)+2*std(magnitude);
Ucru=mean(cruce)+2*std(cruce);
ln=find(m(11:end-10)>umbralsuperiorenergia);
ln=ln(end)+10;
i=ln:length(m);
ok=find(m(i)<umbralinferiorenergia);
le=ok(1)+ln;

if(le-25>0)
    n=le-25;
else
    n=11;
end
cont=0;
booleano=true;
i=le;
while booleano 
    if(cont>3 || i<n)
 booleano=false;
    else if(cru(i)>Ucru)
  cont=cont+1;
 i=i-1;
    else
 cont=0;
i=i-1;
    end
    end
end
if(cont>3)
    lf=i;
else
    lf=le;
end
segmentosfinales=lz:lf;
end