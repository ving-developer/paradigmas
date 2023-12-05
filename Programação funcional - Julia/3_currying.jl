# Currying se trata de transformar uma função que espera vários parametros, em uma função que espera apenas um parametro e retorna uma função "curried"
# que por sua vez espera um dos parâmetros faltantes, e caso haja mais um parametro faltante, irá retornar uma função que espera por ele.

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

# Criando uma função `filtrar`, que irá receber um titulo como parametro e chamar uma outra função "curried", que irá receber carga horária e retornar mais uma função "curried"
# Que por sua vez recebe a categoria e retorna mais uma função "curried" que irá receber a Disciplina como parametro.
# Por fim, retorna um Bool indicando se a disciplina contem cada um dos filtros passados que não sejam `nothing`
filtrar = tit -> chr -> cat -> x -> (tit === nothing || occursin(tit, x.titulo)) && (chr === nothing || x.cargaHoraria ∈ chr) && (cat === nothing || x.categoria == cat)

filtrarPorTitulo = filtrar("academia")
FiltrarTituloCh = filtrarPorTitulo(nothing)
FiltrarDisciplinas = FiltrarTituloCh("curso")
# Chamando a função `filter` passando o Currying `filtrar`, filtrando por titulo e categoria neste exemplo (carga horária recebe nothing)
filtrarDisciplina2 = FiltrarTituloCh("projeto")
# filter(filtrar("academia")(nothing)(nothing), disciplinas)
println(filter(FiltrarDisciplinas, disciplinas))
println(filter(filtrarDisciplina2, disciplinas))

# # Exibindo resultado
# for d in disciplinas
#     println(d)
# end