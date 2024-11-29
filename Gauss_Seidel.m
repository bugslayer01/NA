A = [3, -0.1, -0.2; 0.1, 7, -0.3; 0.3, -0.2, 10];
b = [7.85; -19.5; 71.4];
tol = 1e-6; % Tolerance for convergence
maxIter = 10; % Maximum number of iterations

disp('Coefficient Matrix A:');
disp(A);

disp('Right-hand side vector b:');
disp(b);

% Initialize parameters
n = size(A, 1); % Number of equations/unknowns
x = zeros(n, 1); % Initial guess (all zeros)
itr = 0; % Iteration counter

while itr < maxIter
    x_old = x; % Preserve the old values
    
    % Perform Gauss-Seidel updates
    for i = 1:n
        sum = 0;
        
        % Compute the summation for all other variables
        for j = 1:n
            if j ~= i
                sum = sum + A(i, j) * x(j);
            end
        end
        
        % Update the value of x(i)
        x(i) = (1 / A(i, i)) * (b(i) - sum);
    end
    
    % Check for convergence using infinity norm
    err = max(abs(x - x_old));
    if err < tol
        fprintf('Converged in %d iterations.\n', itr + 1);
        break;
    end
    
    itr = itr + 1; % Increment iteration counter
end

if itr == maxIter
    disp('Did not converge within the maximum number of iterations.');
end

disp('Solution:');
disp(x);
