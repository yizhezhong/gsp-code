function new_G = add_custom_center(G)
    [numRows,numCols] = size(G.A);    
    new_G = G;

    for i = 1:1
        new_G.A(numRows+i,numCols+i) = 0;
        new_G.A(numRows+i,:) = 1;
        new_G.A(numRows+i,numCols+i) = 0;
        %[numRows2,numCols2] = size(new_G.A)
        new_G = grasp_symetrise_unweighted(new_G);
    
        %[numRows,numCols] = size(new_G.layout);
        new_G.layout(numRows+i, 1) = new_G.layout(numRows+i-1,1) -5;
        new_G.layout(numRows+i, 2) = new_G.layout(numRows+i-1,2) -5;
    end
end