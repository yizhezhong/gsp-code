function H = smoothness_test(L, signal)
    [numRows,numCols] = size(L);
    [eig_vec, eig_val] = eig(L);
    h = zeros(numCols);
    for n = 1:numCols
        Sn = [];
        for i = 1:numCols
            if eig_val(i) < eig_val(n)*(1+1e-4) && eig_val(i) > eig_val(n)*(1-1e-4)
                Sn = [Sn i]
            end
        end
        for j = 1:size(Sn, 2)
            
        h(n) = 1/size(Sn, 2)
end