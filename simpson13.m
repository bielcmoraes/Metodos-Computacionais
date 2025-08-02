function [I, ERP] = simpson13(a, b, f, valor_real)
    h = (b - a) / 2;
    x1 = a;
    x2 = a + h;
    x3 = b;
    
    I = h * (f(x1) + 4*f(x2) + f(x3)) / 3;
    ERP = abs((valor_real - I) / valor_real) * 100;
end