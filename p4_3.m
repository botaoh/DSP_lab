clear;
clc;

wc=0.5*pi;
N=200;
n=0:N-1;
x=rand(1,N)-0.5;%产生随机信号序列
h1=fir1(N-1,wc/pi,boxcar(N));%矩形窗
y1=filter(h1,1,x);%滤波得到输出信号
[Y1,w1]=freqz(y1);%得到频率响应Y1
h2=fir1(N-1,wc/pi);%默认为汉明窗
y2=filter(h2,1,x);%滤波得到输出信号
[Y2,w2]=freqz(y2);%得到频率响应Y2

figure;
subplot(2,1,1);
plot(w1/pi,abs(Y1));
axis([0 1 0 12]);
set(gca,'ytick',0:4:12);
xlabel('\omega/\pi');ylabel('|Y1(k)|');title('输出信号y1(n)的幅度谱');

subplot(2,1,2);
plot(w2/pi,abs(Y2));
axis([0 1 0 12]);
set(gca,'ytick',0:4:12);
xlabel('\omega/\pi');ylabel('|Y2(k)|');title('输出信号y2(n)的幅度谱');