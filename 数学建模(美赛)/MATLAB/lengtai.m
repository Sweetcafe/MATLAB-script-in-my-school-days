function [Vtub,Stub_air,Stub]=lengtai(x);
Vtub=1/3*(x(1)*x(2)+x(3)*x(4)+sqrt(x(1)*x(3)*x(2)*x(4)))*x(5);
Stub_air=x(1)*x(2);
Stub=(x(2)+x(4))*sqrt((x(1)-x(3))^2+x(5)^2)+(x(1)+x(3))*sqrt((x(2)-x(4))^2+x(5)^2)+x(3)*x(4);
end