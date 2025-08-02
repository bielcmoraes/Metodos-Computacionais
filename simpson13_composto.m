function [I, ERP] = simpson13_composto(a, b, f, n, valor_real)
    if mod(n, 2) ~= 0
        error('n deve ser par para a regra de Simpson 1/3 composta');
    end

    h = (b - a) / n;
    Soma = 0;

    for i = 0:n
        xi = a + i * h;
        if i == 0 || i == n
            Soma = Soma + f(xi);
        elseif mod(i, 2) == 0
            Soma = Soma + 2 * f(xi);
        else
            Soma = Soma + 4 * f(xi);
        end
    end

    I = h * Soma / 3;
    ERP = abs((valor_real - I) / valor_real) * 100;
end