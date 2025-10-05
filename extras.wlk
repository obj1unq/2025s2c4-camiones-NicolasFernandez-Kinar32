import camion.*
import cosas.* 

object almacen{
	const property deposito = #{}

	method guardarTodo(paquetes){
		deposito.addAll(paquetes)
	} 
}

object ruta9{
    const peligrosidadAceptable = 20

    method peligrosidadMaxima() = peligrosidadAceptable

    method puedeSerRecorrida(transporte){
        return (transporte.peligrosidadTotal() < peligrosidadAceptable)
    }
}

object caminoVecinal{
    var property pesoMaximo = 2500

    method puedeSerRecorrida(transporte){
        return (transporte.pesoTotal() < pesoMaximo)
    }
}