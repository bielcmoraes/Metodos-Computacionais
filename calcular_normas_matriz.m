function calcular_normas_matriz(A)
    % Verifica se A é uma matriz numérica
    if ~isnumeric(A)
        error('A matriz fornecida deve ser numérica.');
    end

    fprintf('Matriz original A:\n');
    disp(A);

    % Inicializa matriz normalizada
    A_normalized = zeros(size(A));

    % Normalização linha a linha
    for i = 1:size(A, 1)
        max_abs = max(abs(A(i, :)));
        if max_abs == 0
            warning('Linha %d possui todos os elementos zero. Pulando normalização.', i);
            A_normalized(i, :) = A(i, :);
        else
            A_normalized(i, :) = A(i, :) / max_abs;
            fprintf('Linha %d normalizada (dividida por %.4f):\n', i, max_abs);
            disp(A_normalized(i, :));
        end
    end

    fprintf('\nMatriz normalizada:\n');
    disp(A_normalized);

    % Cálculo das normas
    norma_1 = norm(A_normalized, 1);
    norma_inf = norm(A_normalized, inf);

    % Exibe as normas
    fprintf('Norma 1 (||A||_1): %.4f\n', norma_1);
    fprintf('Norma Infinito (||A||_inf): %.4f\n', norma_inf);
end
