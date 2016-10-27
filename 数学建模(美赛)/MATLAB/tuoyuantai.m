function [Vtub,Stub_air,Stub]=tuoyuantai(x)
Vtub=1/3*pi*(x(3)*x(4)-x(1)*x(2))*x(5);
Stub_air=pi*x(1)*x(2);
Stub=pi*sqrt((x(1)-x(3))^2+x(5)^2)*((x(2))^2/x(1)-(x(4))^2/x(3))+pi*x(3)*x(4);
end