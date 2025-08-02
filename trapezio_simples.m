function [I, ERP] = trapezio_simples(a, b, f, valor_real)
    % a, b: limites de integração
    % f: função a ser integrada
    % valor_real: valor exato da integral (para cálculo de erro)
    
    h = b - a;
    I = h * (f(a) + f(b)) / 2;
    ERP = abs((valor_real - I) / valor_real) * 100;
end