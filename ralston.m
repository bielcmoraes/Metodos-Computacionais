function [x, y] = ralston(a, b, h, y0, f)
    % Método de Ralston (RK2 otimizado) para PVI
    % Entrada:
    %   a, b - intervalo [a,b]
    %   h    - passo
    %   y0   - condição inicial
    %   f    - função f(x,y)
    % Saída:
    %   x, y - vetores de solução

    x = a:h:b;           % cria vetor de x
    n = length(x);       % tamanho de x
    y = zeros(1, n);     % inicializa vetor de y
    y(1) = y0;           % aplica condição inicial

    for i = 1 : n-1
        K1 = f(x(i), y(i));
        K2 = f(x(i) + (3/4)*h, y(i) + (3/4)*K1*h);
        y(i+1) = y(i) + h*( (1/3)*K1 + (2/3)*K2 );
    end
end
