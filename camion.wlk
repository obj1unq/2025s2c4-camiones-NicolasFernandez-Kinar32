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

	method hayAlgoConPeligrosidad_(numero){
		return(cosas.any({cosa => cosa.nivelPeligrosidad() == numero}))
	}

}
