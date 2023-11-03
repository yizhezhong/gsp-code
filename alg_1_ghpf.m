function [phi, tor, return_cutoff, cutoff] = alg_1_ghpf(L, signals, e, historic_s, alpha)
    [U, Lambda] = eig(L); %step 1
    F = transpose(U)*signals; %step 2
    [numRows,numCols] = size(L); %step 3
    M = numCols;
    [eig_vec, eig_val] = eig(L);
    % for r = M:-1:1 %step 4
    %     sum = 0;
    %     for m = r:M
    %         sum = sum + (dot(F, eig_vec(:,m)))^2;
    %     end
    % 
    %     if e < sum
    %         cutoff = r;
    %         break
    %     end
    % end
    % 
    % H = GHPF(L, cutoff);

    % Fs = H*F;
    % phi = max(abs(Fs));

    phi_hist = zeros(size(historic_s, 2));
    for k = 1:size(historic_s, 2) %step 8
        [U, Lambda] = eig(L); %step 1
        F = transpose(U)*historic_s(:,k); %step 2
        [numRows,numCols] = size(L); %step 3
        M = numCols;
        [eig_vec, eig_val] = eig(L);
        for r = M:-1:1 %step 4
            sum = 0;
            for m = r:M
                sum = sum + (dot(F, eig_vec(:,m)))^2;
            end
            %sum
            if e < sum
                cutoff = r;
                return_cutoff = eig_val(r,r);
                break
            end
        end
        %cutoff
        %diag(Lambda)

        % ---- this is for sum vs. index comparison ----
        for r = M:-1:1 %step 4
            sum2 = 0;
            for m = r:M
                sum2 = sum2 + (dot(F, eig_vec(:,m)))^2;
            end
            error_sum(r) = sum2;
            %sum
            r
            sum2
        end
        
        figure(10)
        plot(error_sum, '-o')
        % ---- this is the end ----

        %set cutoff manually
        cutoff = round(M * 0.6)
        return_cutoff = eig_val(cutoff,cutoff);

        H = GHPF(L, cutoff);
        Fs = H*F;
        Fs
        phi_hist(k) = max(abs(Fs));
    end

    F = transpose(U)*signals; %step 2
    Fs = H*F;
    Fs
    phi = max(abs(Fs));

    u_phi = mean(phi_hist);
    sigma_phi = std(phi_hist);
    tor = u_phi + sigma_phi*alpha;
end