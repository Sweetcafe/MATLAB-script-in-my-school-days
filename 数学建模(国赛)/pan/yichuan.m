clc;clear;close all;
options=gaoptimset('StallTimeLimit',100);
[x,fval,reason]=ga(@fitnessfun,20)