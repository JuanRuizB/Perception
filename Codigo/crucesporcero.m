function salida=crucesporcero(enven)
j=2:size(enven,1);
salida=sum(abs(sign(enven(j,:))-sign(enven(j-1,:)))/2)/size(enven,2);
end