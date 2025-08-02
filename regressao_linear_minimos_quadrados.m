function regressao_linear_minimos_quadrados(x, y)

    %Verificando se os vetores têm o mesmo tamanho
    if length(x) ~= length(y)
        error('Os vetores x e y devem ter o mesmo tamanho.');
    end

    n = length(x);

    %Somatórios
    Sx = sum(x);
    Sy = sum(y);
    Sx2 = sum(x.^2);
    Sxy = sum(x .* y);

    % Coeficientes da reta
    a1 = (n * Sxy - Sx * Sy) / (n * Sx2 - Sx^2);
    a2 = (Sy / n) - a1 * (Sx / n);

    %Ajuste
    y_ajuste = a1 * x + a2;

    %Média de y
    y_medio = mean(y);

    %Soma dos quadrados
    St = sum((y - y_medio).^2);
    Sr = sum((y - y_ajuste).^2);

    %Desvio padrão
    Sy = sqrt(St / (n - 1));
    
    %Erro padrão da estimativa
    Syx = sqrt(Sr / (n - 2));

    %Coeficiente de determinação
    r2 = (St - Sr) / St;

    
    fprintf('--- Resultados da Regressão Linear ---\n');
    fprintf('Coeficiente de inclinação (a1): %.4f\n', a1);
    fprintf('Coeficiente de interseção (a2): %.4f\n', a2);
    fprintf('Desvio padrão total (Sy): %.4f\n', Sy);
    fprintf('Erro-padrão da estimativa (Syx): %.4f\n', Syx);
    fprintf('Coeficiente de determinação (r²): %.4f\n', r2);
    fprintf('--------------------------------------\n');

    %Gráfico dos pontos e da reta de ajuste
    figure;
    plot(x, y, 'bo', 'MarkerFaceColor', 'b');
    hold on;
    plot(x, y_ajuste, 'r-', 'LineWidth', 2);
    grid on;
    xlabel('x');
    ylabel('y');
    title('Regressão Linear - Mínimos Quadrados');
    legend('Dados reais', 'Reta ajustada', 'Location', 'best');
    hold off;
end