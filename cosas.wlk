import camion.*

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
	var pesoAhora = 0

	method pesoAhora(numero){
		pesoAhora = numero
	}
	method peso(){
		return pesoAhora
	}

	method nivelPeligrosidad(){
		return 1
	}
}

object bumblebee {
	var property modoActual = modoAuto

	method peso(){
		return 800
	}
	
	method nivelPeligrosidad(){
		return modoActual.nivelPeligrosidad()
	}
}

object modoAuto{
	method nivelPeligrosidad(){
		return 15
	}
}

object modoTransformer{
	method nivelPeligrosidad(){
		return 30
	}
}

object paqueteLadrillos{
	var cantidadLadrillos = 0

	method cantidadLadrillos(numero){
		cantidadLadrillos = numero
	}

	method peso(){
		return 2 * cantidadLadrillos
	}

	method nivelPeligrosidad(){
		return 2
	}
}

object bateriaAntiaerea{
	var property estadoMisiles = sinMisiles

	method peso(){
		return (estadoMisiles.peso())
	}

	method nivelPeligrosidad(){
		return (estadoMisiles.nivelPeligrosidad())
	}
}

object conMisiles{
	method peso(){
		return 300
	}

	method nivelPeligrosidad(){
		return 100
	}
}

object sinMisiles{
	method peso(){
		return 200
	}

	method nivelPeligrosidad(){
		return 0
	}
}

object residuosRadioactivos{
	var pesoActual = 0

	method pesoActual(numero){
		pesoActual = numero
	}

	method peso(){
		return pesoActual
	}

	method nivelPeligrosidad(){
		return 200
	}
}
