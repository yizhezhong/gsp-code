function s = smoothness(A, signal)
    t = 0;
    x = 0;
    size(A, 1);
    count_edge = 0;
    for i = 1:size(A, 1)
        for j = 1:size(A, 1)
            if A(i, j) == 1
                t = t + (signal(i) - signal(j))^2;
            end
        end
    end
    s = t/2;
end