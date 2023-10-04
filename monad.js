const mochila = function (itens) {
    this.itens = itens;
    }
    
mochila.of = itens => new mochila(itens)


mochila.prototype.filter = function(w) {
    return mochila.of(
        this.itens
            .sort((a, b) => a.valor / a.peso >= b.valor / b.peso ? -1 : 1)
            .map(curr => w - curr.peso >= 0 ? (w = w - curr.peso, curr) : (w2 = w, w = 0, { valor: (curr.valor / curr.peso) * w2, peso: w2 }))
            .filter(item => item.peso > 0)
    );
}


mochila.prototype.reduce = function() {
    return this.itens.reduce((acc, cur) => acc + cur.valor, 0);
}


let m1 =mochila.of ([
    {valor: 7 , peso: 6}, 
    {valor: 6 , peso: 6}, 
    {valor: 5 , peso: 5}, 
    {valor: 8 , peso: 6}
    ]);

let m2 = mochila.of ( [
        {valor: 7 , peso: 6}, 
        {valor: 6 , peso: 6}
        ])

let m3 = m1.filter(10); //erro de  Cannot read properties of undefined (reading 'sort')
m3.reduce();