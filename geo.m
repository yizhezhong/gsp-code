clc; clear all; close all;

% geometric graph
num_nodes = 100;
window_length = 10;
exp_neighbours = 4;
found = 0;
while found == 0
    radius = sqrt(exp_neighbours/(num_nodes-1)*(window_length*2)^2/pi)

    geo_g = geometric(num_nodes, window_length, radius);
    avg_deg = sum(geo_g.A, "all")/num_nodes
    if avg_deg > 3.95 && avg_deg < 4.05
        found = 1;
    end
end

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