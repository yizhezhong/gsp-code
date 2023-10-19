clc; clear all; close all;

% geometric graph
num_nodes = 5;
window_length = 10;
exp_neighbours = 4;
found = 0;
counter = 0;

base_g = grasp_non_directed_path(5);
base.A = full(base_g.A);

while found == 0
    geo_g = geometric(num_nodes, window_length, 3);
    %geo_g.A = add_random_edges(base_g.A);

    %Laplacian
    one = ones(size(geo_g.A, 1),1);
    D = diag(geo_g.A * one);
    L = D - geo_g.A;
    [eig_vec, eig_val] = eig(L);

    record = zeros(1,size(L,1));
    for matrix_i = 1:size(geo_g.A,1)
        for matrix_j = 1:size(geo_g.A,2)
            if geo_g.A(matrix_i, matrix_j) == 1
                record = record + abs(eig_vec(matrix_i,:) - eig_vec(matrix_j,:));
            end
        end
    end
    sort_rec = sort(record);
    if isequal(record, sort_rec) == 0
        display("found");
        record
        sort_rec
        counter
        full(geo_g.A)
        
        L;
    end

    counter = counter + 1;
end

path_g.show_graph_options.layout_boundaries = 0.1;
%grasp_show_graph(gca, g, 'node_text', 'ID');

%Laplacian
one = ones(size(path_g.A, 1),1);
D = diag(path_g.A * one);
L = D - path_g.A;
[eig_vec, eig_val] = eig(L);
%plot setting
[numRows,numCols] = size(eig_vec);

geo_g.show_graph_options.layout_boundaries = 0.1;

%Laplacian
one = ones(size(geo_g.A, 1),1);
D = diag(geo_g.A * one);
L = D - geo_g.A;
[eig_vec, eig_val] = eig(L);


%plot setting
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
        grasp_show_graph(gca, geo_g, ...
                         'node_values', eig_vec(:,i), ...
                         'show_colorbar', 1, ...
                         'value_scale', [-1, 1]);
        title(['λ = ', num2str(eig_val(i,i))])
    end
end