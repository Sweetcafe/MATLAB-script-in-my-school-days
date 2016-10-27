clc;
close all;
clear;
%进化的代数
T=150;
boundl=[1.5,0.625,0.8,0.31,0.448];
bound=[boundl;boundl*2];
optionsOrigin=gaoptimset('Generations',T,'PopulationSize',100,'MigrationFraction',0.2,'PopInitRange',bound,'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@fitness2,5,optionsOrigin);
Bestx=x
BestFval=fval


