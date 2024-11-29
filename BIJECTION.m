f = @(z) z*log10(z)-1.2;
a=2;
b=3;
n=6;
epsilon=5*10^(-n-1);
itermax=70;
c=(a+b)/2;
err=abs(b-a);
iter=1;
Variables={'Iter','a','b','c','f(c)','Error'};
HG = [iter, a, b, c, f(c), err];

if f(a)*f(b)>0
    disp('WRONG');
else
    while (iter<=itermax && err>=epsilon)
        if f(a)*f(c)<0
            b=c;
        else
            a=c;
        end
        c=(a+b)/2;
        err=abs(b-a);
        iter=iter+1;
        HG = [HG; iter, a, b, c, f(c), err];
    end
end

disp('==============================================')
disp('Output Table with Iteration wise')

Result=array2table(HG);
Result.Properties.VariableNames(1:6)=Variables;
disp(Result)
fprintf('Converged solution after %d iterations \n',iter)
fprintf('Root is %.6f \n',c)