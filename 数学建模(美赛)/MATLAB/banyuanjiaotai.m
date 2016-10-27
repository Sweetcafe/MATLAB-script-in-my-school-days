function [Vtub,Stub_air,Stub]=banyuanjiaotai(x)
Vtub=1/3/2*pi*x(4)*((x(2)/2)^2+(x(3)/2)^2+x(2)/2*x(3)/2)+1/3*x(4)*(x(1)*x(2)+x(1)*x(3)+sqrt(x(1)*x(2)*x(1)*x(3)));
Stub_air=x(1)*x(2)+pi/2*((x(2))/2)^2;
l=sqrt((x(2)-x(3))^2+(x(4))^2);
Stub=x(1)*x(3)+pi/2*(x(3)/2)^2+pi/2*l*(x(2)/2+x(3)/2)+2*x(1)*l+1/2*(x(2)+x(3))*x(4);
end
