// Exp - 1.2 : Frequency Modulation
clc;
closeall;
clearall;

fs=input('ENTER THE SAMPLING FREQUENCY:');
fC=input('ENTER THE CARRIER FREQUENCY:');
f1=input('ENTER THE BASE BAND SIGNAL FREQUENCY:');
beta=input('ENTER THE MODULATION INDEX:');

%SIGNAL GENERATION
t=(0:1/fs:0.2);
x=sin(2*pi*30*t)+2*(2*pi*60*t);
fdev=50;

%MODULATION
y=fmmod(x,fc,fs,fdev);

%DEMODULATION
z=fmdemod(y,fc,fs,fdev);

figure(1)
plot(t,x,'c',t,z,'b--');
xlabel('time')
ylabel('amplitude');
legend('original signal','demodulated signal');

%SIGNAL SPECTRUM
N=1e6;
t=(0:N-1)*(1/fs);
y=cos(2*pi*fc*t+beta*cos(2*pi*f1*t));
z=fftshift(fft(y))/N;
f=(-N/2:N/2-1)*(fs/N);

%PREDICTED SIDEBAND FOR THE POSSIBLE FREQUENCYS ONLY
n=4;
sidamp=(1/2)*besselj(0:n,beta);
sidamp=[fliplr(sidamp(2:end)),sidamp];
sidf=(fc-n*f1):f1:(fc+n*f1);

figure(2)
plot(f,abs(z));
xlim([-2*fc 2*fc]);

figure(3)
plot(f,abs(z),sidf,sidamp,'o');
xlim([fc-f1*10 fc+f1*10]);


















