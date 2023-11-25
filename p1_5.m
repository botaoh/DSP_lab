clear;
clc;
n=0:9;    %设置自变量区间
xn=sin(2*pi*1.*n*0.1)+0.5*sin(2*pi*3.*n*0.1+0.5*pi);%计算相应的x(n)
k=0:9;    %设置DFT采样长度
X=dftmtx(10)*xn';%DFT变换

figure(1);%画出原序列的实部、虚部、模、相角
subplot(2,2,1);stem(n,real(xn));xlabel('x');ylabel('real(xn)');title('xn的实部');
subplot(2,2,2);stem(n,imag(xn));xlabel('x');ylabel('imag(xn)');title('xn的虚部');
subplot(2,2,3);stem(n,abs(xn));xlabel('x');ylabel('abs(xn)');title('xn的模');
subplot(2,2,4);stem(n,angle(xn));xlabel('x');ylabel('angle(xn)');title('xn的相角');

figure(2);%画出频谱的幅度谱、频谱实部、频谱虚部
subplot(3,1,1);stem(k,abs(X));xlabel('k');ylabel('abs(X)');title('幅度谱');
subplot(3,1,2);stem(k,real(X));xlabel('k');ylabel('real(X)');title('频谱实部');
subplot(3,1,3);stem(k,imag(X));xlabel('k');ylabel('imag(X)');title('频谱虚部');