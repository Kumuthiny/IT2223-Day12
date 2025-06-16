nodes = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};

%Define edges using source and target nodes
s = [1 1 2 2 3 3]; %from
t = [2 3 4 5 6 7]; %to

%define edge weights
weights = [5 3 2 4 6 1];

%create a directed graph
G = digraph(s,t,weights,nodes);

%plot the tree
plot(G, 'Layout','layered','Direction','down','EdgeLabel',G.Edges.Weight);
title('simple weighted tree with 3 levels');