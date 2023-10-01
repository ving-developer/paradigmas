// const Container = function(val){
//     this.value = val;
// }

// Container.of = function(val, count = null){
//     return count ? [new Container(val), ...count] :  new Container(val);
// }

// Container.prototype.map = function(fn){
//     return Container.of(fn(this.value));
// }

// let double = x => x + x;

// let x = Container.of(5);


// const mochila = (itens, w) => itens.sort((a, b) => a.valor/a.peso >= b.valor/b.peso ? -1 : 1). reduce()

// console.log(x);


const Mochila = function(val){
    this.value = val;
}

Mochila.of = itens => new Mochila(itens);

Mochila.prototype.filter2 = w => Mochila.of(() => {
    this.value.sort((x, y) => (x.i == y.i) ? x.f - y.f : (x.i < y.i)?-1:1).map( curr => w - curr.peso >= 0 ? ( w = w-curr.peso, curr) : (w2 = 2, 2= 0, {valor: (curr.valor/curr.peso)*w2, peso:w2 }));
  })