clc;
close all;
clear;
%进化的代数
T=150;
bound=[1.5,0.6,0.448;2,1,1];
optionsOrigin=gaoptimset('Generations',T,'PopulationSize',100,'MigrationFraction',0.2,'PopInitRange',bound,'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@fitness1,3,optionsOrigin);
Bestx=x
BestFval=fval


