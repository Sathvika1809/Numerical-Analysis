function [] = Q_1b(f,a,b,n)
    tic;
    h = (b-a)/n;
    x = a:h:b;

    ai = f(x);
    bi = zeros(1,n);

    for i = 1:n
        bi(i) = (ai(i+1)-ai(i))/h;
    end
    toc;
    % Plotting
    figure;
    hold on;
    x_test = linspace(a,b,10000);
    func_value = f(x_test);

    y_approx = zeros(size(x_test));

    for j = 1:length(x_test)
        i = floor((x_test(j)-a)/h)+1;
        if(i>n)
            i=n;
        end
        y_approx(j) = ai(i)+bi(i)*(x_test(j)-x(i));
    end
  
    plot(x_test, func_value, 'b','LineWidth',2);
    plot(x_test,y_approx,'r--','LineWidth',2);

    legend('Actual f(x)', 'Piecewise Linear Approx');
    xlabel('x');
    ylabel('f(x)');
    title('Linear Piecewise Approximation');
    grid on;

    max_error = max(abs(func_value - y_approx));
    disp(['Maximum Error = ',num2str(max_error)]);

    % Calculate the error between the actual function and the approximation
    % error = |f(x)-S(x)|
    error = abs(func_value - y_approx);
    figure;
    plot(x_test, error, 'k','LineWidth',2);
    xlabel('x');
    ylabel('Error');
    title('Error of Linear Piecewise Approximation');
    grid on;
    
     % Neighborhood Plots
    figure;
    plot(x_test,func_value,'r','LineWidth',2);
    hold on;
    xlabel('x');
    ylabel('f(x)')
    plot(x_test,y_approx,'b--','LineWidth',2);
    xlim([0,0.01*h]);
    title(['Neighborhood near start(x = ',num2str(a),')']);
    legend('Exact','PiecewiseLinear');
    
    
    figure;
    plot(x_test,func_value,'r','LineWidth',2);
    hold on;
    plot(x_test,y_approx,'b--','LineWidth',2);
    xlim([1-0.01*h,1]);
    title(['Neighborhood near end(x = ',num2str(b),')']);
    legend('Exact','PiecewiseLinear');
   
end