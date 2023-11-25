clc;
clear;
x=[3,2,0,0,1,0,5,8,0,8,0,0,0,0,0,0];
xx=[3,2,0,0,1,0,5,8,0,8];
xxx=[3,2,0,0,1,0,5,8,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
X0=fft(x);
XX=fft(xx);
XXX=fft(xxx);
X=fft_4(x);
n=1:1:16;
n0=1:1:10;
n1=1:1:64

figure(1)
stem(n,x,'filled');
title('输入序列');
axis([0 17 0 10]);

figure(2)
stem(n,X0,'filled');
title('16点DFT输出序列');
axis([0 17 -15 30]);

figure(3)
stem(n0,XX,'filled');
title('10点DFT输出序列');
axis([0 17 -15 30]);

figure(4)
stem(n,X,'filled');
title('16点基4-FFT输出序列');
axis([0 17 -15 30]);

figure(5)
stem(n1,XXX,'filled');
title('64点DFT输出序列');
axis([0 65 -15 30]);

function [X]=fft_4(x)
X=zeros(1,16);
N=16;                   
W=exp(-1j*2*pi/N);              
W4=dftmtx(4);%DFT矩阵

%调整序列位置
x0=[x(1);x(5);x(9);x(13)];
x1=[x(2);x(6);x(10);x(14)];
x2=[x(3);x(7);x(11);x(15)];
x3=[x(4);x(8);x(12);x(16)];
 
X0=W4*x0;%第一级蝶形运算
X1=W4*x1;
X2=W4*x2;
X3=W4*x3;

for k=0:3%第二级蝶形运算
    a=W4*[X0(k+1);(W^k)*X1(k+1);(W^(2*k))*X2(k+1);(W^(3*k))*X3(k+1)];
    X(k+1)=a(1);
    X(k+5)=a(2);
    X(k+9)=a(3);
    X(k+13)=a(4);
end
end