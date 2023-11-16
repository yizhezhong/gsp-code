function new_G = add_isol(G, graph_size, remove_amount)
    [numRows,numCols] = size(G.A);
    new_G = G;
    new_G.A(numRows,numCols+1) = 0;
    new_G.A(numRows+1,numCols) = 0;
    new_G = grasp_symetrise_unweighted(new_G);
    new_G.layout(numCols+1,1) = 10;
    new_G.layout(numCols+1,2) = 10;
end