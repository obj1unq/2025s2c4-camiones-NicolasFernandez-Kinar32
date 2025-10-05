import camion.*

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultosNecesarios() {return 1}
	method accidentado(){null}
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

	method bultosNecesarios(){
		return 1
	}

	method accidentado(){
		pesoActual +=20
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

	method bultosNecesarios(){
		return 2
	}

	method accidentado(){
		return modoActual.opuesto()
	}
}

object modoAuto{
	method nivelPeligrosidad(){
		return 15
	}

	method opuesto(){
		return modoTransformer
	}
}

object modoTransformer{
	method nivelPeligrosidad(){
		return 30
	}

	method opuesto(){
		return modoAuto
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

	method bultosNecesarios(){
		return if(cantidadLadrillos.between(0, 100)){1} 
		else if(cantidadLadrillos.between(101, 300)){2}
		else{3}
	}

	method accidentado(){
		return if(cantidadLadrillos > 13){
			cantidadLadrillos -= 12
		}else{cantidadLadrillos = 0}
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

	method bultosNecesarios(){
		return (estadoMisiles.bultosNecesarios())
	}

	method accidentado(){
		estadoMisiles = sinMisiles
	}
}

object conMisiles{
	method peso(){
		return 300
	}

	method nivelPeligrosidad(){
		return 100
	}

	method bultosNecesarios(){
		return 2
	}
}

object sinMisiles{
	method peso(){
		return 200
	}

	method nivelPeligrosidad(){
		return 0
	}

	method bultosNecesarios(){
		return 1
	}
}

object residuosRadioactivos{
	var property pesoActual = 0

	method pesoActual(numero){
		pesoActual = numero
	}

	method peso(){
		return pesoActual
	}

	method nivelPeligrosidad(){
		return 200
	}

	method bultosNecesarios(){
		return 1
	}

	method accidentado(){
		pesoActual += 15
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

	method bultosEnCarga(){
		return (cosas.sum({cosa => cosa.bultosNecesarios()}))
	}

	method bultosNecesarios(){
		return(self.bultosEnCarga() + 1)
	}

	method accidentado(){
		cosas.forEach({cosa => cosa.accidentado()})
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

  method bultosNecesarios(){
	return 2
  }

  method accidentado(){
	null
  }
}
