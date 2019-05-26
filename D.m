clear;
m=moviein(20);
for i=1:20
sita=meshgrid(eps:pi/180:pi);
fai=meshgrid(eps:2*pi/180:2*pi)';
l=i*0.1;
r=abs(cos(2.*pi.*l.*cos(sita))-cos(2*pi*l))./(sin(sita)+eps);
rmax=max(max(r));
[x,y,z]=sph2cart(fai,pi/2-sita,r/rmax);
mesh(x,y,z);
axis([-1 1 -1 1 -1 1]);title(' 对称振子空间立体方向图 ');
m(:,i)=getframe;
end
