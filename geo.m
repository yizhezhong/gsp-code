clc; clear all; close all;

%% geometric graph
geo_g = geometric(100,10,3);

geo_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(geo_g.A, 1),1);
D = diag(geo_g.A * one);
L = D - geo_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(1)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, geo_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
