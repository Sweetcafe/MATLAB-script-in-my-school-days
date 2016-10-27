clc;
close all;
clear all;
%进化的代数
T=100;
optionsOrigin=gaoptimset('Generations',T/2,'PopInitRange',[-10,-5;0,2],'MigrationFraction',0.2);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,optionsOrigin);
%进行第二次接力进化
options1 = gaoptimset('Generations',T/2,'InitialPopulation',finnal_pop,'PlotFcns',@gaplotbestf,'MigrationFraction',0.2);
[x,fval,reason,output,final_pop]=ga(@ch14_2f,2,options1);
Bestx=x
BestFval=fval
