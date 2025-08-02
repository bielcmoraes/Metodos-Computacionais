function [I, ERP] = simpson38(a, b, f, valor_real)
    h = (b - a) / 3;
    x1 = a;
    x2 = a + h;
    x3 = a + 2*h;
    x4 = b;
    
    I = 3 * h * (f(x1) + 3*f(x2) + 3*f(x3) + f(x4)) / 8;
    ERP = abs((valor_real - I) / valor_real) * 100;
end