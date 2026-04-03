format long
clc;
clear all;
tic;
%% Test Function
%% Since we need to evaluate function at various points
%% we use vectorisation (element wise operations)

f = @(x) 1./(1+x.^2);
%% Defining the Interval
a = -5;
b = 5;
tol = 0.000005;
%% Number of subintervals
n = 2237;
h = (b-a)/n; %% Step size
%% Choosing uniformly spaces n+1 pts in interval [a,b]
x = a:h:b;
%% Calculate functional values at these points = ai's
ai = f(x);
%% Initializing array for bi's
bi = zeros(1,n);
%% Calculating bi's
for i = 1:n
    bi(i) = (ai(i+1)-ai(i))/h;
end
toc;

%% Plotting
figure;
hold on;
x_test = linspace(a,b,10000);
func_value = f(x_test);
%% Approx values
approx_value = zeros(size(x_test));
for j = 1:length(x_test)
    i = floor((x_test(j)-a)/h)+1;
    if i>n
        i=n;
    end
    % Piecewise linear formula
    approx_value(j) = ai(i)+bi(i)*(x_test(j)-x(i));
end
%% Plot comparisons
%plot(x_test,func_value,'b','LineWidth',2);
plot(x_test,approx_value,'r--','LineWidth',2);
legend('Actual f(x)','Piecewise Linear Approx');
title('Piecewise Linear Interpolation');
xlabel('x');
ylabel('y');
grid on;
%% Error
max_error = max(abs(func_value-approx_value));
disp(['Maximum Error = ',num2str(max_error)]);