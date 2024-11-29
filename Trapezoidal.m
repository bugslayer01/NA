f = @(x) sqrt(x^3 + 1);
a = 0;
b = 2;
n = 5;
h = (b - a) / n;
sum = 0;
for i = 1:n-1
    x = a + i * h;
    sum = sum + f(x); 
end
result = (h / 2) * (f(a) + 2 * sum + f(b));
fprintf('The approximate value of the integral is %.6f\n', result);