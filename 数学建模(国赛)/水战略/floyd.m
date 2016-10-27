close all;clear;clc
D=xlsread('D（加水系流向）.xls')
n=size(D,1);
for i=1:n
   for j=1:n
     R(i,j)=j;
   end
end
R
 
for k=1:n
   for i=1:n
      for j=1:n
         if D(i,k)+D(k,j)<D(i,j)
            D(i,j)=D(i,k)+D(k,j);
            R(i,j)=R(i,k);
         end
      end
   end
end
xlswrite('Dfloyd.xls',D)
xlswrite('R.xls',R)
