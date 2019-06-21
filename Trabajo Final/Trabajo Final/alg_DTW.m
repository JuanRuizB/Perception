function error = alg_DTW(vec1,vec2)
    
    %% Algoritmo DTW con restricciones locales

    a = size(vec1,2);
    b = size(vec2,2);
    DTW = zeros(a+1,b+1);

    for i=1:a+1
        DTW(i,1) = inf;
    end

    for i=1:b+1
        DTW(1,i) = inf;
    end

    DTW(1,1) = 0;
    for i=2:a+1
        for j=2:b+1
            dis = norm(vec1(:,i-1) - vec2(:,j-1));
            n = min(DTW(i-1,j),DTW(i,j-1));
            m = min(n,DTW(i-1,j-1));
            DTW(i,j) = dis + m;
        end
    end
    error = DTW(a+1,b+1);
end


