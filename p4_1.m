clear;
clc;

wc=0.5*pi;
N=31;
n=0:N-1;
h1=fir1(N-1,wc/pi,boxcar(N));%矩形窗
[H1,w1]=freqz(h1);
h2=fir1(N-1,wc/pi);%默认为汉明窗
[H2,w2]=freqz(h2);

figure(1);
subplot(1,3,1);
stem(n,h1,'filled');
xlabel('n');ylabel('h1(n)');title('矩形窗得到h1(n)的时域');

subplot(1,3,2);
plot(w1/pi,abs(H1));
xlabel('\omega/\pi');ylabel('|H1(k)|');title('矩形窗得到h1(n)的幅度谱');

subplot(1,3,3)
plot(w1/pi,20*log10(abs(H1)));
xlabel('\omega/\pi');ylabel('20lg(|H1(k)|)');title('h1(n)的幅度谱');

figure(2);
subplot(1,3,1);
stem(n,h2,'filled');
xlabel('n');ylabel('h2(n)');title('汉明窗得到h2(n)的时域');

subplot(1,3,2);
plot(w2/pi,abs(H2));
xlabel('\omega/\pi');ylabel('|H2(k)|');title('汉明窗得到h2(n)的幅度谱');

subplot(1,3,3);
plot(w2/pi,20*log10(abs(H2)));
xlabel('\omega/\pi');ylabel('20lg(|H2(k)|)');title('h2(n)的幅度谱');