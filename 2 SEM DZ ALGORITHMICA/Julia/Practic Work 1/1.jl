# 1. Написать функцию, вычисляющую НОД двух чисел (или многочленов):

function gcd(a,b)
    while b != 0
        a, b = b, a % b 
    end
    return abs(a)
end

print(gcd(14,8))