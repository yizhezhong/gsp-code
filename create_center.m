function new_G = create_center(G, center_node)
    [numRows,numCols] = size(G.A);
    new_G = G;
    new_G.A(center_node,:) = 1;
    new_G = grasp_symetrise_unweighted(new_G);
end