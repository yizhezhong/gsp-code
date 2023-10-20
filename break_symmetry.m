function new_G = break_symmetry(G)
    [numRows,numCols] = size(G.A);
    new_G = G;
    new_G.A(numRows+1,numCols+1) = 0;
    new_G.A(numRows+1,numCols) = 1;
    new_G.A(numRows+1,numCols-1) = 1;
    new_G = grasp_symetrise_unweighted(new_G);

    [numRows,numCols] = size(G.layout);
    new_G.layout(numRows+1, 1) = 0;
    new_G.layout(numRows+1, 2) = 5;
end