# High Order Function é uma função que aceita outras funções como argumentos e/ou retorna funções como resultado.
# Aqui iremos representar o exemplo da ordenação de horários vista em sala

# Criando o array de horários desordenaos. Aqui utilizamos uma NamedTuple da Julia para representar os horários
horarios = [(i=15, f=16), (i=8, f=10), (i=10, f=12), (i=8, f=9), (i=8, f=10)]

# Criando uma função para servir de método de comparacao, para este caso irá somar horário inicial e horário final
metodo_comparacao(x) = x.i + x.f

# Criando uma funcao de comparação personalizada, onde recebe o método de comparação e aplica ele nos elementos x e y. Ordenando os elementos de forma crescente
comparar_horarios(comp) = (x, y) -> comp(x) < comp(y)

# Chamando a função `sort` da Julia de forma destrutiva, onde irá utilizar para cada elemento a função `comparar_horarios` para ordenar os dados
sort!(horarios, lt=comparar_horarios(metodo_comparacao))

# Exibindo resultado
for h in horarios
    println("Inicio: ", h.i, ", Fim: ", h.f)
end

# Código todo em uma linha:
# println(sort([(i=15, f=16), (i=8, f=10), (i=10, f=12), (i=8, f=9)], by=(x) -> x.i + x.f, lt=(x,y) -> x < y))