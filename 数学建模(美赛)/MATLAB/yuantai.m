function [Vtub,Stub_air,Stub]=yuantai(x)
Vtub=1/3*pi*x(3)*((x(1))^2+x(1)*x(2)+(x(2))^2);
l=sqrt((x(1)-x(2))^2+(x(3))^2);
Stub=pi*x(2)^2+pi*l*(x(1)+x(2));
Stub_air=pi*x(1)^2;
end