function error = alg_DTW_2(vec1,vec2,w)
    
    %% Algoritmo DTW con restricciones globales
    %  Ancho de ventana w
    
    a = size(vec1,2);
    b = size(vec2,2);
    w = max(w,abs(a-b));
    DTW = inf(a+1,b+1);
    a = a + 1;
    b = b + 1;
    DTW(1,1) = 0;

    for i=2:a
        for j = max(2,i-w):min(b,i+w)
            dis = norm(vec1(:,i-1) - vec2(:,j-1));
            n = min(DTW(i-1,j),DTW(i,j-1));
            m = min(n,DTW(i-1,j-1));
            DTW(i,j) = dis + m;
        end
    end
    error=DTW(a,b);
end