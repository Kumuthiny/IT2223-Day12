%graph
%1.Write a MATLAB code to import a graph.Use the following source and
%destination data
%2.Using the imported data, draw the graph
%3.Write a MATLAB code to find and display the subgraph for the given
%nodes
%4.identify and display the adjacent vertices for each node 
%5. Label the edges oh the graph
%6. Label the nodes oh the graph
%7. write the MATLAB code to color the graph(graph coloring)
%8. write the MATLAB code to find the shortest path from node 1 to node 5

%source = [1,1,2,3,4]
%destination = [2,3,4,4,5]

% Task 1: Import Graph Using Source and Destination Data
source = [1, 1, 2, 3, 4];
destination = [2, 3, 4, 4, 5];

% Create graph
G = graph(source, destination);

% Task 2: Draw the Graph
figure;
plot(G);
title('Original Graph');

% Task 3: Subgraph for Given Nodes (e.g., nodes 1, 2, 3)
subNodes = [1 2 3];
subG = subgraph(G, subNodes);

figure;
plot(subG);
title('Subgraph with Nodes 1, 2, 3');

% Task 4: Display Adjacent Vertices for Each Node
disp('Adjacent vertices for each node:');
for i = 1:numnodes(G)
    neighbors = neighbors(G, i);
    fprintf('Node %d: ', i);
    disp(neighbors');
end

% Task 5 & 6: Label Edges and Nodes
figure;
p = plot(G, 'EdgeLabel', G.Edges.EndNodes(:,1) + "-" + G.Edges.EndNodes(:,2));
labelnode(p, 1:numnodes(G), 1:numnodes(G));
title('Graph with Labeled Nodes and Edges');

% Task 7: Graph Coloring (Greedy Algorithm)
colors = zeros(numnodes(G), 1); % color for each node
for u = 1:numnodes(G)
    neighborColors = colors(neighbors(G, u));
    c = 1;
    while ismember(c, neighborColors)
        c = c + 1;
    end
    colors(u) = c;
end

% Display Colored Graph
figure;
p = plot(G, 'NodeCData', colors, 'MarkerSize', 10, 'EdgeLabel', G.Edges.EndNodes(:,1) + "-" + G.Edges.EndNodes(:,2));
colorbar;
title('Graph Colored (Greedy Coloring)');
labelnode(p, 1:numnodes(G), 1:numnodes(G));

% Task 8: Find Shortest Path from Node 1 to Node 5
[spath, spathLen] = shortestpath(G, 1, 5);

fprintf('Shortest path from node 1 to node 5: ');
disp(spath);

fprintf('Length of shortest path: %d\n', spathLen);

% Highlight the shortest path on the graph
highlight(p, spath, 'EdgeColor', 'r', 'LineWidth', 2);
