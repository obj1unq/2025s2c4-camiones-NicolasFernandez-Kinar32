import cosas.*
import extras.*

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

	method laCosaMasPesada(){
		return(cosas.max({cosa => cosa.peso()}))
	}

	method hayAlgoConPesoEntre_Y_(min, max){
		return(cosas.any({cosa => cosa.peso().between(min, max)}))
	}

	method listaDePesos(){
		return(cosas.map({cosa => cosa.peso()}))
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

	//hecho antes de la parte de transportes
	method puedeCircularEnRuta(peligrosidadMaxima){
		return (!self.estaSobreexcedidoDePeso() && (self.peligrosidadTotal() < peligrosidadMaxima))
	} 

	method cantidadBultos(){
		return(cosas.sum({cosa => cosa.bultosNecesarios()}))
	}

	method accidente(){
		cosas.forEach({cosa => cosa.accidentado()})
	}

	method descargarTodo(almacen){
		almacen.guardarTodo(cosas)
		cosas.clear()
	}

	//como no todos los caminos disponibles tienen definida una peligrosidad limite prefiero no utilizar
	//el metodo previo de "puedeCircularEnRuta(peligrosidadMaxima)", en caso contrario sería interesante reaprovecharlo
	method transportar(destino, ruta){
		if(!self.estaSobreexcedidoDePeso() && ruta.puedeSerRecorrida(self)){
			self.descargarTodo(destino)
		}
	}
}

