function [Vtub,Stub_air,Stub]=lifangti(x)
%x(1)=2;
%x(2)=1;
%x(3)=1;
Vtub=x(1)*x(2)*x(3);
Stub_air=x(1)*x(2);
Stub=x(1)*x(2)+2*x(1)*x(3)+2*x(2)*x(3);
end
