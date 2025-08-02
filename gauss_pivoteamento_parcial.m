function x = gauss_pivoteamento_parcial(A, b)
    [n, m] = size(A);
    if n ~= m
        error('A matriz A deve ser quadrada.');
    end
    if length(b) ~= n
        error('O vetor b deve ter o mesmo número de linhas que A.');
    end

    % Concatena A e b para formar a matriz aumentada
    A_b = [A, b];

    fprintf('Matriz aumentada inicial [A | b]:\n');
    disp(A_b);

    % Eliminação com pivoteamento parcial
    for k = 1:n-1
        % Encontra índice do maior valor absoluto na coluna k
        [~, p] = max(abs(A_b(k:n, k)));
        p = p + k - 1; % Ajuste do índice

        % Troca de linhas se necessário
        if p ~= k
            A_b([k p], :) = A_b([p k], :);
            fprintf('\nTroca das linhas %d e %d:\n', k, p);
            disp(A_b);
        end

        % Eliminação
        for i = k+1:n
            fator = A_b(i,k) / A_b(k,k);
            for j = k:n+1
                A_b(i,j) = A_b(i,j) - fator * A_b(k,j);
            end
        end

        fprintf('\nMatriz após eliminação na coluna %d:\n', k);
        disp(A_b);
    end

    % Retrosubstituição
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