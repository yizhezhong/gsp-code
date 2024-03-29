function H = GHPF(L, threshold, mode)
    [eig_vec, eig_val_matrix] = eig(L);
    eig_val = diag(eig_val_matrix);
    %eig_val = uniquetol(eig_val(:,1), 'ByRows', true, 'stable');
    
    if mode == 1
        H = eye(size(eig_val_matrix));
        H(1:threshold,:) = 0;
    else
        [~, colindices] = uniquetol(eig_val(:,1), 1e-6, 'ByRows', true);   %get indices of unique value. Is sorted BY VALUE
        eig_val_sort = eig_val(sort(colindices));   %Use the indices sorted BY INDEX instead
    
        %mult
        M = zeros(size(eig_val, 1));
        M(:,1) = 1;
        for i = 2:size(eig_val, 1)
            M(:,i) = eig_val.^(i-1);
        end
    
        B = ones(size(M, 1),1);
        B(1:threshold) = 0;
    
        h = linsolve(M,B);
        %h = M\B;
        t = M*h;
        
        H = zeros(size(eig_val_matrix));
        for i = 1:size(h, 1)
            %p(i)*(L^(i-1));
            H = H + h(i)*(eig_val_matrix^(i-1));
        end
    
        %debug
        %O = eye(7);
        %H = (L - O) * (p(1)*O + p(2)*L + p(3)*L^2 + p(4)*L^3 + p(5)*L^4);
        %H
    end
end  