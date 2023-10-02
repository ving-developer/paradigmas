# Functor é um container que implementa um método `map`, que após percorrer os valores do container retorna um novo container

# Aqui iremos utilizar o exemplo da mochila vista em sala

struct Item
    valor::Int64
    peso::Int64
end

# Criando um método `of` para criar container do tipo Item dado valor e peso
of(valor::Int64, peso::Int64) = Item(valor, peso)

# Definindo o método 'map' para aplicar uma função ao valor e peso dentro do functor
function map(fn, item::Item)
    return of(fn(item.valor), fn(item.peso))
end

#Criando um Item com valor/peso 5 e 2
container = of(5, 2);

#Chamando o map, passando para ele uma função que deverá dobrar os valores internos dele
container = map(x -> x * 2, container);

println(container)