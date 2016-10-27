% 求解椭圆型方程的例子
clear 
g='mygeom';
b='mybound';
% 定义区域，边界条件。mygeom是定义区域的子函数名，函数名可根据自己的
% 需要取定，区域的确定规则由pdegeom函数说明，注意pdegeom函数只是说
% 明如何定义区域，它并不直接确定区域；mybound是定义边界条件的子函数
% 名，与区域类似，边界的确定规则由函数pdebound确定。下面我会详细介绍
% 区域和边界的取法。
[p,e,t] = initmesh(g);
% 网格初始化，此处也可以写成[p,e,t] = initmesh('mygeom');这样可以省略上面的% 语句
[p,e,t] = refinemesh(g,p,e,t);
[p,e,t] = refinemesh(g,p,e,t);
% 加密网格两次，需要加密几次重复几次即可，根据具体问题确定加密次数。
U= assempde(b,p,e,t,1,0,'2*(x+y)-4');
% 调用assempde函数计算方程的数值解，assempde函数的详细用法可以参考
% MATH网站或者PDE的使用指南。常用的用法是[u,res]=assempde(b,p,e,t,c,a,f)，
% 其中b为边界条件，此处也可以写为'mybound'，p,e,t，为网格参数，c,a,f，为方程的参数，后面也可以加猜测值以及各种属性。 
pdesurf(p,t,U)
grid on
xlabel('x');ylabel('y');zlabel('u')
colorbar
view([60 30])
pause
%title('u=x^2+y^2-xy(x+y)')
exact=p(1,:).^2+p(2,:).^2-p(1,:).*p(2,:).*(p(1,:)+p(2,:));
exact=exact';
figure 
pdesurf(p,t,U-exact)
grid on
xlabel('x');ylabel('y');zlabel('error')
colorbar
view([60 30])
