function [I, ERP] = trapezio_composto(a, b, f, n, valor_real)
    % a, b: limites de integração
    % f: função a ser integrada
    % n: número de subintervalos
    % valor_real: valor exato da integral

    h = (b - a) / n;
    x = a;
    S = f(x);

    for i = 2:n
        x = x + h;
        S = S + 2 * f(x);
    end

    x = x + h;
    S = S + f(x);

    I = h * S / 2;
    ERP = abs((valor_real - I) / valor_real) * 100;
end