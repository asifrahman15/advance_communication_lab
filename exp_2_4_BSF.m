% Exp - 2.4 : Band Stop Filter
clc;
f=0:100:5000;
f1=1000;
f2=2000;
rk=600;
l1=(rk*(f2-f1))/(pi*f1*f2);
l2=rk/(4*pi*(f2-f1));
c1=1/(4*pi*rk*(f2-f1));
c2=(f2-f1)/(pi*rk*f1*f2);
a1=2*acosh(f2./f);
a2=2*acosh(f/f1);
a=a1+a2;
b1=2*asin(f2./f);
b2=2*asin(f/f1);
b=b1+b2;
plot(f,a,'*-r',f,b,'+-b');
xlabel('Frequency');
ylabel('Attenuation and Phase constant');
title('CONSTANT K BAND STOP FILTER');
legend('Attenuation', 'Phase constant');
disp('Inductance 1 : ')
l1
disp('Inductance 2 : ')
l2
disp('Capacitance 1 : ')
c1
disp('Capacitance 2 : ')
c2