function new_A = add_random_edges(A)
    [numRows,numCols] = size(A);
    new_A = A;
    set = 0;
    while set == 0
        r_row = randi([1,numRows],1,1);
        r_col = randi([1,numCols],1,1);
        if new_A(r_row, r_col) == 0
            new_A(r_row, r_col) = 1;
            new_A(r_col, r_row) = 1;
            set = 1;
        end
    end
end