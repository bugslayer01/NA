g = @(x) (x + 1)^(1/3);  % Define the function
x0 = 1;                  % Initial guess
e = 0.001;               % Tolerance for convergence
n = 100;                 % Maximum number of iterations

fprintf('Iteration   x\n');
fprintf('------------------\n');

for i = 1:n
    x1 = g(x0);  % Compute the next value
    fprintf('%3d       %.4f\n', i, x1);  % Display the iteration number and current value
    
    % Check for convergence
    if abs(x1 - x0) < e
        fprintf('Converged to %.4f after %d iterations.\n', x1, i);
        break;
    end
    
    x0 = x1;  % Update the value for the next iteration
end

% If the loop completes without convergence
if abs(x1 - x0) >= e
    fprintf('The method did not converge within %d iterations.\n', n);
end