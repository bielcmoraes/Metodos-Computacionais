function numero_condicao_qualquer_matriz(A)
    % Verifica se A é numérica e quadrada
    if ~isnumeric(A)
        error('A matriz deve ser numérica.');
    end
    [m, n] = size(A);
    if m ~= n
        error('A matriz deve ser quadrada para calcular a inversa e o número de condição.');
    end

    fprintf('Matriz A:\n');
    disp(A);

    % Verifica se a matriz é invertível
    if det(A) == 0
        error('A matriz não é invertível. Não é possível calcular o número de condição.');
    end

    % Norma infinito de A
    normA_inf = norm(A, inf);
    fprintf('Norma infinito de A: %.4f\n', normA_inf);

    % Inversa de A
    A_inv = inv(A);
    fprintf('Matriz inversa de A:\n');
    disp(A_inv);

    % Norma infinito da inversa
    normAinv_inf = norm(A_inv, inf);
    fprintf('Norma infinito de A^-1: %.4f\n', normAinv_inf);

    % Número de condição
    cond_inf = normA_inf * normAinv_inf;
    fprintf('Número de condição (norma infinito): %.4f\n', cond_inf);
end
