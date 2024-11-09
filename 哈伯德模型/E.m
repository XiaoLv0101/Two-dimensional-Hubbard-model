
clc
clear
d=8000;                   %%设置精度
k=2100;                   %%设置格点数
x=linspace(-2.5,2.5,k);   %%创建x轴(能量网格)
r=zeros(1,k);             %%创建r数组
eta=0.005;                %%无穷小量取值

for n=1:k
    for i=0:d          %%精度
    kx=2*pi*i/d;
    delte=-2*cos(kx);  %%计算delte
    r(n)=r(n)+eta/((x(n)-delte)^2+eta^2)/(pi*d);   %%计算能量密度
    end
    rtot(n)=trapz(x,r);
end
figure;
plot(x,r);
hold on
plot(x,rtot)
grid on
