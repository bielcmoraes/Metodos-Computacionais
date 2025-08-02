function yint = newton_interpol(x, y, xx)
    %x  - Pontos conhecidos
    %y  - Valor da função nos pontos
    %xx - ponto onde se deseja interpolar
    %yint - valor interpolado

    n = length(x);
    b = zeros(n, n);
    b(:,1) = y(:);

    %Calculando as diferenças divididas
    for j = 2:n
        for i = 1:n-j+1
            b(i,j) = (b(i+1,j-1) - b(i,j-1)) / (x(i+j-1) - x(i));
        end
    end

    %Interpolando
    xt = 1;
    yint = b(1,1);
    for j = 1:n-1
        xt = xt * (xx - x(j));
        yint = yint + b(1,j+1) * xt;
    end
end
