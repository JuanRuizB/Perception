function senal=preenfasis(senal, grado)
senal =filter([1 -grado], 1, senal);
end