function [x,n]=newton(x0,fun,fun1,error) %fun��ԭ������fun1�ǵ�������error��������x0�ǵ�����ʼ��
x=x0;
y=f(fun,x);
n=1;	        %��ǵ����˶��ٴ�
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


