function [] = Q_2a(f,a,b,n)
    if mod(n,2) ~=0, n = n+1; end
    
    tic;
    h = (b-a)/n;
    x = a:h:b;
    y = f(x);

    x_test = linspace(a,b,10000);
    y_actual = f(x_test);
    y_approx = zeros(size(x_test));
    
    
    for j = 1: length(x_test)
        idx = floor((x_test(j)-a)/(2*h));
        i = 2*idx+1;
        if i>n-1
            i = n-1;
        end
        x0 = x(i); y0 = y(i);
        x1 = x(i+1); y1 = y(i+1);
        x2 = x(i+2);y2 = y(i+2);

        % Lagrange Basis Polynomials
        L0 = ((x_test(j)-x1)*(x_test(j)-x2)) / ((x0-x1)*(x0-x2));
        L1 = ((x_test(j)-x0)*(x_test(j)-x2))/((x1-x0)*(x1-x2));
        L2 = ((x_test(j)-x0)*(x_test(j)-x1)) / ((x2-x0)*(x2-x1));


        y_approx(j) = y0*L0+y1*L1+y2*L2;
    end
    t = toc;

    % Plotting
    figure;
    
    plot(x_test, y_actual, 'b', 'LineWidth', 2); hold on;
    plot(x_test, y_approx, 'r--', 'LineWidth', 1.5);
    legend('Actual f(x)', 'Quadratic Approx');
    title(['Piecewise Quadratic Approximation (n = ', num2str(n), ', Time = ', num2str(t, '%.5f'), 's)']);
    grid on;
    
    % Error Plot
    figure;
    error_vals = abs(y_actual - y_approx);
    plot(x_test,error_vals,'k','LineWidth',1.5);
    ylabel('Absolute Error');
    title(['Max Error = ',num2str(max(error_vals))]);
    grid on;
    
    fprintf('Computation Time: %.6f seconds\n',t);
    fprintf('Maximum Error: %.2e\n',max(error_vals));
end

