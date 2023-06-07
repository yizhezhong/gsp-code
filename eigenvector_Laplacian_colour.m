clc; clear all; close all;

%% path graph
path_g = grasp_non_directed_path(6);
path_g.A = full(path_g.A);

path_g.show_graph_options.layout_boundaries = 0.1;
%grasp_show_graph(gca, g, 'node_text', 'ID');

%Laplacian
one = ones(size(path_g.A, 1),1);
D = diag(path_g.A * one);
L = D - path_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

figure(1)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, path_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
path_g.A = add_random_edges(path_g.A);

%Laplacian
one = ones(size(path_g.A, 1),1);
D = diag(path_g.A * one);
L = D - path_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

figure(4)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, path_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
%% grid graph
grid_g = grasp_non_directed_grid(6);
grid_g.A = full(grid_g.A);

grid_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(grid_g.A, 1),1);
D = diag(grid_g.A * one);
L = D - grid_g.A;
[eig_vec, eig_val] = eig(L);

[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(2)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, grid_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
grid_g.A = add_random_edges(grid_g.A);

%Laplacian
one = ones(size(grid_g.A, 1),1);
D = diag(grid_g.A * one);
L = D - grid_g.A;
[eig_vec, eig_val] = eig(L);

[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(5)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, grid_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
%% triangular honeycomb graph
honeycomb_g = triangular_honeycomb(2);

honeycomb_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(honeycomb_g.A, 1),1);
D = diag(honeycomb_g.A * one);
L = D - honeycomb_g.A;
[eig_vec, eig_val] = eig(L);
[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(3)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
honeycomb_g.A = add_random_edges(honeycomb_g.A);

%Laplacian
one = ones(size(honeycomb_g.A, 1),1);
D = diag(honeycomb_g.A * one);
L = D - honeycomb_g.A;
[eig_vec, eig_val] = eig(L);
[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(6)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
clc; clear all; close all;

%% path graph
path_g = grasp_non_directed_path(6);
path_g.A = full(path_g.A);

path_g.show_graph_options.layout_boundaries = 0.1;
%grasp_show_graph(gca, g, 'node_text', 'ID');

%Laplacian
one = ones(size(path_g.A, 1),1);
D = diag(path_g.A * one);
L = D - path_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

figure(1)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, path_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
path_g.A = add_random_edges(path_g.A);

%Laplacian
one = ones(size(path_g.A, 1),1);
D = diag(path_g.A * one);
L = D - path_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

figure(4)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, path_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
%% grid graph
grid_g = grasp_non_directed_grid(6);
grid_g.A = full(grid_g.A);

grid_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(grid_g.A, 1),1);
D = diag(grid_g.A * one);
L = D - grid_g.A;
[eig_vec, eig_val] = eig(L);

[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(2)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, grid_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
grid_g.A = add_random_edges(grid_g.A);

%Laplacian
one = ones(size(grid_g.A, 1),1);
D = diag(grid_g.A * one);
L = D - grid_g.A;
[eig_vec, eig_val] = eig(L);

[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(5)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, grid_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
%% triangular honeycomb graph
honeycomb_g = triangular_honeycomb(2);

honeycomb_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(honeycomb_g.A, 1),1);
D = diag(honeycomb_g.A * one);
L = D - honeycomb_g.A;
[eig_vec, eig_val] = eig(L);
[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(3)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
honeycomb_g.A = add_random_edges(honeycomb_g.A);

%Laplacian
one = ones(size(honeycomb_g.A, 1),1);
D = diag(honeycomb_g.A * one);
L = D - honeycomb_g.A;
[eig_vec, eig_val] = eig(L);
[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(6)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
clc; clear all; close all;

%% path graph
path_g = grasp_non_directed_path(6);
path_g.A = full(path_g.A);

path_g.show_graph_options.layout_boundaries = 0.1;
%grasp_show_graph(gca, g, 'node_text', 'ID');

%Laplacian
one = ones(size(path_g.A, 1),1);
D = diag(path_g.A * one);
L = D - path_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

figure(1)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, path_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
path_g.A = add_random_edges(path_g.A);

%Laplacian
one = ones(size(path_g.A, 1),1);
D = diag(path_g.A * one);
L = D - path_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

figure(4)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, path_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
%% grid graph
grid_g = grasp_non_directed_grid(6);
grid_g.A = full(grid_g.A);

grid_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(grid_g.A, 1),1);
D = diag(grid_g.A * one);
L = D - grid_g.A;
[eig_vec, eig_val] = eig(L);

[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(2)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, grid_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
grid_g.A = add_random_edges(grid_g.A);

%Laplacian
one = ones(size(grid_g.A, 1),1);
D = diag(grid_g.A * one);
L = D - grid_g.A;
[eig_vec, eig_val] = eig(L);

[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(5)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, grid_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
%% triangular honeycomb graph
honeycomb_g = triangular_honeycomb(2);

honeycomb_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(honeycomb_g.A, 1),1);
D = diag(honeycomb_g.A * one);
L = D - honeycomb_g.A;
[eig_vec, eig_val] = eig(L);
[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(3)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end

%part2
%add random edges
honeycomb_g.A = add_random_edges(honeycomb_g.A);

%Laplacian
one = ones(size(honeycomb_g.A, 1),1);
D = diag(honeycomb_g.A * one);
L = D - honeycomb_g.A;
[eig_vec, eig_val] = eig(L);
[numRows,numCols] = size(eig_vec);
%p = numSubplots(numCols)
num_plots = round(sqrt(numCols));
space = ceil(numCols/num_plots);
p = numSubplots(num_plots);

figure(6)
for i = 1:space:numCols
    j = (i-1)/space + 1;
    subplot(p(1),p(2),j)
    grasp_show_graph(gca, honeycomb_g, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end
