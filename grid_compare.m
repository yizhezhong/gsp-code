clc; clear all; close all;

%% grid graph
grid_g = grasp_non_directed_grid(5);
grid_g.A = full(grid_g.A);

grid_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(grid_g.A, 1),1);
D = diag(grid_g.A * one);
L = D - grid_g.A;
[eig_vec, eig_val] = eig(L);

[numRows,numCols] = size(eig_vec);
num_plots = 6; %round(sqrt(numCols)/2)
%space = ceil(numCols/num_plots);
p = numSubplots(num_plots);
fig_num = round(numCols/num_plots);

for n = 1:fig_num
    figure(n)
    j = 0;
    for i = (n-1)*num_plots+1:min(n*num_plots, numCols) %1:space:numCols
        j = j+1;
        %j = (i-1)/space + 1;
        subplot(p(1),p(2),j)
        %subplot(p(1),p(2),i)
        grasp_show_graph(gca, grid_g, ...
                         'node_values', eig_vec(:,i), ...
                         'show_colorbar', 1, ...
                         'value_scale', [-1, 1]);
        title(['λ = ', num2str(eig_val(i,i))])
    end
end