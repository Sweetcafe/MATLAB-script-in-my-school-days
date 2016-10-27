function [x,y]=mygeom(bs,s) 
nbs=4; % 表示边界的段数 
if nargin==0, 
x=nbs; % 不给定输入变量时，输出表示几何区域边界的线段数 
return 
end 
d=[ 
0 0 0 0 % 表示每条线段起始值的参量值t（四条边界，所以有四列） 
1 1 1 1 % 表示每条线段的终点值参量值t 
0 0 0 0 % 沿线段方向左边区域的标识值，如果是1，表示选定左边区域，如果 
            % 是0，表示不选定左边区域 
1 1 1 1 % 沿线段方向右边区域的标识值，规则同上。 
]; 
bs1=bs(:)'; 
if find(bs1<1 | bs1>nbs), 
error('PDE:squareg:InvalidBs', 'Non existent boundary segment number.') 
end 
if nargin==1, 
x=d(:,bs1); % 给定一个输入变量时，输出区域边界数据的矩阵 
return 
end 
x=zeros(size(s)); 
y=zeros(size(s)); 
[m,n]=size(bs); 
if m==1 && n==1, 
bs=bs*ones(size(s)); % expand bs 
elseif m~=size(s,1) || n~=size(s,2), 
error('PDE:squareg:SizeBs', 'bs must be scalar or of same size as s.'); 
end 
if ~isempty(s),
% 第一段边界
ii=find(bs==1); 
if length(ii) 
x(ii)=interp1([d(1,1),d(2,1)],[0 1],s(ii));% 通过参量来确定边界上的值 
y(ii)=interp1([d(1,1),d(2,1)],[1 1],s(ii));% 
end
% 第二段边界
ii=find(bs==2); 
if length(ii) 
x(ii)=interp1([d(1,2),d(2,2)],[1 1],s(ii)); 
y(ii)=interp1([d(1,2),d(2,2)],[1 0],s(ii)); 
end 
% 第三段边界
ii=find(bs==3); 
if length(ii) 
x(ii)=interp1([d(1,3),d(2,3)],[1 0],s(ii)); 
y(ii)=interp1([d(1,3),d(2,3)],[0 0],s(ii)); 
end
% 第四段边界
ii=find(bs==4); 
if length(ii) 
x(ii)=interp1([d(1,4),d(2,4)],[0 0],s(ii)); 
y(ii)=interp1([d(1,4),d(2,4)],[0 1],s(ii)); 
end 
end