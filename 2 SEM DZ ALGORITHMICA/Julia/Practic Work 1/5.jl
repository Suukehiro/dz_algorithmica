# Для вычислений в кольце вычетов по модулю M определить специальный тип
# ```julia
# struct Rsidue{T,M}
#     a::T
#     Residue{T,M}(a)where{T,M} = new(mod(a, M))
# end

# и определить для этого типа следующие операци и функции:
# +, -, унарный минус, *, ^, inverse (обращает обратимые элементы), display (определяет, в каком виде значение будет выводиться в REPL)

struct ModuloRingElement{T<:Integer}
    value::T
    modulus::T
    
    function ModuloRingElement(value::T, modulus::T) where {T<:Integer}
        return new(value % modulus, modulus)
    end
end

import Base: +, -, *, ^, inv, -, show

+(a::ModuloRingElement, b::ModuloRingElement) = ModuloRingElement(a.value + b.value, a.modulus)

-(a::ModuloRingElement, b::ModuloRingElement) = ModuloRingElement(a.value - b.value, a.modulus)

-(a::ModuloRingElement) = ModuloRingElement(-a.value, a.modulus)

*(a::ModuloRingElement, b::ModuloRingElement) = ModuloRingElement(a.value * b.value, a.modulus)

inv(a::ModuloRingElement) = ModuloRingElement(invmod(a.value, a.modulus), a.modulus)

show(io::IO, a::ModuloRingElement) = print(io, "$(a.value) mod $(a.modulus)")