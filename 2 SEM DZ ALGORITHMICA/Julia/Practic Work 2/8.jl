# 8. Методом Ньютона найти приближеннное значение какого-либо вещественного корня многочлена, заданного своими коэффициенами:

struct Polynomials{k}
    coeffs::Vector{k}
    Polynomials{k}(coeffs::Vector{k})  where k = new(coeffs)
end

function f_gorner(n::Int, a::T, t) where T
    i = 2
    while (i <= n)
        a[i] = a[i] + a[i-1]*t 
        i = i + 1;
    end
    pop!(a)
    return a
end

p(x) = 6*x^5 - 23*x^4 + 12*x^2 + 86

rp(x) = p(x) / (30*x^4 - 92*x^3 + 24*x)

println(f_newton(x->x+0,1,1))
println(f_gorner(3, [1,2,1], -1))
