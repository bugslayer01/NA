% Input data
x = [-2 -1 0 1 2];
y = [15 1 1 3 19];
n = length(x);

% Initialize sums for the normal equation
sum_x = 0;
sum_y = 0;
sum_x2 = 0;
sum_xy = 0;

% Compute sums using loops
for i = 1:n
    sum_x = sum_x + x(i);
    sum_y = sum_y + y(i);
    sum_x2 = sum_x2 + x(i)^2;
    sum_xy = sum_xy + x(i) * y(i);
end

% Construct matrices A and B for normal equations
A = [n, sum_x; sum_x, sum_x2];
B = [sum_y; sum_xy];

disp(A);
disp(B);

% Solve for the coefficients of the best-fit line
x1 = A \ B;
disp(x1);

% Generate the fitted line
f = x1(1) + x1(2) * x;

% Plot the data points and the fitted line
plot(x, y, '*r', 'MarkerSize', 10); % Data points
hold on;
plot(x, f, 'b-', 'LineWidth', 1.5); % Fitted line
title('Least Squares Regression');
xlabel('x');
ylabel('y');
legend('Data points', 'Fitted line');
grid on;
hold off;
