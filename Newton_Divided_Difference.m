 A = [ -4 -1 0 2 5 ; 1245 33 5 9 1355 ];
x = 9;
n = size(A, 2);

diff = zeros(n);
diff(:,1) = A(2,:);
for j = 2:n
    for i = j:n
        diff(i, j) = (diff(i, j-1) - diff(i-1, j-1)) / (A(1, i) - A(1, i-j+1));
    end
end


disp('Divided Difference Table:');
disp(diff);

result = diff(1,1);
prod = 1;

for j = 2:n
    prod = prod * (x - A(1,j-1));
    result = result + diff(j,j) * prod;
end

fprintf('Interpolated value at x = %f is %f\n', x, result);
