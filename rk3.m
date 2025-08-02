function [x, y] = rk3(a, b, h, y0, f)
    % Método de Runge-Kutta de 3a ordem para PVI
    x = a:h:b;
    n = length(x);
    y = zeros(1, n);
    y(1) = y0;

    for i = 1 : n-1
        K1 = f(x(i), y(i));
        K2 = f(x(i) + h/2, y(i) + (h/2)*K1);
        K3 = f(x(i) + h, y(i) - h*K1 + 2*h*K2);
        y(i+1) = y(i) + (h/6)*(K1 + 4*K2 + K3);
    end
end