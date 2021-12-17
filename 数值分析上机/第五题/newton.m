function [x,n]=newton(x0,fun,fun1,error) %fun是原函数，fun1是导函数，error是收敛误差，x0是迭代初始点
x=x0;
y=f(fun,x);
n=1;	        %标记迭代了多少次
while abs(y)>error
    d=1;
    x2=x-d*y/f(fun1,x);
    while abs(f(fun,x2))>abs(f(fun,x))
        d=d/2;
        x2=x-d*y/f(fun1,x);
    end
    x=x2;
    y=f(fun,x);
    n=n+1;
end
end


