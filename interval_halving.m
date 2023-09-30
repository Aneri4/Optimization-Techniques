% Interval Halving Method (Optimisation Technique)
% Developed by Aneri Bhuptani
% Method based on steps given in Engineering Optimization: Theory & Practice
% by S. S. Rao
% Interval halving method iss used to obtain minimum value of a non-linear
% function

% Fixed inputs
%f = @(x) x*(x-1.5);
%a = 0;
%b = 1;
%n = 10;
%e = 0.001 ;

clear;

% User Based Inputs
f = input('Enter your function in x = ');
a = input('Enter left value of interval = ');
b = input('Enter right value of interval = ');
n = input('Enter no. of iterations (>=3 and odd) = ');
e = input('Enter tolerance'); % very small value

L = b - a; % interval value

while(abs(L)>e) % Convergence Criteria

    %iteration loop
    for i=1:n

        % Division into 4 intervals
        x0 = (a + b) / 2 ;   % Midpoint 
        x1 = (a + x0) / 2 ;
        x2 = (x0 + b) / 2 ;
    
     
        % Conditions for interval deletion
        if f(x2) > f(x0) && f(x0) > f(x1) % Delete Interval (x0,b)
            b = x0;
            x0 = x1;
        elseif f(x2) < f(x0) && f(x0) < f(x1) % Delete Interval (a,x0)
            a = x0;
            x0 = x2;
        elseif f(x1) > f(x0) && f(x2) > f(x0) % Delete Intervals (a,x1) & (x2,b)
            a = x1;
            b = x2;
        end
    
        % Print values after every iteration
        fprintf('the values of function at x0, x1, x2 are %f, %f, %f \n',f(x0),f(x1),f(x2))
        fprintf('range values are %f %f \n\n',a,b)
    end
    L=b-a;
end

% Print final solutions
fprintf('The solution lies between %f & %f \n',a,b); % solution range

xopt = (b+a) / 2; % X Optimum value
fprintf('X Optimum is %f \n', xopt); 

fprintf('Minimum value is %f\n',f(x0)) % Minima

fplot (f,[a b], 'r') % Plotting the solution


