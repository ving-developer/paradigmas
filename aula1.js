/** Código que recebe um vetor de horários iniciais (i) e horários finais (f) e ordena eles em ordem crescente.
 *  Caso o horário de inicio seja igual ao horário final deve ordenar pelo horário final também. 
 **/
console.log([{i : 15, f: 16}, {i : 8, f: 10}, {i: 10, f: 12}, {i: 8, f:9}].sort((x, y) => (x.i == y.i) ? x.f - y.f : (x.i < y.i)?-1:1))