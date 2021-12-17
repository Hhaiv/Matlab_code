 %% Rungekutta
clc,clear 
format long;
h = 0.0001;
a= 3;
b = 200;
x = input('请输入待求数序列 x = ');
n = length(x);
y = zeros(a,b);

y(1,1) = 1;
y(2,1) = 1;
y(3,1) = 0;

for i=1:200
    k1 = f(y(1,i),y(2,i),y(3,i));
    k2 = f(y(1,i)+h/2*k1(1),y(2,i)+h/2*k1(2),y(3,i)+h/2*k1(3));
    k3 = f(y(1,i)+h*k2(1)/2,y(2,i)+h/2*k2(2),y(3,i)+h/2*k2(3));
    k4 = f(y(1,i)+h*k3(1),y(2,i)+h*k3(2),y(3,i)+h*k3(3));
    y(:,i+1) = y(:,i)+(h/6).*(k1+2*k2+2*k3+k4)';
end
for j = 1:n
    Y = y(:,x(j)/h+1);
    disp('当x的值为:');
    fprintf('x = %f\n',x(j));
    disp('对应的y值：');
    fprintf('%f\n',Y);
end