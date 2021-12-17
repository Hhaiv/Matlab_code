function [x]=liezhuxiaoyuan(A,B)
if nargin<3,flag=0;                   %�ж���������ĸ�����
end
n=length(B);       %�������b������n��Ϊѡȡ��Ԫʱ����Ԫ��֮��Ƚϴ����ı�׼��
for k=1:(n-1)                         %ѡȡ��Ԫ�Ĺ��̡�                        
    [ap,p]=max(abs(A(k:n,k)));
    p=p+k-1;
    if p>k                            %�������е�λ�á�
        A([k p],:)=A([p k],:);
        B([k p],:)=B([p k],:);
    end
    m=A(k+1:n,k)/A(k,k);              %�������m��
    A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-m*A(k,k+1:n);  %��Ԫ��
    B(k+1:n)=B(k+1:n)-m*B(k);
    A(k+1:n,k)=zeros(n-k,1);
    if flag~=0, Ab=[A,B];
    end
end
x=zeros(n,1);
x(n)=B(n)/A(n,n);
for k=n-1:-1:1                       %�ش����̡�        
    x(k)=(B(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end
