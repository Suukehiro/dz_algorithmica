arr = Array{Int64}(undef, 12)

l = length(arr)
println(l)
for i in 1:l
    arr[i] = rand(1:5)
end
function summary_is_recursive!(x::Array{Int64}, len)
    if len == 0
        return 0
    end
    return x[len] + summary_is_recursive!(x, len - 1)
end
for i in 1 : l
    println(arr[i], " ")
end

println(summary_is_recursive!(arr, l))