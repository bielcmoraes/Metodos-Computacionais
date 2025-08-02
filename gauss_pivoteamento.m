function x = gauss_pivoteamento(A, b)
    [n, m] = size(A);
    if n ~= m
        error('A deve ser quadrada.');
    end
    if length(b) ~= n
        error('b deve ter o mesmo número de linhas de A.');
    end

    Ab = [A, b];
    fprintf('Matriz aumentada inicial [A | b]:\n');
    disp(Ab);

    %Pivoteamento
    for k = 1:n-1
        [maior, I] = max(abs(Ab(k:n, k)));
        ipr = I + k - 1;

        if ipr ~= k
            Aux = Ab(k, :);
            Ab(k, :) = Ab(ipr, :);
            Ab(ipr, :) = Aux;

            fprintf('Troca das linhas %d e %d:\n', k, ipr);
            disp(Ab);
        end

        %Eliminação de Gaus
        for i = k+1:n
            fator = Ab(i,k) / Ab(k,k);
            for j = k:n+1
                Ab(i,j) = Ab(i,j) - fator * Ab(k,j);
            end
        end

        fprintf('Matriz após eliminação na coluna %d:\n', k);
        disp(Ab);
    end

    %Resolucao do sistema
    x = zeros(n,1);
    for i = n:-1:1
        soma = Ab(i, i+1:n) * x(i+1:n);
        x(i) = (Ab(i,end) - soma) / Ab(i,i);
    end

    fprintf('Solução do sistema:\n');
    disp(x);
end
