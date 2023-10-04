let curry = (fn) => {
    if(typeof fn !== 'function'){
        throw Error('No function provided');
    }
    return function curriedFn(...args){
        if(args.length < fn.length){
            return function(){
                return curriedFn.apply(null, args.concat( [].slice.call(arguments) ));
            }
        }
        return fn.apply(null, args);
    }
}

const filtro = (arr, tit, fcomp, cat) => arr.filter( item => tit.length <= 0 || item.titulo.search(tit) >= 0).filter 
    (item => fcomp==null || fcomp( item.cargaHoraria)).filter(item => cat.length <= 0 || item.categoria==cat)

let filter1 = curry(filtro)([
    {titulo: "Exercício de academia" , cargaHoraria: 10 , categoria: "curso"}, 
 
	{titulo: "dasdasdsa academia" , cargaHoraria: 20 , categoria: "curso"}, 
 
	{titulo: "fdsfdsfsd academia" , cargaHoraria: 30 , categoria: "curso"},
 
    {titulo: "gfdgfd academia" , cargaHoraria: 40 , categoria: "projeto"},
 
    {titulo: "arte sdsa da" , cargaHoraria: 10 , categoria: "curso"},
 
    {titulo: "dsasa arte dsadas" , cargaHoraria: 20 , categoria: "projeto"},
 
    {titulo: "dsadsa arte dsadas" , cargaHoraria: 20 , categoria: "curso"},
 
    {titulo: "dsds arte" , cargaHoraria: 30 , categoria: "projeto"}])("academia")


console.log(filter1((ch) => ch >= 20 && ch <= 30)("curso"))
