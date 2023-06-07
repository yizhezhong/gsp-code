%this function sets random values to the original signals matrix by indexes
%indexes format is [a b c ...], signals format is [a; b; c; ...]
function new_signals = random_signals(original_signals, signal_lower_limits, signal_upper_limits, indexes, graph)
    new_signals = original_signals;
    for i = 1:size(indexes, 2)
            new_signals(indexes(1, i)) = (signal_upper_limits - signal_lower_limits)*rand(1) + signal_lower_limits;
    end
end