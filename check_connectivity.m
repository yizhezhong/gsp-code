%return 1 if connected
function connected = check_connectivity(G)
    row_all_zeros = find(all(G.A == 0,2));
    connected = isempty(row_all_zeros);
end    