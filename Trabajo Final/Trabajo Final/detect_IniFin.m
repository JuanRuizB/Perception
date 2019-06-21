function [ini,fin] = detect_IniFin(m,cru)

    %% Algoritmo para detectar inicio y fin de palabra

    crus = cru(1:10);
    mags = m(1:10);
    
    umbSupE = 0.5 * max(m);
    umbInfE = mean(mags) + 2 * std(mags);
    umbCruZ = mean(crus) + 2*std(crus);
    
    a = find(m(11:end) > umbSupE);
    a = a(1) + 10;
    i = 1:a;
    b = find(m(i) < umbInfE);
    c = b(end);
    
    if(c - 25 > 0)
        d = c - 25;
    else
        d = 11;
    end
    cont = 0;
    e = true;
    i = c;
    while e
         if(cont > 3 || i < d)
            e  =false;
         else
            if(cru(i) > umbCruZ)
                cont = cont + 1;
                i = i - 1;
            else
                cont = 0;
                i = i - 1;
            end
         end
    end

    if(cont > 3)
        ini = i;
    else
        ini = c;
    end

    
    crus = cru(end-9:end);
    mags = m(end-9:end);

    umbInfE = mean(mags) + 2 * std(mags);
    umbCruZ = mean(crus) + 2 * std(crus);
    a = find(m(11:end-10) > umbSupE);
    a = a(end) + 10;
    i = a:length(m);
    b = find(m(i) < umbInfE);
    c = b(1) + a;
    
    if(c - 25 > 0)
        d = c - 25;
    else
        d = 11;
    end

    cont = 0;
    e = true;
    i = c;

    while e 
        if(cont > 3 || i < d)
            e = false;
        else
            if(cru(i) > umbCruZ)
                cont = cont + 1;
                i = i - 1;
            else
                cont = 0;
                i = i - 1;
            end
        end
    end

    if(cont > 3)
        fin = i;
    else
        fin = c;
    end
end

