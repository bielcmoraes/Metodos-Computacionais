function [x, k, Erx] = jacobi(A, b, tol, N, x0)
    n = length(b);
    x = x0;
    C = zeros(n);
    d = zeros(n, 1);

    % Teste de convergência: Diagonal Dominante
    for i = 1:n
        soma = sum(abs(A(i, :))) - abs(A(i, i));
        if abs(A(i, i)) < soma
            error('Matriz não satisfaz critério da diagonal dominante');
        end
    end

    % Montar C e d
    for i = 1:n
        for j = 1:n
            if i ~= j
                C(i, j) = -A(i, j) / A(i, i);
            end
        end
        d(i) = b(i) / A(i, i);
    end

    k = 1;
    Erx = inf;
    while k <= N && Erx > tol
        x_old = x;
        x = C * x_old + d;
        Erx = max(abs((x - x_old) ./ x)) * 100;
        k = k + 1;
    end
end
