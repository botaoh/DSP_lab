clc;
clear;
T=0.005;%抽样间隔T
length=32; %抽样个数N
n=0:length-1;
t=0:0.0001:31;

%原序列和频谱
xn=sin(2*pi*50*n*T);
xt=sin(2*pi*50*t);

X=fft(xn,length);%计算DFT

%图一（原序列和频谱）
figure(1);
subplot(2,1,1);
plot(t,xt);
xlabel('t');ylabel('xt');title('原序列时域');
axis([0,0.16,-1.1,1.1]);

subplot(2,1,2);
stem(n,xn);
xlabel('n');ylabel('xn');title('采样得到的序列时域');
axis([0,length,-1.1,1.1]);

%图二（采样序列的实部、虚部、模、相角）
figure(2);
subplot(2,2,1);
stem(n,real(xn));
xlabel('n');ylabel('real(xn)');title('采样序列实部');
axis([0,length,-1.1,1.1]);

subplot(2,2,2);
stem(n,imag(xn));
xlabel('n');ylabel('imag(xn)');title('采样序列虚部');
axis([0,length,-1.1,1.1]);

subplot(2,2,3);
stem(n,abs(xn));
xlabel('n');ylabel('abs(xn)');title('采样序列的模');
axis([0,length,-1.1,1.1]);

subplot(2,2,4);
stem(n,angle(xn));
xlabel('n');ylabel('angle(xn)');title('采样序列的相角');
axis([0,length,-(pi+0.5),pi+0.5]);

%图三（DFT的幅度、实部和虚部）
figure(3);
subplot(3,1,1);
plot(abs(X), 'linewidth', 1.5);
xlabel('Hz');ylabel('abs(X)');title('幅度谱');

subplot(3,1,2);
stem(n,real(X));
xlabel('k');ylabel('real(X)');title('DFT实部');

subplot(3,1,3);
stem(n,imag(X));
xlabel('k');ylabel('imag(X)');title('DFT虚部');