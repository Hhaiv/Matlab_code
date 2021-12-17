function [x]=liezhuxiaoyuan(A,B)
if nargin<3,flag=0;                   %判断输入变量的个数。
end
n=length(B);       %求出矩阵b的行数n作为选取主元时各列元素之间比较次数的标准。
for k=1:(n-1)                         %选取主元的过程。                        
    [ap,p]=max(abs(A(k:n,k)));
    p=p+k-1;
    if p>k                            %交换两行的位置。
        A([k p],:)=A([p k],:);
        B([k p],:)=B([p k],:);
    end
    m=A(k+1:n,k)/A(k,k);              %计算乘子m。
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-m*A(k,k+1:n);  %消元。
    B(k+1:n)=B(k+1:n)-m*B(k);
    A(k+1:n,k)=zeros(n-k,1);
    if flag~=0, Ab=[A,B];
    end
end
x=zeros(n,1);
x(n)=B(n)/A(n,n);
for k=n-1:-1:1                       %回代过程。        
    x(k)=(B(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end
