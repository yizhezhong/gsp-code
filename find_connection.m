function nodes = find_connection(G, node)
    [numRows,numCols] = size(G.A);
    nodes = [];
    for i = 1:numCols
        if G.A(node, i) == 1
            nodes = [nodes, i];
        end
    end
end