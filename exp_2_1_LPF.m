// Exp - 2.1 : Low Pass Filter
clc;
f=0:100:5000;
fc=2000;
rk=600;
l=rk/(pi*fc);
c=1/(pi*rk*fc);
a=2*acosh(f/fc);
b=2*asin(f/fc);
plot(f,a,'*-r',f,b,'+-b');
xlabel('Frequency');
ylabel('Attenuation and Phase constant');
title('CONSTANT K LOW PASS FILTER');
legend('Attenuation', 'Phase constant');
disp('Inductance : ')
l
disp('Capacitance : ')
c