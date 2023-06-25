# 4. СКО

function mean_mass(mass)
    T = eltype(mass)  
    n = 0; s1 = zero(T); s2 = zero(T)
    for a ∈ mass
        n += 1; s1 .+= a; s2 += a*a
    end
    mean = s1 ./ n
    return mean, sqrt(s2/n - mean*mean)
end