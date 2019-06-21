function error=crearmatriz2(vector1,vector2,w)
n=size(vector1,2);
m=size(vector2,2);
w=max(w,abs(n-m));
DTW=inf(n+1,m+1);
n=n+1;
m=m+1;
DTW(1,1)=0;
for i=2:n
    for j=max(2,i-w):min(m,i+w)
        dist= d_euclid(vector1(:,i-1),vector2(:,j-1));
        mi=min(DTW(i-1, j), DTW(i , j-1));
        tra=min(mi,DTW(i-1, j-1));
        DTW(i, j) = dist + tra;
    end

    
end
error=DTW(n,m);

end