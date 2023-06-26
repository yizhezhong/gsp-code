clc; clear all; close all;
format short
%format rat

honeycomb_g = triangular_honeycomb(2);
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
%signals = random_signals(signals, signal_lower_limits, signal_upper_limits, all_indexes, honeycomb_g);
signals = set_signals(signals, 1, row1_indexes, honeycomb_g);
signals = set_signals(signals, 0.5, row2_indexes, honeycomb_g);

coef = signals' * eig_vec;
signals_gft = eig_vec * coef';
coef
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
end