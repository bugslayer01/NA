A = [4 7 9 13; 18 63 90 182];
[m, n] = size(A);
x = 11;
R = 0;
for j = 1:n
    l = 1;
    for k = 1:n
        if j ~= k
            l = l * (x - A(1, k)) / (A(1, j) - A(1, k));
        end
    end
    R = R + l * A(2, j);
end
fprintf("Interpolated value at x = %f is %f\n", x, R);
