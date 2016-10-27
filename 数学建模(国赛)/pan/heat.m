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
figure
pdegplot(pdem, 'edgeLabels', 'on');
axis([-1.1 1.1 -1.1 1.1]);
title 'Geometry With Edge Labels Displayed'

% Solution is zero at all four outer edges of the square
applyBoundaryCondition(pdem,'Edge',(1:4), 'u', 0);
msh = generateMesh(pdem);
figure;
pdemesh(pdem);
axis equal
[p,~,t] = meshToPet(msh);
u0 = zeros(size(p,2),1);
ix = find(sqrt(p(1,:).^2+p(2,:).^2)<0.4);
u0(ix) = ones(size(ix));
nframes = 20;
tlist = linspace(0,0.1,nframes);
u1 = parabolic(u0,tlist,pdem,c,a,f,d);
figure
colormap(hot);
x = linspace(-1,1,31);
y = x;
[~,tn,a2,a3] = tri2grid(p,t,u0,x,y);
umax = max(max(u1));
umin = min(min(u1));
for j = 1:nframes,
    u = tri2grid(p,t,u1(:,j),tn,a2,a3);
    i = find(isnan(u));
    u(i) = zeros(size(i));
    surf(x,y,u);
    caxis([umin umax]);
    axis([-1 1 -1 1 0 1]);
    shading interp;
    Mv(j) = getframe;
end
movie(Mv,1);