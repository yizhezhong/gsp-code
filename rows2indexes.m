%this function finds the positions of nodes of an entire row
%row numbers start from (0, 0)
function indexes = rows2indexes(rows, row_space, graph)
    [numRows,numCols] = size(graph.layout);
    indexes = [];
    for i = 1:numRows
        if ismembertol(graph.layout(i,2), rows * row_space, row_space*0.01) ... %row_space is used to determine a tolerance
            indexes = [indexes, i];
        end
    end
end