import camion.*

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranel {
	var pesoActual = 0

	method pesoActual(numero){
		pesoActual = numero
	}
	method peso(){
		return pesoActual
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

object contenedorPortuario{
	const property cosas = #{}
	const pesoBase = 100

	method cargar(cosa){
		cosas.add(cosa)
	}

	method descargar(cosa){
		cosas.remove(cosa)
	}

	method pesoCarga(){
		return(cosas.sum({cosa => cosa.peso()}))
	}

	method peso(){
		return(self.pesoCarga() + pesoBase)
	}

	method cosaMasPeligrosa(){
		return(cosas.max({cosa => cosa.nivelPeligrosidad()}))
	}

	method nivelPeligrosidad(){
		return if(!cosas.isEmpty()){
			(self.cosaMasPeligrosa().nivelPeligrosidad())
			}else{0}
	}
}

object embalajeSeguridad {
  const property cosa = #{}

  method embalar(obj){
	cosa.add(obj)
  }

  method peso(){
	return (cosa.uniqueElement().peso())
  } 

  method nivelPeligrosidad(){
	return ((cosa.uniqueElement().nivelPeligrosidad()) / 2)
  }
}