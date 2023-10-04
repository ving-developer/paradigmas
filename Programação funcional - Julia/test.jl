struct Mochila
    itens::Vector{Dict{Symbol, Any}}
end

function Mochila(itens::Vector{Dict{Symbol, Any}})
    return Mochila(itens)
end

function filter_mochila(m::Mochila, w::Int)
    sorted_itens = sort(m.itens, by = x -> x[:valor] / x[:peso], rev=true)
    new_itens = []

    for curr in sorted_itens
        if w - curr[:peso] >= 0
            push!(new_itens, curr)
            w -= curr[:peso]
        else
            push!(new_itens, Dict(:valor => (curr[:valor] / curr[:peso]) * w, :peso => w))
            w = 0
        end
    end

    filtered_itens = filter(item -> item[:peso] > 0, new_itens)  # using built-in filter
    return Mochila(filtered_itens)
end

function reduce(m::Mochila)
    return sum(item[:valor] for item in m.itens)
end

m1 = Mochila([
    Dict(:valor => 7, :peso => 6),
    Dict(:valor => 6, :peso => 6),
    Dict(:valor => 5, :peso => 5),
    Dict(:valor => 8, :peso => 6)
])

m2 = Mochila([
    Dict(:valor => 7, :peso => 6),
    Dict(:valor => 6, :peso => 6)
])

m3 = filter_mochila(m1, 10)
println(reduce(m3))