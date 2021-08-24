% Exp - 2.2 : High Pass Filter
clc;
f=0:100:5000;
fc=2000;
rk=600;
l=rk/(4*pi*fc);
c=1/(4*pi*rk*fc);
a=2*acosh(fc./f);
b=2*asin(fc./f);
plot(f,a,'*-r',f,b,'+-b');
xlabel('Frequency');
ylabel('Attenuation and Phase constant');
title('CONSTANT K HIGH PASS FILTER');
legend('Attenuation', 'Phase constant');
disp('Inductance : ')
l
disp('Capacitance : ')
c