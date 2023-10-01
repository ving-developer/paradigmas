# Definindo a função curried
f(a) = x -> b -> a * x + b

# Exemplo de uso
g = f(2)  # a = 2
h = g(3)  # x = 3
resultado = h(4)  # b = 4
println(f(2)(3)(4))  # Imprime: 10