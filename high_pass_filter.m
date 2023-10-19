function H = high_pass_filter(L, threshold)
    [eig_vec, eig_val] = eig(L);
    eig_vec*eig_val*(eig_vec')
    eig_val = diag(eig_val);
    %eig_val
    eig_val_filtered = unique(eig_val(threshold+1:size(eig_val, 1)), 'rows');
    %eig_val_filtered

    mult = eig_val_filtered - eig_val(1);
    %mult
    A = zeros(size(eig_val_filtered, 1));
    A(:,1) = 1;
    for i = 2:size(eig_val_filtered, 1)
        A(:,i) = eig_val_filtered.^(i-1);
    end
    A
    A = mult.*A;
    %A

    B = ones(size(A, 1),1);
    p = linsolve(A,B);
    %p
    P = zeros(size(eig_val, 1));
    
    for i = 1:size(p, 1)
        %p(i)*(L^(i-1));
        P = P + p(i)*(L^(i-1));
    end

    H = (L-eye(size(L,1)))*P;
    H
    %debug
    %O = eye(7);
    %H = (L - O) * (p(1)*O + p(2)*L + p(3)*L^2 + p(4)*L^3 + p(5)*L^4);
    %H
end  