clc;
close all;
clear all;
%�����Ĵ���
T=100;
optionsOrigin=gaoptimset('Generations',T/2,'PopInitRange',[-10,-5;0,2],'MigrationFraction',0.2);
[x,fval,reason,output,finnal_pop]=ga(@ch14_2f,2,optionsOrigin);
%���еڶ��ν�������
options1 = gaoptimset('Generations',T/2,'InitialPopulation',finnal_pop,'PlotFcns',@gaplotbestf,'MigrationFraction',0.2);
[x,fval,reason,output,final_pop]=ga(@ch14_2f,2,options1);
Bestx=x
BestFval=fval
