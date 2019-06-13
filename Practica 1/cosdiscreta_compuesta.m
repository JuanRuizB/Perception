function [x,y] = cosdiscreta_compuesta(A,F,Fase,Fs,N)
    yc = 0;
    for i=1:size(A,2)
        [x,y] = cosdiscreta(N,Fs,A(i),F(i),Fase(i));
        yc = yc + y;
    end
    y = yc;
end
