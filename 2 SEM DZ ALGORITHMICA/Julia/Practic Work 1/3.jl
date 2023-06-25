
# 3. С использованием функции gcdx_ реаализовать функцию invmod_(a::T, M::T) where T, которая бы возвращала бы обратное значение инвертируемого элемента (a) кольца вычетов по модулю M, а для необращаемых элементов возвращала бы nothing:

function invmod(a::T, M::T) where T
    a, x, y = extended_gcd(a, M)
    if x == 1
        return nothing
    end
    return rem(x,M)
end

print(invmod(3,9))