function H = low_pass_filter(L, threshold)
    [eig_vec, eig_val] = eig(L);
    eig_val = diag(eig_val);
    eig_val_filtered = eig_val(1:size(eig_val, 1)-threshold);

    mult = eig_val_filtered - eig_val(1);
    A = zeros(size(eig_val_filtered, 1));
    A(:,1) = 1;
    for i = 2:size(eig_val_filtered, 1)
        A(:,i) = eig_val_filtered.^i;
    end
    A = mult.*A;

    B = ones(size(A, 1),1);
    p = linsolve(A,B);

    P = zeros(size(eig_val, 1));
    for i = 1:size(p, 1)
        %p(i)*(L^(i-1));
        P = P + p(i)*(L^(i-1));
    end

    H = (L-eye(size(L,1)))*P;
end  