A=12184560          %%总人口
u=0       %%自然增长率
p=0        %%有效接种率系数
e=1/3      %%潜伏期转化为感染期系数
a=2529/3792         %%因病死亡率系数
r=1-a         %%恢复率系数
b=0.000075         %%传染率
S=A        %%易感人群初始值
E=325         %%潜伏人群初始值
I=1878         %%感染人群初始值
R=1878-1142         %%移除人群初始值
t=100         %%拟合天数
data=[]
for i=1:t
    S=S+u*S-b*S*I-p*S
    E=E+b*S*I-(u+e)*E
    I=I+e*E-(u+a+r)*I
    R=R+r*I-u*R+p*S
    N=S+E+I+R
    data=[data;i,S,E,I,R,N]
end
plot(data(:,1),data(:,4))