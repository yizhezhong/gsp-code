function new_G = break_symmetry(G, graph_size, break_amount)
    [numRows,numCols] = size(G.A);
    total_nodes = 1+graph_size*(graph_size+1)/2*6;
    new_G = G;
    counter_1 = 0;
    counter_2 = 0;
    for i = 1:break_amount   
        %[numRows,numCols] = size(new_G.layout);
        if mod(i,2) == 0
            counter_1 = counter_1 + 1;
            new_G.A(numRows+i,numCols+i) = 0;
            new_G.A(numRows+i,numCols+i-2*counter_1) = 1;
            %[numRows2,numCols2] = size(new_G.A)
            new_G = grasp_symetrise_unweighted(new_G);
            new_G.layout(numRows+i, 1) = new_G.layout(numRows,1);
            new_G.layout(numRows+i, 2) = new_G.layout(numRows,2) + sqrt(3)*(counter_1);
        elseif mod(i,2) == 1
            counter_2 = counter_2 + 1;
            new_G.A(numRows+i,numCols+i) = 0;
            new_G.A(numRows+i,numCols+i-2*counter_2) = 1;
            %[numRows2,numCols2] = size(new_G.A)
            new_G = grasp_symetrise_unweighted(new_G);
            new_G.layout(numRows+i, 1) = new_G.layout(numRows-1,1);
            new_G.layout(numRows+i, 2) = new_G.layout(numRows-1,2) + sqrt(3)*(counter_2);
        end
    end
    new_G.A(numRows+break_amount,numCols+break_amount-1) = 1;
    [numRows,numCols] = size(new_G.A);
    %new_G.A(numRows, total_nodes-1) = 1;
    new_G = grasp_symetrise_unweighted(new_G);
end