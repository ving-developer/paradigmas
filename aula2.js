/**
 * Dado um array de horários igual ao da aula 1, verificar se há choque de horário
 */

// console.log([{i : 15, f: 16}, {i : 8, f: 10}, {i: 17, f: 18}].sort((x, y) => (x.i == y.i) ? x.f - y.f : (x.i < y.i)?-1:1))

// console.log([{i : 15, f: 16}, {i : 9, f: 10}, {i: 10, f: 12}, {i: 8, f:9}].sort((x, y) => (x.i == y.i) ? x.f - y.f : (x.i < y.i)?-1:1).every((val, i, array) => array[i+1] != null ? val.f <= array[i+1]?.i : true ))

/**
 * Você foi assaltar uma casa com uma mochila e deve encher ela com itens de valores mais relevantes
 * Cada item tem um peso e a mochila possui uma capacidade máxima. Faça um algoritmo que irá calcular
 * o peso máximo que a mochila conseguiu pegar dado os pesos
 */

let test = [{ v: 7, p: 6}, { v: 5, p: 5}, {v: 6, p: 6}, {v: 8, p:6}, {v: 5, p:10}].sort((x, y) => y.v / y.p - x.v / x.p)
.reduce((acc, cur, w =10) => w - cur.p>=0? (w = w - cur.peso, acc+cur.v) : (acc += (cur.v/cur.peso)*w, w = 0, acc), 0);

console.log(test)