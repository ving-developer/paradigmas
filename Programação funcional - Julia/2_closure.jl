# Closure é o uso de um parâmetro ainda não definido no escopo de uma função interna, mas que será definido em uma função externa.
# Aqui iremos representar o exemplo da filtragem de disciplinas vista em sala

# Criando o array de disciplinas
disciplinas = [
    (titulo="Exercicio de academia", cargaHoraria=10, categoria="curso"),
    (titulo="dasdasdsa academia" , cargaHoraria=20 , categoria="curso"),
    (titulo="fdsfdsfsd academia" , cargaHoraria=30 , categoria="curso"),
    (titulo="gfdgfd academia" , cargaHoraria=40 , categoria="projeto"),
    (titulo="arte sdsa da" , cargaHoraria=10 , categoria="curso"),
    (titulo="dsasa arte dsadas" , cargaHoraria=20 , categoria="projeto"),
    (titulo="dsadsa arte dsadas" , cargaHoraria=20 , categoria="curso"),
    (titulo="dsds arte" , cargaHoraria=30 , categoria="projeto")
   ];

# Função que recebe uma string de titulo e retorna uma closure que espera receber como parametro X uma disciplina
function filtrar_titulo(substring)
    return x -> occursin(substring, x.titulo)
end

# Chamando a função `filter` de forma destrutiva, que irá utilizar nosso `filtrar_titulo` para atualizar o array `disciplinas`
filter!(filtrar_titulo("academia"), disciplinas)

# Exibindo resultado
for d in disciplinas
    println(d)
end

# Código todo em uma linha:
# println(filter(x -> occursin("academia", x.titulo), [(titulo="Exercicio de academia", cargaHoraria=10, categoria="curso"),(titulo="dasdasdsa academia" , cargaHoraria=20 , categoria="curso"),(titulo="fdsfdsfsd academia" , cargaHoraria=30 , categoria="curso"),(titulo="gfdgfd academia" , cargaHoraria=40 , categoria="projeto"),(titulo="arte sdsa da" , cargaHoraria=10 , categoria="curso"),(titulo="dsasa arte dsadas" , cargaHoraria=20 , categoria="projeto"),(titulo="dsadsa arte dsadas" , cargaHoraria=20 , categoria="curso"),(titulo="dsds arte" , cargaHoraria=30 , categoria="projeto")]))
