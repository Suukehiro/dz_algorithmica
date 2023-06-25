# 2. На база этой функции написать другую функцию, возвращающую n-ый член последовательности Фибоначчи (сложность - O(log n)):

function FuncFib(n)
    m = [1 1; 1 0]
    m = exponentiation(m,n)
    return m[1,1]
end

print(FuncFib(9))