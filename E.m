clear all;
lam= 1000;%波长
k = 2*pi./lam;
L = lam/4;%臂长lam/4,lam/2,(lam*3)/4,lam
theta = 0:pi/10000:2*pi;
f =(cos(k*L*cos(theta))-cos(k*L))./sin(theta);
polarplot(theta,abs(f));%极坐标归一化E面方向图
