%f = @(x) x*(x-1.5);
%a = 0;
%b = 1;
%n = 10;
%e = 0.001 ;

f = input('Enter your function in x = ');
a = input('Enter left value of interval = ');
b = input('Enter right value of interval = ');
n = input('Enter no. of iterations = ');
e = input('Enter tolerance');

if f(a)*f(b)<0
    for i=1:n
        c=(a+b)/2;
        fprintf('P%d = %.4f\n',i,c)
        if abs(c-b)<e || abs(c-a)<e
            break
        end
        if f(a)*f(c)<0
            b=c;
        elseif f(b)*f(c)<0
            a=c;
        end
    end
else 
    disp('No root between given range')
end
