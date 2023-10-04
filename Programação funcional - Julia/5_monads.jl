# Definindo uma estrutura (struct) chamada Mochila que contém um campo 'itens' como um array unidimensional (Array{Any,1}).
struct Mochila
    itens::Array{Any,1}
end

# Definindo um construtor para a estrutura Mochila que permite criar uma instância da Mochila com a lista de itens.
function Mochila.of(itens)
    return Mochila(itens)
end

# Definindo uma função chamada 'filter' que recebe uma instância de Mochila (m) e um valor 'w'.
function filter(m::Mochila, w)
    # Classificando os itens na mochila com base na razão valor/peso em ordem decrescente.
    return Mochila.of(
        sort(
            m.itens,
            by = (a, b) -> a.valor / a.peso >= b.valor / b.peso ? -1 : 1
        )
        # Mapeando cada item na mochila atualizando o peso 'w' conforme necessário.
        .map(curr -> w - curr.peso >= 0 ?
            (w = w - curr.peso, curr) :
            (w2 = w, w = 0, (valor = (curr.valor / curr.peso) * w2, peso = w2)))
        # Filtrando os itens na mochila para manter apenas aqueles com peso positivo.
        .filter(item -> item.peso > 0)
    )
end

# Definindo uma função chamada 'reduce' que recebe uma instância de Mochila (m) e retorna a soma dos valores dos itens.
function reduce(m::Mochila)
    return reduce(+, m.itens.valor)
end

# Criando três instâncias de Mochila (m1, m2, m3) com diferentes conjuntos de itens.
let m1 = Mochila.of([
    (valor = 7, peso = 6), 
    (valor = 6, peso = 6), 
    (valor = 5, peso = 5), 
    (valor = 8, peso = 6)
])

let m2 = Mochila.of([
    (valor = 7, peso = 6), 
    (valor = 6, peso = 6)
])

# Chamando a função 'filter' com m1 e o valor 10 para criar m3 e, em seguida, chamando a função 'reduce' para calcular a soma dos valores em m3.
let m3 = filter(m1, 10)
reduce(m3)