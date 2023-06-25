# Написать функцию, реализующую расширенный алгоритм Евклида, вычисляющий не только НОД, но и коэффициенты его линейного представления:

function extended_gcd(a::T,b::T) where T<:Integer 
    u, v = one(T), zero(T); u1, v1 = 0, 1
    while b != 0      
        r, k = a % b, div(a, b)
        a, b = b, r
        u, v, u1, v1 = u1, v1, u - k * u1, v - k * v1
    end
    if a < 0
        a, u, v = -a, -u, -v
    end
    return a, u, v
end

print(extended_gcd(24,15))
