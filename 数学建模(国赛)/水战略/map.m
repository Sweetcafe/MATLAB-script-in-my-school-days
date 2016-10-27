clc;close all;clear
%% 载入地图数据
% 载入各省的多边形数据
sheng=shaperead('maps/bou2_4p.shp', 'UseGeoCoords', true);% 省
% 检查数据发现中午名称为乱码，可能是由于字符编码引起的，需要纠正文件导入时出现的乱码
% 中文名称记录在相应的dbf文件中，可以使用Excel打开，并且不会出现乱码，截取其中的中文保存为文本文件
% 然后在导入工作区，并将其保存为*.mat格式文件，随用随取。
% 依次替换sheng数据中的乱码【算是变通之法，有谁知道更好的方法一定告诉我哦】
load chinese_name.mat % 省，省会，主要城市的正确中文
for i=1:length(sheng)
    sheng(i).NAME=sheng_chinese_name{i}; % 纠正中文显示错误
end
unique(sheng_chinese_name) % 含有34个省（直辖市）的数据
length(sheng) % 共分为925个区块
%% 使用importdata向导导入2011年全国31个省的数据
% data为人口数目 textdata为省名称
d=importdata('gaodu.txt');
%d=importdata('renkou.txt');
data=d.data; % 海拔高度
textdata=d.textdata; % 相对应的省的名称
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% mapchina  
clc;clear;clf  
% shapefile中都包含了国界和省界  
fnshp_L='C:\Users\Administrator\Documents\MATLAB\maps\bou2_4l.shp';%ShapeType: 'PolyLine'  
fnshp_P='C:\Users\Administrator\Documents\MATLAB\maps\bou2_4p.shp';%ShapeType: 'Polygon'  
infoL = shapeinfo(fnshp_L);  
infoP = shapeinfo(fnshp_P);  
readL=shaperead(fnshp_L);  
readP=shaperead(fnshp_P);  
subplot(121);mapshow(readL);title('PolyLine of China')  
subplot(122);mapshow(readP);title('Polygon of China') 