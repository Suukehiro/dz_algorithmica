# 1. Тейлор, экспонента

function exp_teylor(n::Int64, x::T) where T
    a0 = one(T)
    res = a0
    for i in 1:n-1
        a0 *= x / (i+1)
        res += a0
    end
    return res

end

println(exp_teylor(20, 0.5))