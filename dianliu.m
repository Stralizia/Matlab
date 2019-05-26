clc;     
clear all   
clf; 
tic;                 %计时   
lambda=1;    
N=31;a=0.0000001;%已知天线和半径 
ii=1;    
for h=0.2:0.1:0.9   
L=h*lambda;    
len=L/N;%将线分成奇数段,注意首末两端的电流为0   
e0=8.854e-012; 
u0=4*pi*10^(-7); 
k=2*pi/lambda;      
ata=sqrt(u0/e0);   
z(1)=-L/2+len/2;    
for n=2:N    
    z(n)=z(n-1)+len;    
end    
for m=1:N    
    for n=1:N    
        if (m==n)    
            p(m,n)=log(len/a)/(2*pi)-1i*k*len/4/pi;   
        else     
            r(m,n)=sqrt((z(m)-z(n))^2+a^2);     
            p(m,n)=len*exp(-1i*k*r(m,n))/(4*pi*r(m,n));   
        end    
    end 
end     
for m=1:N    
    q(m)=cos(k*z(m)); 
    s(m)=sin(k*z(m));     
    t(m)=sin(k*abs(z(m)))/(1i*2*ata);    
end    
pp=p(N+1:N^2-N);    
pp=reshape(pp,N,N-2);   
mat=[pp,q',s'];%构造矩阵   
I=mat\t';    
II=[0;I(1:N-2);0];%加上两端零电流     
Current=abs(II);   
x=linspace(-L/2,L/2,N);            
figure(1);   
string=['b','g','r','y','c','k','m','r'];     
string1=['ko','bo','yo','co','mo','ro','go','bo'];   
plot(x,Current,string(ii),'linewidth',1.3);    
xlabel('L/\lambda'),ylabel('电流分布');   
grid on    
hold on   
legend('L=0.1\lambda','L=0.2\lambda','L=0.3\lambda','L=0.4\lambda','L=0.5\lambda','L=0.6\lambda','L=0.7\lambda','L=0.8\lambda','L=0.9\lambda','L=1\lambda')   
legend('L=0.1\lambda','L=0.3\lambda','L=0.5\lambda','L=0.7\lambda','L=0.9\lambda','L=1.1\lambda','L=1.3\lambda','L=1.5\lambda')     
       
end
 



