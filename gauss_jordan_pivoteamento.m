function [x, A_inv] = gauss_jordan_pivoteamento(A, b)
    [n, m] = size(A);
    if n ~= m
        error('A matriz A deve ser quadrada.');
    end

    if length(b) ~= n
        error('Vetor b deve ter o mesmo número de linhas de A.');
    end

    % Matriz aumentada para sistema + identidade
    Ab = [A, b, eye(n)];

    fprintf('Matriz aumentada inicial [A | b | I]:\n');
    disp(Ab);

    for k = 1:n
        %Pivoteamento parcial
        [~, ipr] = max(abs(Ab(k:n, k)));
        ipr = ipr + k - 1;
        if ipr ~= k
            temp = Ab(k, :);
            Ab(k, :) = Ab(ipr, :);
            Ab(ipr, :) = temp;
            fprintf('Troca de linhas %d e %d:\n', k, ipr);
            disp(Ab);
        end

        %Normalização da linha pivô
        Ab(k, :) = Ab(k, :) / Ab(k, k);
        fprintf('Normalização da linha %d:\n', k);
        disp(Ab);

        %Eliminação dos elementos
        for i = 1:n
            if i ~= k
                fator = Ab(i, k);
                Ab(i, :) = Ab(i, :) - fator * Ab(k, :);
            end
        end
        fprintf('Zerando coluna %d (exceto pivô):\n', k);
        disp(Ab);
    end

    %Solução do sistema e matriz inversa
    x = Ab(:, n+1);
    A_inv = Ab(:, n+2:end);

    fprintf('\nSolução do sistema [x1; x2; x3]:\n');
    disp(x);

    fprintf('Matriz inversa A:\n');
    disp(A_inv);

    % -------------------------------
    % Cálculo de normas e condição
    % -------------------------------
    norm1_A = norm(A, 1);
    norm2_A = norm(A, 2);
    norminf_A = norm(A, inf);

    norm1_inv = norm(A_inv, 1);
    norm2_inv = norm(A_inv, 2);
    norminf_inv = norm(A_inv, inf);

    cond1 = norm1_A * norm1_inv;
    cond2 = norm2_A * norm2_inv;
    condinf = norminf_A * norminf_inv;

    fprintf('Normas de A:\n');
    fprintf('Norma 1 = %.6f\n', norm1_A);
    fprintf('Norma 2 = %.6f\n', norm2_A);
    fprintf('Norma ∞ = %.6f\n', norminf_A);

    fprintf('\nNúmeros de condição:\n');
    fprintf('cond1 = %.6f\n', cond1);
    fprintf('cond2 = %.6f\n', cond2);
    fprintf('cond∞ = %.6f\n', condinf);
end