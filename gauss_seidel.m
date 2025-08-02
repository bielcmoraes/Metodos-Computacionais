function [x, k, Erx] = gauss_seidel(A, b, tol, N, x0)
    n = length(b);
    x = x0;
    
    % Teste de convergência: critério de Sassenfeld
    beta = zeros(n, 1);
    for i = 1:n
        soma = 0;
        for j = 1:i-1
            soma = soma + abs(A(i,j)) * beta(j);
        end
        for j = i+1:n
            soma = soma + abs(A(i,j));
        end
        beta(i) = soma / abs(A(i,i));
    end
    if max(beta) >= 1
        error('Matriz não satisfaz o critério de Sassenfeld');
    end

    k = 1;
    Erx = inf;
    while k <= N && Erx > tol
        x_old = x;
        for i = 1:n
            soma1 = A(i, 1:i-1) * x(1:i-1);
            soma2 = A(i, i+1:end) * x_old(i+1:end);
            x(i) = (b(i) - soma1 - soma2) / A(i, i);
        end
        Erx = max(abs((x - x_old) ./ x)) * 100;
        k = k + 1;
    end
end
