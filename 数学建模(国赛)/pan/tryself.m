clear;clc;close all
g = @squareg;
c = 1;
a = 0;
f = 1;
d = 1;
numberOfPDE = 1;
pdem = createpde(numberOfPDE);
geometryFromEdges(pdem,g);
% Plot the geometry and display the edge labels for use in the boundary
% condition definition.

