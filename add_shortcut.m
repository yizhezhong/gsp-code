function new_G = add_shortcut(G, distance)
    new_G = G;
    [numRows,numCols] = size(new_G.A);
    added = 0;
    count = 0;
    while added == 0 && count < 100
        r_1 = randi([1 numCols],1,1);
        A_k = new_G.A^distance;
        r_2 = randi([1 numCols],1,1);
        for num = 1:numCols
            r_2 = mod(r_2 + num, numCols) + 1;
            if A_k(r_1, r_2) > 0
                A_sum = 0;
                for i = 1:distance
                    A_sum = A_sum + new_G.A^i;
                end
                if A_sum(r_1, r_2) == A_k(r_1, r_2)
                    new_G.A(r_1, r_2) = 1;
                    added = 1;
                    fprintf('add shortcut %d %d\n', r_1, r_2)
                    break
                end
            end
        end
        count = count + 1;
    end
    if count >= 100
        fprintf('add shortcut failed\n')
    end
    new_G = grasp_symetrise_unweighted(new_G);
end