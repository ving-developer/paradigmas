# Criando um array de tuplas
valores = [(3, "c"), (1, "a"), (4, "d"), (1, "b"), (5, "e"), (9, "f")]

# Definindo uma função de ordenação personalizada que ordena as tuplas primeiro pelo segundo elemento e depois pelo primeiro
ordenacao_personalizada(x) = (x[2], x[1])

# Ordenando o array usando a função de ordenação personalizada
valores_ordenados = sort(valores, by=x -> (x[2], x[1]))

# Exibindo o array ordenado
println(valores_ordenados)  # Deve imprimir [(1, "a"), (1, "b"), (3, "c"), (4, "d"), (5, "e"), (9, "f")]