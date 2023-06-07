%this function sets values to the original signals matrix by indexes
%indexes format is [a b c ...], signals format is [a; b; c; ...]
function new_signals = set_signals(original_signals, signal_val, indexes, graph)
    new_signals = original_signals;
    for i = 1:size(indexes, 2)
            new_signals(indexes(1, i)) = signal_val;
    end
end