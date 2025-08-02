function yint = lagrange_interpol(x, f, xx)
    %x  - vetor de pontos conhecidos
    %f  - vetor de valores f(x)
    %xx - ponto onde se deseja interpolar
    %yint - valor interpolado

    n = length(x);
    y = 0;

    for i = 1:n
        Prod = f(i);     %termo inicial do polinômio
        for j = 1:n
            if i ~= j
                Prod = Prod * (xx - x(j)) / (x(i) - x(j));
            end
        end
        y = y + Prod;     %somatório dos termos
    end

    yint = y;
end
