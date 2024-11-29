A = [4,-1,5,3;3,2,-1,4;2,-3,4,1;1,2,3,-2];
b = [1;10;0;5]; 
n = length(b);
M = [A, b];
for i = 1:n-1
    for j = i+1:n
        m = M(j, i) / M(i, i);
        M(j, :) = M(j, :) - m * M(i, :);
    end
end
disp(M);
x = zeros(n, 1);
x(n) = M(n, end) / M(n, n);
for i = n-1:-1:1
    x(i) = (M(i, end) - M(i, i+1:n) * x(i+1:n)) / M(i, i);
end
disp('Solution is:');
disp(x);