# С использованием функции gcdx_ реализовать функцию diaphant_solve(a::T,b::T,c::T) where T, которая бы возвращала решение
# дафаетового уравнения ax+by=c, если уравнение разрешимо, и значение nothing - в противном случае
# (если d=ua+vb, и если получилость, что d=1, u, v - есть решение уравнения, в противном случае уранение не разрешимо)

function Diophantine_solve(a, b, c)
    d = gcd(a, b)
    if c % d != 0
        return nothing
    end
    
    a_d, x0, y0 = extended_gcd(a, b)
    x = x0 * (c ÷ d)
    y = y0 * (c ÷ d)
    
    return x, y
end

print(Diophantine_solve(10,14,5))