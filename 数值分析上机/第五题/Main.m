x0=1.5;
err = 1e-6;
fun = 'sqrt(x)-x.^3+2';
fun1 = '1/(2*x^(1/2)) - 3*x^2';
[x,k] = newton(x0,fun,fun1,err)
