// Exp - 1.1 : Amplitude Modulation
clc;
closeall;
clearall;

n=1000;
fm=300;
fc=2000;
fs=20050;
am=5;
ac=10;

ts=1/fs;
t=[0:ts:n*ts-ts];
m=am/ac;
f=[-fs/2:fs/n:fs/2-fs/n];

wc=2*pi*fc*t;
ec=ac*sin(wc);
wm=2*pi*fm*t;
em=am*sin(wm);
eq=(1+m.*wm).*(wc);
deq=amdemod(eq,fc,fs,0,ac);

figure(1)
subplot(4,1,1);
plot(t,em);

subplot(4,1,2);
plot(t,ec);

subplot(4,1,3);
plot(t,eq);

subplot(4,1,4);
plot(t,deq);

y=fft(eq);
figure(2)
stem(f,fftshift(abs(y)));