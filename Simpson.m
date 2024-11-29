f = @(x) sqrt(x^3 + 1);
a = 0;
b = 2;
n = 6;
h = (b - a) / n;
sum1 = 0;
sum2=0;
for i = 1:n-1
    if mod(i,2)==0
        sum1 = sum1 + f(a + i * h); 
    else
        sum2=sum2+f(a+i*h);
    end
end
result = (h / 3) * (f(a) + (2 * sum1) +(4*sum2) + f(b));
fprintf('The approximate value of the integral is %.6f\n', result);