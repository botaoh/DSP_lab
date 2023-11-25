clear;
clc;

wc=0.5*pi;
N=127;
M=200;
n=0:N-1;
x=rand(1,M)-0.5;%产生随机信号序列
h3=fir1(N-1,wc/pi,boxcar(N));%矩形窗
[H3,w3]=freqz(h3);%得到频率响应
y3=filter(h3,1,x);%滤波得到输出信号
[Y3,wy3]=freqz(y3);%得到频率响应

figure;
plot(w3/pi,abs(Y3));
axis([0 1 0 12]);
set(gca,'ytick',0:4:12);
xlabel('\omega/\pi');ylabel('|Y3(k)|');title('输出信号y3(n)的幅度谱');

figure;
subplot(1,2,1);
plot(w3/pi,abs(H3));
xlabel('\omega/\pi');ylabel('|H3(k)|');title('矩形窗得到h3(n)的幅度谱');

subplot(1,2,2);
plot(w3/pi,20*log10(abs(H3)));
xlabel('\omega/\pi');ylabel('20lg(|H3(k)|)');title('h3(n)的幅度谱');