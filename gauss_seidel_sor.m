function [x, k, Erx] = gauss_seidel_sor(A, b, tol, N, x0, w)
    n = length(b);
    x = x0;
    k = 1;
    Erx = inf;

    while k <= N && Erx > tol
        x_old = x;
        for i = 1:n
            soma1 = A(i, 1:i-1) * x(1:i-1);
            soma2 = A(i, i+1:end) * x_old(i+1:end);
            x_new = (b(i) - soma1 - soma2) / A(i, i);
            x(i) = w * x_new + (1 - w) * x_old(i);
        end
        Erx = max(abs((x - x_old) ./ x)) * 100;
        k = k + 1;
    end
end
