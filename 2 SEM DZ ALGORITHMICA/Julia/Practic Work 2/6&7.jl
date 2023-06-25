# 6. Написать обобщенную функцию, реализующую метод Ньютона приьлиженного решения уравнения вида $f(x)=0$ (описание метода см. ниже):

function f_newton(r::Function, x, epsilon; num_max = 10)
    dx = -r(x)
    k=0
    while abs(dx) > epsilon && k <= num_max
        x += dx
        k += 1
    end
    k > num_max && @warn("Заявленная точность была достигнута")
    return x
end

# 7. Методом Ньютона найти приближеннное решение уравнения $\cos x = x$:

f(x) = cos(x) - x   

r(x) = f(x)/(sin(x)+1)     #r(x) = f(x)/f'(x)

println(f_newton(f,1,1))