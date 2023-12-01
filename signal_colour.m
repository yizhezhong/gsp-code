clc; clear all; close all;
detected_num = 0;
failed_num = 0;
forced_stop = 0;

for test_round = 1:1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    stop_sign = 0; %set to 1 to stop when failed
    if forced_stop == 1
        break
    end
    test_round
    clearvars -except detected_num failed_num forced_stop stop_sign; close all;
    %format short
    %format rat
    format shortG

    %-------------------------------------------settings-----------------------------------------
    settings_mode = 8;
    add_center = 0;
    if settings_mode == 1
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
    elseif settings_mode == 2
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 2;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
    elseif settings_mode == 3
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 2;
        attack_method = 1; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
    elseif settings_mode == 4
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
    elseif settings_mode == 5
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 2;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
    elseif settings_mode == 6
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 2;
        attack_method = 1; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
    elseif settings_mode == 7
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 1;
        center_node = attack_node;
    elseif settings_mode == 8
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 2;
        attack_method = 1; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 1;
        center_node = attack_node;
    elseif settings_mode == 9
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 1;
        attack_node = 2;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 21;
        center_node = 1:21;
    end
    %--------------------------------------------------------------------------------------------

    total_nodes = 1+graph_size*(graph_size+1)/2*6;
    honeycomb_g = triangular_honeycomb(graph_size);
    %honeycomb_g = grasp_non_directed_grid(2);
    %honeycomb_g.A = full(honeycomb_g.A);
    %honeycomb_g.A(4,10) = 1;
    %honeycomb_g.A(10,4) = 1;
    
    honeycomb_g = remove_edges(honeycomb_g, graph_size, remove_amount);
    honeycomb_g = break_symmetry(honeycomb_g, graph_size, break_amount);
    %honeycomb_g = add_isol(honeycomb_g, graph_size, break_amount);

    if add_center == 0

    else
        for i = 1:add_center
            honeycomb_g = create_center(honeycomb_g, center_node(i));
        end
    end
    
    honeycomb_g.show_graph_options.layout_boundaries = 0.1;
    
    one = ones(size(honeycomb_g.A, 1),1);
    D = diag(honeycomb_g.A * one);
    L = D - honeycomb_g.A;
    [eig_vec, eig_val] = eig(L);
    
    signal_lower_limits = -1;
    signal_upper_limits = 1;
    %row_rest = [0 -1 -2 -3];
    %row_rest_indexes = rows2indexes(row_rest, sqrt(3), honeycomb_g);
    %node values
    %[V,D] = eig(honeycomb_g.A);
    
    all_indexes = 1:size(honeycomb_g.A, 1);
    row1_indexes = rows2indexes(2, sqrt(3), honeycomb_g);
    row2_indexes = rows2indexes(1, sqrt(3), honeycomb_g);
    signals = zeros(size(honeycomb_g.layout, 1), 1);
    
    if signal_mode == 1
        signals(:,:) = 0.01;
        %signals = random_signals(signals, signal_lower_limits, signal_upper_limits, all_indexes, honeycomb_g);
        signals = set_signals(signals, 1, row1_indexes, honeycomb_g);
        signals = set_signals(signals, 0.5, row2_indexes, honeycomb_g);
        %signals = set_signals(signals,0,20,honeycomb_g);
        %signals = random_signals(signals, -1, 1, all_indexes, honeycomb_g);
    elseif signal_mode == 2
        first_node = 1;
        for layer = 0:graph_size
            total_nodes = 1+layer*(layer+1)/2*6;
            layer_indexes = first_node:total_nodes;
            signals = set_signals(signals, (layer+1)/(graph_size+1),layer_indexes, honeycomb_g);
            first_node = total_nodes + 1;
        end
    end
    break_indexes = total_nodes+1:total_nodes+break_amount;
    signals = set_signals(signals, 1, break_indexes, honeycomb_g);
    
    coef = signals' * eig_vec;
    %signals_gft = eig_vec * coef';
    signals_gft = transpose(eig_vec) * signals;
    
    figure(1)
    subplot(1, 2, 1)
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
    %title('original graph')
    
    subplot(1, 2, 2)
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals_gft, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
    %title('after graph fourier transform')
    
    figure(2)
    p = numSubplots(size(eig_val, 1));
    for i = 1:size(eig_val, 1)
        subplot(p(1),p(2),i)
        coef(end - i + 1: end) = 0;
        signals_gft_filter = eig_vec * coef';
        grasp_show_graph(gca, honeycomb_g, ...
                             'node_values', signals_gft_filter, ...
                             'show_colorbar', 1, ...
                             'value_scale', [signal_lower_limits, signal_upper_limits]);
        title(['Highest ', num2str(i), ' Frequencies Removed'])
        %title(['ϕ', num2str(i)])
    end
    
    coef = signals' * eig_vec;
    signals_gft = eig_vec * coef';
    
    figure(3)
    p = numSubplots(size(eig_val, 1));
    for i = 1:size(eig_val, 1)
        subplot(p(1),p(2),i)
        coef(1:i) = 0;
        signals_gft_filter = eig_vec * coef';
        grasp_show_graph(gca, honeycomb_g, ...
                             'node_values', signals_gft_filter, ...
                             'show_colorbar', 1, ...
                             'value_scale', [signal_lower_limits, signal_upper_limits]);
        title(['Lowest ', num2str(i), ' Frequencies Removed'])
    end
    
    %% filter
    f = 1;
    %H = high_pass_filter(L,f);
    %H = GHPF(L,f,filter_mode); %ideal = 1
    
    %-----------------attack here------------------------------------------
    signals_after_attack = signals;
    if noise_on == 0
        if attack_method == 1 %override
            signals_after_attack(attack_node) = attack_val;
        elseif attack_method == 2 %addition
            signals_after_attack(attack_node) = signals_after_attack(attack_node) + attack_val;
        end
    elseif noise_on == 1
        % Make the spread of the Gaussians be 20% of the a values
        sigmas = noise_coefficient * signals; % Also a column vector. %0.05
        % Create the noise values that we'll add to a.
        randomNoise = randn(length(signals), 1) .* sigmas;
        % Add noise to a to make an output column vector.
        signals_after_attack = signals + randomNoise;
        if attack_method == 1 %override
            signals_after_attack(attack_node) = attack_val;
        elseif attack_method == 2 %addition
            signals_after_attack(attack_node) = signals_after_attack(attack_node) + attack_val;
        end
    end
    %----------------------------------------------------------------------
    
    [phi, tor, return_cutoff, cutoff_index] = alg_1_ghpf(L, signals_after_attack, 3, signals, 2);
    
    %F{s}
    [eig_vec, eig_val] = eig(L);
    
    Fs = (eig_vec.')*signals;
    %Fs_2 = (eig_vec.')*signals_2;
    Fs_2 = (eig_vec.')*signals_after_attack;
    %Y = H*signals;
    %Y = H*(eig_vec*Fs);
    H = GHPF(L,cutoff_index, filter_mode); %ideal = 1
    %Y = eig_vec*(H*Fs);
    Y = H*Fs;
    %Y
    %Fs
    max_Y = max(abs(Y));
    Y_2 = H*Fs_2;
    
    figure(4)
    grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', Y, ...
                     'show_colorbar', 1, ...
                     'value_scale', [signal_lower_limits, signal_upper_limits]);
    title(['Lowest ', num2str(f), ' Frequencies Removed'])
    
    diag(eig_val);
    
    
    figure(5)
    plot(Y, '-o')
    
    figure(6)
    plot(diag(eig_val), '-o')
    
    %eig_val = eig_val;
    eig_val = eig_val./max(eig_val,[],"all");
    
    figure(7)
    tiledlayout(3,3)
    nexttile
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
    title('original')
    nexttile
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals_after_attack, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
    title('attacked')
    nexttile
    comp = [Fs; 0; attack_val];
    signal_lower_limits = min(comp);
    signal_upper_limits = max(comp);
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals_after_attack, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
    title('attacked (actual scale)')
    
    % Plot that spans
    nexttile([2 3])
    plot(diag(eig_val), Y, '-o')
    hold on
    plot(diag(eig_val), Y_2, '-x')
    
    if phi > tor
        txt = 'Attack Detected';
        %display('attack')
        title(txt, 'Color', 'r')
        detected_num = detected_num + 1;
    else
        txt = 'Attack Not Detected';
        title(txt, 'Color', 'b')
        failed_num = failed_num + 1;
        forced_stop = stop_sign;
    end
    xlabel('normalized frequency')
    ylabel('frequency response')
    yline(0,'--')
    [eig_vec, eig_val] = eig(L);
    
    %cutoff = return_cutoff;
    cutoff = return_cutoff/max(eig_val,[],"all");
    xline(cutoff,'--')
    legend('origional','attacked')
    
    figure(8)
    plot(diag(eig_val), Fs, '-o')
    hold on
    plot(diag(eig_val), Fs_2, '-x')
    
    %% test filter
    [eig_vec, eig_val] = eig(L);
    figure(9)
    p = numSubplots(size(eig_val, 1));
    for i = 1:size(eig_val, 1)
        subplot(p(1),p(2),i)
        coef(1:i) = 0;
        %H;
        H = GHPF(L, i, filter_mode); %ideal = 1
        signals_gft_filter = eig_vec*(H*Fs);
        grasp_show_graph(gca, honeycomb_g, ...
                             'node_values', signals_gft_filter, ...
                             'show_colorbar', 1, ...
                             'value_scale', [-1, 1]);
        title(['Lowest ', num2str(i), ' Frequencies Removed'])
    end
    success_rate = detected_num/(detected_num + failed_num)*100;
    fprintf('detected %d, failed %d, success rate %.2f%%\n', detected_num, failed_num, success_rate)
end

%success_rate = detected_num/(detected_num + failed_num)*100;
%fprintf('detected %d, failed %d, success rate %.2f%%\n', detected_num, failed_num, success_rate)