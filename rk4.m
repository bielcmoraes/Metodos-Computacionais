function [x, y] = rk4(a, b, h, y0, f)
    % Método de Runge-Kutta de 4a ordem para PVI
    x = a:h:b;
    n = length(x);
    y = zeros(1, n);
    y(1) = y0;

    for i = 1 : n-1
        K1 = f(x(i), y(i));
        K2 = f(x(i) + h/2, y(i) + (h/2)*K1);
        K3 = f(x(i) + h/2, y(i) + (h/2)*K2);
        K4 = f(x(i) + h, y(i) + h*K3);
        y(i+1) = y(i) + (h/6)*(K1 + 2*K2 + 2*K3 + K4);
    end
end