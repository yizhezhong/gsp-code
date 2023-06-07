N = 50;
K = 4;
beta = 0.4;
g = grasp_watts_strogatz(N, K, beta);
grasp_show_graph(gca, g);