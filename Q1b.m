format long;
clc;
clear all;
%% Test function
tic;
f = @(x) sqrt(x);
%% Define in interval
n = 791;
a = 0;
b = 1;
tol = 0.00005;
h = (b-a)/n;
%% Function points
x = a:h:b;
ai = f(x);
%% Calculating bis
bi = zeros(1,n);
for i = 1:n
    bi(i) = (ai(i+1)-ai(i))/h;
end
toc;
%% Calculating linear approximation
figure;
hold on
x_fine = linspace(a,b,1000);
func_value = sqrt(x_fine);
y_approx = zeros(size(x_fine));

for j =1:length(x_fine)
    i = floor((x_fine(j)-a)/h)+1;
    if i>n 
        i=n
    end
    y_approx(j) = ai(i)+bi(i)*(x_fine(j)-x(i));
end
%% Wait
plot(x_fine,y_approx,'b','LineWidth',2);
hold on;
plot(x_fine,func_value,'r--','LineWidth',1.5);
xlabel('x');
ylabel('y');
legend('Exact f(x)','PiecewiseLinearApprox')
title('Piecewise Linear Interpolation')
grid on;
max_error = max(abs(func_value - y_approx));
disp(['Maximum Error = ',num2str(max_error)]);
%% Error Plot 
% |Error(x)| = |f(x)-S(x)|
abs_error = abs(func_value-y_approx);
figure;
plot(x_fine,abs_error,'m','LineWidth',1);
hold on;
title('Absolute Error |f(x) - S(x)|');
xlabel('x');
ylabel('Error');
grid on;

