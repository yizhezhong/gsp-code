clc; clear all; close all;

%G = grasp_non_directed_path(20);
G = grasp_non_directed_grid(10);
%G = triangular_honeycomb(20);
num_nodes = 100; window_length = 10; radius = -1;
%G = geometric(num_nodes, window_length, radius);
G.A = full(G.A);
for i = 1:100
    %G.A = add_random_edges(G.A)
end

G.show_graph_options.layout_boundaries = 0.1;
%grasp_show_graph(gca, g, 'node_text', 'ID');

%Laplacian
one = ones(size(G.A, 1),1);
D = diag(G.A * one);
L = D - G.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

t = zeros(numCols,1);
for i = 1:numCols
    t(i,1) = TV(G.A, eig_vec(:,i));
end
figure(2)
plot(diag(eig_val),t, '-o')
xlabel('frequencies')
ylabel('TV of mods')

%G = grasp_non_directed_path(20);
G = grasp_non_directed_grid(10);
%G = triangular_honeycomb(20);
num_nodes = 100; window_length = 10; radius = -1;
%G = geometric(num_nodes, window_length, radius);
G.A = full(G.A);
for i = 1:300
    G.A = add_random_edges(G.A)
end

G.show_graph_options.layout_boundaries = 0.1;
%grasp_show_graph(gca, g, 'node_text', 'ID');

%Laplacian
one = ones(size(G.A, 1),1);
D = diag(G.A * one);
L = D - G.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);
p = numSubplots(numCols);

t = zeros(numCols,1);
for i = 1:numCols
    t(i,1) = TV(G.A, eig_vec(:,i));
end
figure(3)
plot(t, '-o')
xlabel('frequencies')
ylabel('TV of mods')

%%
figure(1)
for i = 1:numCols
    subplot(p(1),p(2),i)
    grasp_show_graph(gca, G, ...
                     'node_values', eig_vec(:,i), ...
                     'show_colorbar', 1, ...
                     'value_scale', [-1, 1]);
    title(['λ = ', num2str(eig_val(i,i))])
end