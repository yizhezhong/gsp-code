clc; clear all; close all;
detected_num = 0;
failed_num = 0;
forced_stop = 0;
detected_num_comparision = 0;
failed_num_comparision = 0;
%-----
center_edge_probability = 1;
%-----

for test_round = 1:100                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    stop_sign = 0; %set to 1 to stop when failed
    if forced_stop == 1
        break
    end
    test_round
    clearvars -except test_round detected_num failed_num forced_stop stop_sign detected_num_comparision failed_num_comparision center_edge_probability; close all;
    %format short
    %format rat
    format shortG

    %-------------------------------------------settings-----------------------------------------
    settings_mode = 100;
    eig_colour = 1;
    hold_inc = 0;
    add_center = 0;
    custom_center = 0;
    shortcut_distance = 0;
    two_switch_num = 0;
    show_comparision = 0;
    break_value = 1;
    if settings_mode == 100
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2;
        remove_amount = 3;
        attack_val = 0.5;
        attack_node = 14;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
    elseif settings_mode == 1
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
    elseif settings_mode == 10
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
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 5;
        show_comparision = 1;
    elseif settings_mode == 11
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 0;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 0;
        show_comparision = 0;
        custom_center = 1;
    elseif settings_mode == 12
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 10;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 5;
        show_comparision = 1;
    elseif settings_mode == 13
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 10;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 4;
        show_comparision = 1;
    elseif settings_mode == 14
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 10;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 3;
        show_comparision = 1;
    elseif settings_mode == 15
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 17;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 0;
        show_comparision = 0;
        custom_center = 1;
    elseif settings_mode == 16
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 10;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 0;
        show_comparision = 1;
        custom_center = 0;
        two_switch_num = 1;
    elseif settings_mode == 17
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
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 0;
        show_comparision = 1;
        custom_center = 0;
        two_switch_num = 1;
    elseif settings_mode == 18
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
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 0;
        show_comparision = 1;
        custom_center = 0;
        two_switch_num = 1;
    elseif settings_mode == 19
        filter_mode = 1; %ideal = 1
        signal_mode = 2; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 0;
        attack_val = 0.1;
        attack_node = 4;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 0;
        show_comparision = 1;
        custom_center = 0;
        two_switch_num = 1;
    elseif settings_mode == 20
        filter_mode = 1; %ideal = 1
        signal_mode = 1; %set signals here (mode 1: rows; mode 2: layers)
        graph_size = 2;
        break_amount = 2; 
        remove_amount = 3;
        attack_val = 0.1;
        attack_node = 17;
        attack_method = 2; % 1 = override; 2 = addition
        noise_on = 0; % 0 = without noise; 1 = with noise
        noise_coefficient = 0; %e.g. 0.05, only matters when noise_on is 1
        add_center = 0;
        center_node = 1:21;
        shortcut_distance = 0;
        show_comparision = 1;
        center_compare = 1;
        custom_center = 1;
        if test_round == 1 || mod(test_round-1, 10) == 0
            center_edge_probability = center_edge_probability - 0.1
            detected_num = 0;
            failed_num = 0;
            detected_num_comparision = 0;
            failed_num_comparision = 0;
        end
    end
    %--------------------------------------------------------------------------------------------

    total_nodes = 1+graph_size*(graph_size+1)/2*6;
    honeycomb_g = triangular_honeycomb(graph_size);

    %honeycomb_g = grasp_non_directed_grid(5); %grid
    %honeycomb_g.A = full(honeycomb_g.A);

    debug = 0;
    if debug == 1
        hhh = 2;
        honeycomb_g.layout(hhh,1) = -10;
        honeycomb_g.layout(hhh,2) = -10;
    end
    %honeycomb_g = grasp_non_directed_grid(2);
    %honeycomb_g.A = full(honeycomb_g.A);
    %honeycomb_g.A(4,10) = 1;
    %honeycomb_g.A(10,4) = 1;

    temp_G = honeycomb_g;
    connected = 0;
    while connected == 0
        honeycomb_g = temp_G;
        honeycomb_g = remove_edges(honeycomb_g, graph_size, remove_amount);
        honeycomb_g = break_symmetry(honeycomb_g, graph_size, break_amount);
        %honeycomb_g = add_isol(honeycomb_g, graph_size, break_amount);
    
        if add_center == 0
        else
            for i = 1:add_center
                honeycomb_g = create_center(honeycomb_g, center_node(i));
            end
        end
        connected = check_connectivity(honeycomb_g);
    end

   % if shortcut_distance > 0
     %   honeycomb_g = add_shortcut(honeycomb_g, shortcut_distance);
   % end
    
    honeycomb_g.show_graph_options.layout_boundaries = 0.1;
    
    signal_lower_limits = -1;
    signal_upper_limits = 1;
    %row_rest = [0 -1 -2 -3];
    %row_rest_indexes = rows2indexes(row_rest, sqrt(3), honeycomb_g);
    %node values
    %[V,D] = eig(honeycomb_g.A);
    
    row_spacing = sqrt(3); %grid = 1
    all_indexes = 1:size(honeycomb_g.A, 1);
    row1_indexes = rows2indexes(2, row_spacing, honeycomb_g);
    row2_indexes = rows2indexes(1, row_spacing, honeycomb_g);
    row0_indexes = rows2indexes(0, row_spacing, honeycomb_g);
    rown1_indexes = rows2indexes(-1, row_spacing, honeycomb_g);
    rown2_indexes = rows2indexes(-2, row_spacing, honeycomb_g);
    signals = zeros(size(honeycomb_g.layout, 1), 1);

    % row1_indexes = rows2indexes(9, row_spacing, honeycomb_g); %grid
    % row2_indexes = rows2indexes(7, row_spacing, honeycomb_g);
    % row0_indexes = rows2indexes(5, row_spacing, honeycomb_g);
    % rown1_indexes = rows2indexes(3, row_spacing, honeycomb_g);
    % rown2_indexes = rows2indexes(1, row_spacing, honeycomb_g);
    
    if signal_mode == 1
        %signals = random_signals(signals, signal_lower_limits, signal_upper_limits, all_indexes, honeycomb_g);
        signals = set_signals(signals, 1, row1_indexes, honeycomb_g);
        signals = set_signals(signals, 0.6, row2_indexes, honeycomb_g);
        signals = set_signals(signals, 0.2, row0_indexes, honeycomb_g);
        signals = set_signals(signals, 0.6, rown1_indexes, honeycomb_g);
        signals = set_signals(signals, 1, rown2_indexes, honeycomb_g);
        break_value = 1;
        %signals = set_signals(signals,0,20,honeycomb_g);
        %signals = random_signals(signals, -1, 1, all_indexes,
        %honeycomb_g); 
    elseif signal_mode == 2
        first_node = 1;
        for layer = 0:graph_size
            total_nodes = 1+layer*(layer+1)/2*6;
            layer_indexes = first_node:total_nodes;
            signals = set_signals(signals, (layer+1)/(graph_size+1),layer_indexes, honeycomb_g);
            first_node = total_nodes + 1;
        end
    elseif signal_mode == 3
        signals(:,:) = 0.01;
        %signals = random_signals(signals, signal_lower_limits, signal_upper_limits, all_indexes, honeycomb_g);
        signals = set_signals(signals, 1, row1_indexes, honeycomb_g);
        signals = set_signals(signals, 0.5, row2_indexes, honeycomb_g);
        %signals = set_signals(signals,0,20,honeycomb_g);
        %signals = random_signals(signals, -1, 1, all_indexes, honeycomb_g);
    elseif signal_mode == 4 %compare to mode 1
        %signals = random_signals(signals, signal_lower_limits, signal_upper_limits, all_indexes, honeycomb_g);
        signals = set_signals(signals, 0.6, row1_indexes, honeycomb_g);
        signals = set_signals(signals, 1, row2_indexes, honeycomb_g);
        signals = set_signals(signals, 0.2, row0_indexes, honeycomb_g);
        signals = set_signals(signals, 1, rown1_indexes, honeycomb_g);
        signals = set_signals(signals, 0.6, rown2_indexes, honeycomb_g);
        %signals = set_signals(signals,0,20,honeycomb_g);
        %signals = random_signals(signals, -1, 1, all_indexes,
        %honeycomb_g); 
        break_value = 0.6;
    end
    % total_nodes = 25; %grid
    break_indexes = total_nodes+1:total_nodes+break_amount;
    signals = set_signals(signals, break_value, break_indexes, honeycomb_g);

    if custom_center == 1
        signal_sum = sum(signals);
        avg_signal = signal_sum/(size(honeycomb_g.A, 1));
        honeycomb_g = add_custom_center(honeycomb_g);
        signals(size(honeycomb_g.A, 1)) = 0;
        custom_center_node = (size(honeycomb_g.A, 1));
        if attack_node == 0
            attack_node = custom_center_node;
        end
        signals(custom_center_node) = avg_signal;
        nodes_to_center = find_connection(honeycomb_g, custom_center_node);
        if center_edge_probability < 1
            for i = 1:size(nodes_to_center, 2)
                exst = randi([1 100],1,1);
                if exst > center_edge_probability*100
                    honeycomb_g.A(custom_center_node, nodes_to_center(i)) = 0;
                    honeycomb_g.A(nodes_to_center(i), custom_center_node) = 0;
                end
            end
        end
        nodes_to_center_new = find_connection(honeycomb_g, custom_center_node); 
        
        center_node_connections = find_connection(honeycomb_g, custom_center_node);
        all_nodes = 1:(size(honeycomb_g.A, 1)-1);
        non_adj_nodes = setdiff(all_nodes, center_node_connections);

        if isempty(nodes_to_center_new)
            fprintf('no nodes to center\n')
            hold_inc = 1;
        elseif isempty(non_adj_nodes)
            hold_inc = 1;
        elseif check_connectivity(honeycomb_g) == 0
            hold_inc = 1;     
        else
            attack_node = nodes_to_center_new(randi([1, size(nodes_to_center_new, 2)], 1, 1));
        end
    end
%----
    one = ones(size(honeycomb_g.A, 1),1);
    D = diag(honeycomb_g.A * one);
    L = D - honeycomb_g.A;
    [eig_vec, eig_val] = eig(L);
%----
    coef = signals' * eig_vec;
    %signals_gft = eig_vec * coef';
    signals_gft = transpose(eig_vec) * signals;

    %
    % smoothness_original = smoothness(honeycomb_g.A, signals)
    
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
    title('Original Signal')
    nexttile
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals_after_attack, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
    title('Attacked Signal')
    nexttile
    comp = [Fs; 0; attack_val];
    signal_lower_limits = min(comp);
    signal_upper_limits = max(comp);
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals_after_attack, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
    title('Attacked Signal (dynamic range scale)')
    
    % Plot that spans
    t = nexttile([2 3]);
    plot(diag(eig_val), Y, '-o')
    hold on
    plot(diag(eig_val), Y_2, '-x')
    
    if phi > tor
        txt = 'Attack Detected';
        %display('attack')
        %title(txt, 'Color', 'r')
        dim = [.2 .5 .3 .3];     
        %annotation('textbox',dim,'String',txt,'FitBoxToText','on');
        a = annotation('textbox',dim,'String',txt,'Position',t.Position,'verticalalignment','top','horizontalalignment','left','FitBoxToText','on');
        a.Color = 'red';
        if hold_inc == 1
        else
            detected_num = detected_num + 1;
        end
    else
        txt = 'Attack Not Detected';
        %title(txt, 'Color', 'b')
        dim = [.2 .5 .3 .3];     
        %annotation('textbox',dim,'String',txt,'FitBoxToText','on');
        a = annotation('textbox',dim,'String',txt,'Position',t.Position,'verticalalignment','top','horizontalalignment','left','FitBoxToText','on');
        a.Color = 'blue';
        if hold_inc == 1
        else
            failed_num = failed_num + 1;
        end
        forced_stop = stop_sign;
    end
    xlabel('Normalized Frequency')
    ylabel('Frequency Response')
    yline(0,'--')
    [eig_vec, eig_val] = eig(L);
    
    %cutoff = return_cutoff;
    cutoff = return_cutoff/max(eig_val,[],"all");
    xline(cutoff,'--')
    legend('Origional Signal','Attacked Signal')
    
    figure(8)
    plot(diag(eig_val), Fs, '-o')
    title('Signal After Graph Fourier Transform')
    xlabel('Frequency (eigenvalue)')
    ylabel('Magnitude')
    yline(0,'--')
    %hold on
    %plot(diag(eig_val), Fs_2, '-x')
    
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
%end

%success_rate = detected_num/(detected_num + failed_num)*100;
%fprintf('detected %d, failed %d, success rate %.2f%%\n', detected_num, failed_num, success_rate)


%------------------------eigenvector_Laplacian_colour------------
if eig_colour == 1
    one = ones(size(honeycomb_g.A, 1),1);
    D = diag(honeycomb_g.A * one);
    L = D - honeycomb_g.A;
    [eig_vec, eig_val] = eig(L);
    [numRows,numCols] = size(eig_vec);
    %p = numSubplots(numCols)
    num_plots = numCols;%round(sqrt(numCols));
    space = ceil(numCols/num_plots);
    p = numSubplots(num_plots);
    
    figure(10)
    for i = 1:space:numCols
        j = (i-1)/space + 1;
        subplot(p(1),p(2),j)
        grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', eig_vec(:,i), ...
                         'show_colorbar', 1, ...
                         'value_scale', [-1, 1]);
        title(['λ = ', num2str(eig_val(i,i))])
    end
end
%---------------------------------------------------------------



    %% -----------------------------for comparision----------------------------------------------------
    
    if show_comparision == 1
        if shortcut_distance > 0
            honeycomb_g = add_shortcut(honeycomb_g, shortcut_distance);
        end

        if center_compare == 1
            center_node_connections = find_connection(honeycomb_g, custom_center_node);
            all_nodes = 1:(size(honeycomb_g.A, 1)-1);
            non_adj_nodes = setdiff(all_nodes, center_node_connections);
            if isempty(non_adj_nodes)
                fprintf('no non-adj nodes\n')
            else
                attack_node = non_adj_nodes(randi([1, size(non_adj_nodes, 2)], 1, 1));
            end
        else
            honeycomb_g = two_switch(honeycomb_g, two_switch_num);
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

        if custom_center == 1
            signal_sum = sum(signals);
            avg_signal = signal_sum/(size(honeycomb_g.A, 1)-1);
            signals(size(honeycomb_g.A, 1)) = 0;
            custom_center_node = (size(honeycomb_g.A, 1));
            if attack_node == 0
                attack_node = custom_center_node;
            end
            signals(custom_center_node) = avg_signal;
        end
        
        coef = signals' * eig_vec;
        %signals_gft = eig_vec * coef';
        signals_gft = transpose(eig_vec) * signals;

        % smoothness_comparision = smoothness(honeycomb_g.A, signals)
        % while smoothness_comparision > smoothness_original
        %     signals = L * signals;
        %     smoothness_comparision = smoothness(honeycomb_g.A, signals)
        % end
        
        figure(10)
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
        
        figure(11)
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
        
        figure(12)
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
        
        figure(13)
        grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', Y, ...
                         'show_colorbar', 1, ...
                         'value_scale', [signal_lower_limits, signal_upper_limits]);
        title(['Lowest ', num2str(f), ' Frequencies Removed'])
        
        diag(eig_val);
        
        
        figure(14)
        plot(Y, '-o')
        
        figure(15)
        plot(diag(eig_val), '-o')
        
        %eig_val = eig_val;
        eig_val = eig_val./max(eig_val,[],"all");
        
        figure(16)
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
            if hold_inc == 1
            else
                detected_num_comparision = detected_num_comparision + 1;
            end
        else
            txt = 'Attack Not Detected';
            title(txt, 'Color', 'b')
            if hold_inc == 1
            else
                failed_num_comparision = failed_num_comparision + 1;
            end
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
        
        figure(17)
        plot(diag(eig_val), Fs, '-o')
        hold on
        plot(diag(eig_val), Fs_2, '-x')
        
        %% test filter
        [eig_vec, eig_val] = eig(L);
        figure(19)
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
        success_rate_comparision = detected_num_comparision/(detected_num_comparision + failed_num_comparision)*100;
        fprintf('comparision: detected %d, failed %d, success rate %.2f%%\n', detected_num_comparision, failed_num_comparision, success_rate_comparision)
    end
end