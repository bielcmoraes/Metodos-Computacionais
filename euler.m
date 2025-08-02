function [x, y] = euler(a, b, h, y0, f)
    % Método de Euler para resolução de PVI
    % Entrada:
    %   a, b - intervalo [a,b]
    %   h    - passo
    %   y0   - condição inicial
    %   f    - função f(x,y)
    % Saída:
    %   x, y - vetores de solução

    x = a:h:b;           % cria vetor de x de a até b com passo h
    n = length(x);       % tamanho de x
    y = zeros(1, n);     % inicializa vetor de y
    y(1) = y0;           % aplica condição inicial

    for i = 1 : n-1
        K1 = f(x(i), y(i));         % calcula f(x,y)
        y(i+1) = y(i) + K1 * h;     % fórmula de Euler
    end
end