n = 3;
T = zeros(n); % matriz de temperatura dos nós internos

% Condições de contorno fixas
T_top = 25;
T_bottom = 75;
T_left = 100;
T_right = 0;

% Sistema linear Ax = b
A = zeros(n^2);
b = zeros(n^2, 1);

for i = 1:n
    for j = 1:n
        idx = (i - 1) * n + j; % índice linear
        A(idx, idx) = 4;

        % vizinho à esquerda
        if j > 1
            A(idx, idx - 1) = -1;
        else
            b(idx) = b(idx) + T_left;
        end

        % vizinho à direita
        if j < n
            A(idx, idx + 1) = -1;
        else
            b(idx) = b(idx) + T_right;
        end

        % vizinho acima
        if i > 1
            A(idx, idx - n) = -1;
        else
            b(idx) = b(idx) + T_top;
        end

        % vizinho abaixo
        if i < n
            A(idx, idx + n) = -1;
        else
            b(idx) = b(idx) + T_bottom;
        end
    end
end