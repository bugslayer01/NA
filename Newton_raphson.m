syms z
f = z * log10(z) - 1.2;
df = diff(f, z);
fx = matlabFunction(f);
dfx = matlabFunction(df);
iter = 1;
x0 = 1.5;
max_iter = 100;
Variables = {'Iter', 'x0', 'f(x0)', 'f''(x0)', 'Error'};
HG = [];

while iter <= max_iter
    x1 = x0 - (fx(x0) / dfx(x0));
    err = abs(x1 - x0);
    HG = [HG; iter, x0, fx(x0), dfx(x0), err];
    x0 = x1;
    iter = iter + 1;
end

disp('==============================================')
disp('Output Table with Iteration-wise values:')
Result = array2table(HG);
Result.Properties.VariableNames = Variables;
disp(Result)
fprintf('Converged solution after %d iterations\n', iter - 1);
fprintf('Root is approximately %.6f\n', x0);
