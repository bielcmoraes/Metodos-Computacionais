function [x, y] = heun(a, b, h, y0, f)
    % Método de Heun (RK2) para PVI
    x = a:h:b;
    n = length(x);
    y = zeros(1, n);
    y(1) = y0;

    for i = 1 : n-1
        K1 = f(x(i), y(i));
        K2 = f(x(i) + h, y(i) + K1 * h);
        y(i+1) = y(i) + (h/2)*(K1 + K2);
    end
end