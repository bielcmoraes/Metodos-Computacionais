function [L, U, x] = decomposicao_LU(A, b)
    n = size(A, 1);
    L = eye(n);
    U = A;
    
    fprintf('Matriz de coeficientes A:\n');
    disp(A);
    
    fprintf('Vetor b:\n');
    disp(b);
    %Decomposição LU
    for j = 1:n-1
        for i = j+1:n
            fator = U(i,j) / U(j,j);
            U(i,:) = U(i,:) - fator * U(j,:);
            L(i,j) = fator;
        end
    end

    fprintf('Matriz L:\n');
    disp(L);
    fprintf('Matriz U:\n');
    disp(U);

    %Resolvendo Ly = b
    y = zeros(n,1);
    for i = 1:n
        y(i) = b(i) - L(i,1:i-1) * y(1:i-1);
    end
    fprintf('Vetor intermediário y (Ly = b):\n');
    disp(y);

    %Resolvendo Ux = y
    x = zeros(n,1);
    for i = n:-1:1
        x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
    end
    fprintf('Solução final x (Ux = y):\n');
    disp(x);

    %Normas
    norma_1 = norm(A, 1);    
    norma_2 = norm(A, 2);
    norma_inf = norm(A, inf);

    fprintf('Norma 1 da matriz A: %.6f\n', norma_1);
    fprintf('Norma 2 da matriz A: %.6f\n', norma_2);
    fprintf('Norma infinito da matriz A: %.6f\n', norma_inf);

    %Números de condição
    cond_1 = cond(A, 1);
    cond_2 = cond(A, 2);
    cond_inf = cond(A, inf);

    fprintf('Número de condição (norma 1): %.6f\n', cond_1);
    fprintf('Número de condição (norma 2): %.6f\n', cond_2);
    fprintf('Número de condição (norma infinito): %.6f\n', cond_inf);
end