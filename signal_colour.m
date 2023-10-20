clc; clear all; close all;
%format short
%format rat
format shortG

honeycomb_g = triangular_honeycomb(2);
%honeycomb_g = grasp_non_directed_grid(2);
%honeycomb_g.A = full(honeycomb_g.A);
%honeycomb_g.A(4,10) = 1;
%honeycomb_g.A(10,4) = 1;
honeycomb_g = break_symmetry(honeycomb_g);

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
signals(:,:) = 0.01;
%signals = random_signals(signals, signal_lower_limits, signal_upper_limits, all_indexes, honeycomb_g);
signals = set_signals(signals, 1, row1_indexes, honeycomb_g);
signals = set_signals(signals, 0.5, row2_indexes, honeycomb_g);
signals = set_signals(signals,1,20,honeycomb_g);
%signals = random_signals(signals, -1, 1, all_indexes, honeycomb_g);

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
%H = GHPF(L,f);

signals_2 = signals;
%set attack here
attack_val = 1;
attack_node = 4;
signals_2(attack_node) = attack_val;

% Make the spread of the Gaussians be 20% of the a values
sigmas = 0.05 * signals % Also a column vector.
% Create the noise values that we'll add to a.
randomNoise = randn(length(signals), 1) .* sigmas
% Add noise to a to make an output column vector.
signals_wth_noise = signals + randomNoise
attack_val = 1;
attack_node = 4;
signals_wth_noise(attack_node) = signals_wth_noise(attack_node) + attack_val;

[phi, tor, return_cutoff, cutoff_index] = alg_1_ghpf(L, signals_wth_noise, 3, signals, 2);
phi
tor
if phi > tor
    display('attack')
end

%F{s}
[eig_vec, eig_val] = eig(L);

Fs = (eig_vec.')*signals;
%Fs_2 = (eig_vec.')*signals_2;
Fs_2 = (eig_vec.')*signals_wth_noise;
%Y = H*signals;
%Y = H*(eig_vec*Fs);
H = GHPF(L,cutoff_index);
%Y = eig_vec*(H*Fs);
Y = H*Fs;
Y
Fs
max_Y = max(abs(Y));
Y_2 = H*Fs_2;

figure(4)
grasp_show_graph(gca, honeycomb_g, ...
                 'node_values', Y, ...
                 'show_colorbar', 1, ...
                 'value_scale', [signal_lower_limits, signal_upper_limits]);
title(['Lowest ', num2str(f), ' Frequencies Removed'])

diag(eig_val)


figure(5)
plot(Y, '-o')

figure(6)
plot(diag(eig_val), '-o')

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
                     'node_values', signals_wth_noise, ...
                     'show_colorbar', 1, ...
                     'value_scale', [signal_lower_limits, signal_upper_limits]);
title('attacked')
nexttile
comp = [Fs; 0; attack_val];
signal_lower_limits = min(comp);
signal_upper_limits = max(comp);
grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', signals_wth_noise, ...
                     'show_colorbar', 1, ...
                     'value_scale', [signal_lower_limits, signal_upper_limits]);
title('attacked (actual scale)')

% Plot that spans
nexttile([2 3])
plot(diag(eig_val), Fs, '-o')
hold on
plot(diag(eig_val), Fs_2, '-x')

if phi > tor
    txt = 'Attack Detected';
    title(txt, 'Color', 'r')
else
    txt = 'Attack Not Detected';
    title(txt, 'Color', 'b')
end
xlabel('normalized frequency')
ylabel('frequency response')
yline(0,'--')
[eig_vec, eig_val] = eig(L);
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
    H
    H = GHPF(L,i);
    signals_gft_filter = eig_vec*(H*Fs);
    grasp_show_graph(gca, honeycomb_g, ...
                         'node_values', signals_gft_filter, ...
                         'show_colorbar', 1, ...
                         'value_scale', [-1, 1]);
    title(['Lowest ', num2str(i), ' Frequencies Removed'])
end