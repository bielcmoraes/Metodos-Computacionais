% Dados
a = 0;
b = 0.5;
r0 = 0.5;
n_escoamento = 8;      % Parâmetro da equação do escoamento
vmax = 1.5;
n_sub = 10;            % Número de subintervalos

% Função a ser integrada
f = @(r) r .* (1 - (r / r0).^(1 / n_escoamento));

% Valor real da integral (opcional, para cálculo do erro)
valor_real = integral(f, a, b);
v_real = (2 * vmax / r0^2) * valor_real;

% Chamadas aos métodos implementados
[I_trap_simples, ERP_trap_simples]     = trapezio_simples(a, b, f, valor_real);
[I_trap_composto, ERP_trap_composto]   = trapezio_composto(a, b, f, n_sub, valor_real);
[I_simp13_simples, ERP_simp13_simples] = simpson13(a, b, f, valor_real);
[I_simp13_composto, ERP_simp13_composto] = simpson13_composto(a, b, f, n_sub, valor_real);
[I_simp38_simples, ERP_simp38_simples] = simpson38(a, b, f, valor_real);

% Cálculo das velocidades médias
v_trap_simples    = (2 * vmax / r0^2) * I_trap_simples;
v_trap_composto   = (2 * vmax / r0^2) * I_trap_composto;
v_simp13_simples  = (2 * vmax / r0^2) * I_simp13_simples;
v_simp13_composto = (2 * vmax / r0^2) * I_simp13_composto;
v_simp38_simples  = (2 * vmax / r0^2) * I_simp38_simples;

% Mostra resultados
resultados = {
    'Trapézio simples'        , v_trap_simples    , ERP_trap_simples;
    'Trapézio composto'       , v_trap_composto   , ERP_trap_composto;
    'Simpson 1/3 simples'     , v_simp13_simples  , ERP_simp13_simples;
    'Simpson 1/3 composto'    , v_simp13_composto , ERP_simp13_composto;
    'Simpson 3/8 simples'     , v_simp38_simples  , ERP_simp38_simples;
};

% Converte para tabela MATLAB para visualização organizada
T = cell2table(resultados, ...
    'VariableNames', {'Metodo', 'VelocidadeMedia', 'ErroRelativoPercentual'});

% Exibe a tabela
disp(' ');
disp('Tabela de Resultados:');
disp(T);
