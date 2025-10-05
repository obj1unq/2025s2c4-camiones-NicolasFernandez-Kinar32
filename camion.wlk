import cosas.*

object camion {
	const property cosas = #{}
	const tara  = 1000
	const pesoMaximo = 2500
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}

	method todosConPesoPar(){
		return(cosas.all({cosa => cosa.peso().even()}))
	}

	method hayAlgoQuePesa_(numero){
		return(cosas.any({cosa => cosa.peso() == numero}))
	}

	method pesoCarga(){
		return(cosas.sum({cosa => cosa.peso()}))
	}

	method pesoTotal(){
		return(tara + self.pesoCarga())
	}

	method estaSobreexcedidoDePeso(){
		return(self.pesoTotal() > pesoMaximo)
	}

	method hayAlgoConPeligrosidadEspecifica_(numero){
		return(cosas.any({cosa => cosa.nivelPeligrosidad() == numero}))
	}

	method algoConPeligrosidadEspecifica_(numero){
		return(cosas.find({cosa => cosa.nivelPeligrosidad() == numero}))
	}

	method hayAlgoConPeligrosidadMayorA_(numero){
		return(cosas.filter({cosa => cosa.nivelPeligrosidad() > numero}))
	}

// me di cuenta a mitad de esto que el ejercicio pedía los elementos y no si existían
	
	method cosasConPeligrosidadMayorA_(numero){
		return(cosas.filter({cosa => cosa.nivelPeligrosidad() > numero}))
	}

	method cosasMásPeligrosasQue_(elemento){
		return (cosas.filter({cosa => cosa.nivelPeligrosidad() > elemento.nivelPeligrosidad()}))
	}

	method peligrosidadTotal(){
		return(cosas.sum({cosa => cosa.nivelPeligrosidad()}))
	}

	method puedeCircularEnRuta(peligrosidadMaxima){
		return (!self.estaSobreexcedidoDePeso() && (self.peligrosidadTotal() < peligrosidadMaxima))
	}
}

