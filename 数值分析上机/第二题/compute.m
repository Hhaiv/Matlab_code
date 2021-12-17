clear;clc;

eps = 1e-6;
format long;
%定积分1：0到2pi上对xsin(x)求定积分
a1 = 0;
b1 = 2*pi;
f1 = @(x)x.*sin(x);
y1 = romberg2(f1,a1,b1,eps)
%定积分2：0到1上对(2/sqrt(pi)).*exp(-x^2)求定积分
a2 = 0;
b2 = 1;
f2 = @(x)(2/sqrt(pi)).*exp(-x^2);
y2 = romberg2(f2,a2,b2,eps)


