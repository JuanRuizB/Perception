function tfshifted = eliminaCoeficientes(tfshifted, radio, nVeces);


    figure(2), imshow(log(1-tfshifted), []);
    for i = 1:nVeces
        [x,y] = ginput(1);
        x = round(x); y = round(y);
        tfshifted(y-radio:y+radio,x-radio:x+radio)=0;
        tfshifted(size(tfshifted,1)-(y+radio):size(tfshifted,1)-(y-radio),size(tfshifted,2)-(x+radio):size(tfshifted,2)-(x-radio))=0;
        
    end
    close(2);
end