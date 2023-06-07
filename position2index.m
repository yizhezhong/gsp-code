%this function checks the index of node in a given graph by its position
function index = position2index(position, edge_length, graph)
    [numRows,numCols] = size(graph.layout);
    for i = 1:numRows
        if ismembertol(position(1), graph.layout(i,1), edge_length*0.01) ... %edge_length is used to determine a tolerance
                && ismembertol(position(2), graph.layout(i,2), edge_length*0.01)
            index = i
            break
        end
    end
end