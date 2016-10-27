function [Vtub,Stub_air,Stub]=tuoqiu(a,b,c,H,h)
syms x y z 
Vtub=int(int(int(x^2/a^2+y^2/b^2+z^2/c^2-1,z,-1*c,c),y,-1*b,b),x,-1*a,a)
Stub_air=4*pi*a*b*(1-H^2/c^2)
q=H^2/c^2
S=pi*a*b
V=4/3*pi*a*b*c
end