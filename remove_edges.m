function new_G = remove_edges(G, graph_size, remove_amount)
    [numRows,numCols] = size(G.A);
    total_nodes = 1+graph_size*(graph_size+1)/2*6;

    new_G = G;

    for i = 1:remove_amount
        removed = 0;
        while removed == 0
            r = randi([1 total_nodes],1,1);
            dir = randi([1 4],1,1);
            if dir == 1
                for i = 1:r-2
                    if new_G.A(r, i) == 1
                        new_G.A(r, i) = 0;
                        new_G.A(i, r) = 0;
                        removed = 1;
                        break
                    end
                end
            elseif dir == 2
                if new_G.A(r, max(r-1,1)) == 1
                    new_G.A(r, max(r-1,1)) = 0;
                    new_G.A(max(r-1,1), r) = 0;
                    removed = 1;
                end
            elseif dir == 3
                if new_G.A(r,  min(r+1,total_nodes)) == 1
                    new_G.A(r, min(r+1,total_nodes)) = 0;
                    new_G.A(min(r+1,total_nodes), r) = 0;
                    removed = 1;
                end
            elseif dir == 4
                for i = min(r+2,total_nodes):total_nodes
                    if new_G.A(r, i) == 1
                        new_G.A(r, i) = 0;
                        new_G.A(i, r) = 0;
                        removed = 1;
                        break
                    end
                end
            end
        end
    end
  
    [numRows,numCols] = size(new_G.A);
    new_G = grasp_symetrise_unweighted(new_G);
end