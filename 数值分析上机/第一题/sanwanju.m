function Swj=sanwanju(xi,yi,f1_0,f1_n,x)

n = length(xi);
km = length(x);

%% 步骤2，计算h与f(x+1,x)   
for i=1:n-1
    h(i) = xi(i+1)-xi(i);
    f(i) = (yi(i+1)-yi(i))/h(i);
end

%% 步骤三：计算三个d,lambda,u
d=zeros(n,1); 
d(1) = 6/h(1)*(f(1)-f1_0);
d(n) = 6/h(n-1)*(f1_n-f(n-1));

for j=1:n-2
    u(j) = h(j)/(h(j)+h(j+1));
    lambda(j) = 1-u(j);
end
u = [u 1];
lambda = [1 lambda];
for j=2:n-1
    d(j) = 6/(h(j-1)+h(j))*(f(j)-f(j-1));
end


%% 用追赶法求解M
dn = 2*ones(n,1);
for i=2:n
    u(i-1) = u(i-1)/dn(i-1);
    dn(i) = dn(i)-lambda(i-1)*u(i-1);
    d(i) = d(i)-u(i-1)*d(i-1);
end
m = ones(n,1);
m(n) = d(n)/dn(n);
for i=n-1:-1:1
    m(i) = (d(i)-lambda(i)*m(i+1))/dn(i);
end

%% 计算最后结果
%待求的数
index_i = 1;
for i=n:-1:1
    if x>xi(i)
        index = i;
        break
    end
end
for i=1:km
    for j=1:n-1
        if xi(j) <= x(i) && x(i) <= xi(j+1)
            index(index_i) = j;
            index_i = index_i + 1;
        end
    end
end
for i=1:km
    s(i) = (xi(index(i)+1) - x(i))^3 / 6 /h(index(i)) * m(index(i)) + ...
        (x(i) - xi(index(i)))^3 / 6 / h(index(i)) * m(index(i) + 1)+...
        (yi(index(i)) - m(index(i)) * h(index(i)) ^2 / 6) * (xi(index(i)+1)-x(i))/h(index(i))+...
        (yi(index(i)+1) - m(index(i)+1) * h(index(i)) ^2 / 6) * (x(i)-xi(index(i)))/h(index(i));
end
Swj = s;    
end
        
    



