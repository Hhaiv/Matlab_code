clear;clc;

eps = 1e-6;
format long;
%������1��0��2pi�϶�xsin(x)�󶨻���
a1 = 0;
b1 = 2*pi;
f1 = @(x)x.*sin(x);
y1 = romberg2(f1,a1,b1,eps)
%������2��0��1�϶�(2/sqrt(pi)).*exp(-x^2)�󶨻���
a2 = 0;
b2 = 1;
f2 = @(x)(2/sqrt(pi)).*exp(-x^2);
y2 = romberg2(f2,a2,b2,eps)


