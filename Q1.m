function [] = Q_1a(f,a,b,n)
    tic;
    h = (b-a)/n;
    % Choosing Equally spaced points b/w a and b with h distance
    x = a:h:b;
    % Calculating functional values at these pts = ai's
    ai = f(x);

    %Initialising array for bi's
    bi = zeros(1,n);

    % Calculating bi's
    for i = 1:n
        bi(i) = (ai(i+1)-ai(i))/h;
    end

    toc;

    % Plotting
    figure;
    hold on;

    % Choose Dense pts(say 10000)
    x_test = linspace(a,b,10000);
    func_value = f(x_test);

    y_approx = zeros(size(x_test));

    for j = 1:length(x_test)
        i = floor((x_test(j)-a)/h)+1;
        if(i>n)
            i=n;
        end
        % PieceWise Linear Formula
        y_approx(j) = ai(i)+bi(i)*(x_test(j)-x(i));
    end
  
    %Plot Comparison
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
    title('PointWise Error of Linear Piecewise Approximation |f(x)-S(x)|');
    grid on;


   % Relative Error
   rel_error = error./max(abs(func_value),1e-12)*100;

   % Calculate the mean of the relative error for reporting
    mean_rel_error = mean(rel_error);
    disp(['Mean Relative Error = ', num2str(mean_rel_error)]);

   figure;
   plot(x_test,rel_error,'k','LineWidth',2);
   xlabel('x');
   ylabel('Relative Error');
   title('Relative error of Linear Piecewise Approximation');
   grid on; 
    
  