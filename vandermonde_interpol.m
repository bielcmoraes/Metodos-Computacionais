function [coef, p_func] = vandermonde_interpol(x, f)
    %x - vetor com os pontos
    %f - valores da função nos pontos

    n = length(x);

    %Construindo matriz de Vandermonde
    V = zeros(n);
    for i = 1:n
        V(:, i) = x(:).^(n - i);
    end

    %Resolvendo usando Gauss-Jordan com pivoteamento
    [coef, ~] = gauss_jordan_pivoteamento(V, f(:));

    p_func = @(xx) polyval(coef', xx);

    % Plotar resultado
    xx = linspace(min(x), max(x), 200);
    figure;
    plot(xx, p_func(xx), 'b-', 'LineWidth', 2); hold on;
    plot(x, f, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    title('Polinômio Interpolador', 'Interpreter', 'none');
    xlabel('x'); ylabel('f(x)');
    legend('Polinômio Interpolador', 'Pontos Dados', 'Location', 'Best');
    grid on;
end
