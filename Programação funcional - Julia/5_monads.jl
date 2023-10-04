struct Item
    valor::Float64
    peso::Int64
end

# Definindo uma estrutura (struct) chamada Mochila que contém um campo 'itens' como um array unidimensional (Array{Any,1}).
struct Mochila
    itens::Array{Item,1}
end

# Definindo um construtor para a estrutura Mochila que permite criar uma instância da Mochila com a lista de itens.
of(itens::Array{Item,1}) = Mochila(itens)

# Definindo uma função chamada 'filter' que recebe uma instância de Mochila (m) e um valor 'w'.
function filter(m::Mochila, w)
    # Classificando os itens na mochila com base na razão valor/peso em ordem decrescente.
    items = sort(m.itens, lt = (a, b) -> a.valor / a.peso >= b.valor / b.peso);
    return of(
        # Mapeando cada item na mochila atualizando o peso 'w' conforme necessário.
        map(
            curr ->
                if w - curr.peso >= 0
                    w = w - curr.peso
                    return Item(curr.valor, curr.peso)
                else
                    w2 = w
                    w = 0
                    return Item((curr.valor / curr.peso) * w2, w2)
                end,
            items)
    )
end

# Definindo uma função chamada 'reduce' que recebe uma instância de Mochila (m) e retorna a soma dos valores dos itens.
function reduce(m::Mochila)
    return sum(item.valor for item in m.itens)
end

# Criando três instâncias de Mochila (m1, m2, m3) com diferentes conjuntos de itens.
m1 = of([
    Item(7, 6),
    Item(6, 6),
    Item(5, 5),
    Item(8, 6)
])

m2 = of([
    Item(7, 6),
    Item(6, 6)
])

# Chamando a função 'filter' com m1 e o valor 10 para criar m3 e, em seguida, chamando a função 'reduce' para calcular a soma dos valores em m3.
m3 = filter(m1, 10)
println(reduce(m3))