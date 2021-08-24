// Exp - 2.3 : Band Pass Filter
clc;
f=0:100:5000;
f1=1000;
f2=2000;
rk=600;
l1=rk/(pi*(f2-f1));
l2=(rk*(f2-f1))/(4*pi*f1*f2);
c1=(f2-f1)/(4*pi*rk*f1*f2);
c2=1/(pi*rk*(f2-f1));
a1=2*acosh(f/f2);
a2=2*acosh(f1./f);
a=a1+a2;
b1=2*asin(f/f2);
b2=2*asin(f1./f);
b=b1+b2;
plot(f,a,'*-r',f,b,'+-b');
xlabel('Frequency');
ylabel('Attenuation and Phase constant');
title('CONSTANT K BAND PASS FILTER');
legend('Attenuation', 'Phase constant');
disp('Inductance 1 : ')
l1
disp('Inductance 2 : ')
l2
disp('Capacitance 1 : ')
c1
disp('Capacitance 2 : ')
c2