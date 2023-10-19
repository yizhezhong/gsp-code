function t = TV(A, signal)
    t = 0;
    size(A, 1)
    for i = 1:size(A, 1)
        for j = i:size(A, 1)
            if A(i, j) == 1
                t = t + (signal(i) - signal(j))^2;
            end
        end
    end
    t
end