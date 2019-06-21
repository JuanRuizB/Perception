function error=crearmatriz(vector1,vector2)
n=size(vector1,2);
m=size(vector2,2);
DTW=zeros(n+1,m+1);
for i=1:n+1
DTW(i,1)=inf;
end
for i=1:m+1
DTW(1,i)=inf;
end

DTW(1,1)=0;
for i=2:n+1
    for j=2:m+1
        dist= d_euclid(vector1(:,i-1),vector2(:,j-1));
        mi=min(DTW(i-1, j), DTW(i , j-1));
        tra=min(mi,DTW(i-1, j-1));
        DTW(i, j) = dist + tra;
    end

    
end
error=DTW(n+1,m+1);

end