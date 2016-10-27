function [G,Ceq]=nonlcon(x)
G=x
0.2*sum(G(1:75))-sum(G(76:201))>=0