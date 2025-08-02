function x = gauss_ingenua(A, b)
    [n, m] = size(A);
    if n ~= m
        error('A matriz A deve ser quadrada.');
    end
    if length(b) ~= n
        error('O vetor b deve ter o mesmo número de linhas que A.');
    end

    A_b = [A, b];

    fprintf('Matriz aumentada inicial [A | b]:\n');
    disp(A_b);

    for k = 1:n-1
        for i = k+1:n
            fator = A_b(i,k) / A_b(k,k);
            for j = k:n+1
                A_b(i,j) = A_b(i,j) - fator * A_b(k,j);
            end
        end

        fprintf('\nMatriz após eliminação na coluna %d (fator: %f):\n', k, fator);
        disp(A_b);
    end

    %Resolucao do sistema
    x = zeros(n,1);
    for i = n:-1:1
        soma = 0;
        for j = i+1:n
            soma = soma + A_b(i,j) * x(j);
        end
        x(i) = (A_b(i,end) - soma) / A_b(i,i);
    end

    fprintf('\nSolução do sistema:\n');
    disp(x);
end