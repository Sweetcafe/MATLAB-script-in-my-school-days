clc;
close all;
clear;
%进化的代数
T=150;
boundl=[0.4,0.4,0.3,0.8,];
bound=[boundl;boundl*2];
optionsOrigin=gaoptimset('Generations',T,'PopulationSize',100,'MigrationFraction',0.2,'PopInitRange',bound,'PlotFcns',@gaplotbestf);
[x,fval,reason,output,finnal_pop]=ga(@fitness7,4,optionsOrigin);
Bestx=x
BestFval=fval