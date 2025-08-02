% Função de força de cisalhamento
f = @(x) 5 + 0.24*x.^2;

% Valor real da integral até x = 11 (inserido manualmente)
valor_real = 161.48;

% Intervalos
a = 0;
x_vals = 1:12;

% Inicializa vetores para a tabela
X = x_vals';
Trap = zeros(size(X));
ErroTrap = zeros(size(X));
Simp = NaN(size(X));
ErroSimp = NaN(size(X));

for i = 1:length(x_vals)
    b = x_vals(i);
    n = b - a;  % número de subintervalos com h = 1
    
    % Trapézio Composto
    [Trap(i), ErroTrap(i)] = trapezio_composto(a, b, f, n, valor_real);
    
    % Simpson Composto (aplica se n par)
    if mod(n, 2) == 0
        [Simp(i), ErroSimp(i)] = simpson13_composto(a, b, f, n, valor_real);
    end
end

% Criar tabela com todos os resultados
T = table(X, Trap, ErroTrap, Simp, ErroSimp);

disp('Tabela de resultados com erro percentual (em relação a valor_real = 161.48):');
disp(T);
