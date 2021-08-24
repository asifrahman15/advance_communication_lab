% Exp - 1.3 : Binary Phase Shift Keying Modulation
clc;
close all;

T=1;
m=2;
es=T/2;
fc=6/T;
n=100;
dt=T/(n-1);
t=0:dt:T;
fs=1000;
u0=sqrt(2*es/T)*cos(2*pi*fc*t);
u1=sqrt(2*es*T)*cos(2*pi*fc*t+2*pi/m);

subplot(2,1,1);
plot(t,u0);
xlabel('TIME,t(s)');
ylabel('u0(t)');
title('BPSK CONSTANT ENVELOPE WINDOW');

subplot(2,1,2);
plot(t,u1);
xlabel('TIME,t(s)');
ylabel('u1(t)');

figure(2)
h=spectrum.welch;
hpsd=psd(h,u0,'fs',fs);
plot(hpsd);
xlabel('FREQUENCY,f(hz)');
ylabel('u0(f),db/hz');
title('POWER SPECTRAL DENSITY USING WELCH METHOD');

figure(3)
y=periodogram(u0);
plot(y);
xlabel('FREQUENCY,f(hz)');
ylabel('u0(f),watts/hz');
title('POWER SPECTRAL DENSITY');

t1=t1+1.01;
t2=t2+1.01;
holdoff;

%PLOT THE INPUT BINARY DATA AND CARRIER SIGNAL
subplot(5,1,1);
stem(m);
xlabel('n');
ylabel('b(n)');
title('binary databits');
gridon;

subplot(5,1,3);
plot(t,c);
xlabel('n-->');
ylabel('c(t)');
title('carrier signal');
gridon;