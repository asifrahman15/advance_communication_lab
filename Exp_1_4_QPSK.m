// Exp - 1.4 :  Quadrature Phase Shift Keying Modulation
clc;
closeall;
clearall;

%GENERATE THE CARRIER SIGNAL
tb=1;
t=0:tb/100:tb;
fc=2;
c=10*sqrt(2/tb)*sin(2*pi*fc*t);

%GENERATE MESSAGE SIGNAL
n=8;
m=rand(1,n);
t1=0;
t2=tb;

for i=1:n
    t=[t1:0.01:t2];
if m(i)>0.5
m(i)=1;
m_s=-1*ones(1,length(t));
else
m(i)=0;
m_s=-1*ones(1,length(t));
end
end
message(i,:)=m_s;

%PRODUCT OF CARRIER AND MESSAGE SIGNAL
bpsk_sig(i,:)=c.*m_s;

%PLOT THE METHOD AND BPSK MODULATED SIGNAL
subplot(5,1,1);
stem(m);
xlabel('N');
ylabel('B(N)');
title('BINARY DATABITS');
gridon;
holdon;

subplot(5,1,2);
axis([0 n-2 2]);
plot(t,message(i,:),'r');
xlabel('t-->');
ylabel('m(t)');
title('MESSAGE SIGNAL(POLAR FORM)');
gridon;
holdon;

subplot(5,1,3);
axis([0 n-2 2]);
plot(t,c);
xlabel('n-->');
ylabel('c(t)');
title('CARRIER SIGNAL');
gridon;
holdon;

subplot(5,1,4);
plot(t,bpsk_sig(i,:),'y');
xlabel('t-->');
ylabel('s(t)');
title('BPSK SIGNAL');
gridon;
holdon;

fs=1000;
figure(2);
  h=spectrum.welch;
hpsd=psd(h,bpsk_sig(i,:),'fs',fs);
plot(hpsd);
xlabel('FREQUENCY,f(hz)');
ylabel('bpsk_sig,db/hz');
title('POWER SPECTRAL DENSITY USING WELCH METHOD');

figure(3);
  y=psd(bpsk_sig(i,:));
plot(y);
xlabel('FREQUENCY,f(hz)');
ylabel('bpsk_sig,watts/hz');
title('POWER SPECTRAL DENSITY');































































