function regressao_linear_minimos_quadrados_ajuste_potencia(x, y)
    

    if length(x) ~= length(y)
        error('Vetores x e y devem ter o mesmo comprimento.');
    end

    %Transformação logarítmica
    X = log(x);
    Y = log(y);

    %Regressão linear nos dados
    n = length(X);
    Sx = sum(X);
    Sy = sum(Y);
    Sx2 = sum(X.^2);
    Sxy = sum(X .* Y);

    b1 = (n * Sxy - Sx * Sy) / (n * Sx2 - Sx^2);  % beta
    b0 = (Sy - b1 * Sx) / n;                      % ln(a)

    %Coeficientes originais
    beta = b1;
    a = exp(b0);

    %Predições
    Y_ajuste = b0 + b1 * X;

    %Estatísticas
    Y_medio = mean(Y);
    St = sum((Y - Y_medio).^2);       % Soma total dos quadrados
    Sr = sum((Y - Y_ajuste).^2);      % Soma dos quadrados dos resíduos

    Sy = sqrt(St / (n - 1));          % Desvio padrão total
    Syx = sqrt(Sr / (n - 2));         % Erro padrão da estimativa
    r2 = 1 - Sr / St;                 % Coeficiente de determinação

    % Mostrar resultados
    fprintf('\n--- AJUSTE DE POTÊNCIA ---\n');
    fprintf('Alfa: %.4f\n', a);
    fprintf('Beta: %.4f\n', beta);
    fprintf('Desvio padrão total (Sy): %.4f\n', Sy);
    fprintf('Erro-padrão da estimativa (Syx): %.4f\n', Syx);
    fprintf('Coeficiente de determinação (R²): %.4f\n', r2);
    fprintf('----------------------------\n');

    %Dados para curvas suaves
    x_modelo = linspace(min(x), max(x), 200);
    y_modelo = a * x_modelo.^beta;

    X_modelo = linspace(min(X), max(X), 200);
    Y_modelo = b0 + b1 * X_modelo;

    figure;

    %Dados reais e curva ajustada
    subplot(1,2,1);
    plot(x, y, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Dados reais'); hold on;
    plot(x_modelo, y_modelo, 'r-', 'LineWidth', 2, 'DisplayName', 'Curva ajustada');
    xlabel('x'); ylabel('y');
    title('Domínio Original');
    legend('Location', 'northwest');
    grid on;

    %Dados transformados e reta ajustada
    subplot(1,2,2);
    plot(X, Y, 'ko', 'MarkerFaceColor', 'k', 'DisplayName', 'ln(Dados)'); hold on;
    plot(X_modelo, Y_modelo, 'g-', 'LineWidth', 2, 'DisplayName', 'Reta ajustada');
    xlabel('ln(x)'); ylabel('ln(y)');
    title('Domínio Log-Log');
    legend('Location', 'northwest');
    grid on;
end