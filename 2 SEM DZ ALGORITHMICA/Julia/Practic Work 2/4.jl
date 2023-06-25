# 4. Написать функцию, реализующую приближенное решение уравнения вида $f(x)=0$ методом деления отрезка пополам (описание метода см. ниже):

function in_half(f::Function, a, b, epsilon)
    f_a = f(a)
    while (b - a > epsilon)
        t = (a + b)/2
        f_t = f(t)
        if (f_t == 0)
            return t
        elseif (f_t * f_a < 0)
            b = t
        else
            a, f_a = t, f_t
        end
    end
    return (a+b) / 2
end

function f(x)
    return x * x - 3 * x
end

print(in_half(f, -1, 2, 0.01))