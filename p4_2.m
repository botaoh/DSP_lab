clear;
clc;

N=200;
n=0:N-1;
x=rand(1,N)-0.5;%产生随机信号序列
[X,w]=freqz(x);%得到频率响应X

figure;
subplot(2,1,1);
stem(n,x,'filled');
xlabel('n');ylabel('x(n)');title('随机序列x(n)的时域');

subplot(2,1,2);
stem(w/pi,abs(X),'filled');
xlabel('\omega/\pi');ylabel('|X(k)|');title('随机序列x(n)的幅度谱');