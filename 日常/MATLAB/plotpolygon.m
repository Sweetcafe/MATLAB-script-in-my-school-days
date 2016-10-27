clear;clc;close all
n=5
a=1
if nargin<2
    a=1;
end
t=(0:n)*2*pi/n;
theta=(n-2)*pi/2/n;
%公式s=(a*n/2)*根号下r^2-(a/2)^2

r=a/2/cos(theta);
s=(a*n/2)*sqrt(r^2-(a/2)^2)
r=r/s;
x=r*cos(t)
y=r*sin(t)
plot(x,y,'r-');
