import conocimientos.*
import cumbre.*

class Participante {
	
	var property pais
	const conocimientos = []
	var commits
	
	method esCape() 
	
	method agregarConocimiento(conocimiento) = conocimientos.add(conocimiento)
	
	method puedeEntrar() = conocimientos.contains(programacionBasica)
	
	method condicionAdicional() 
	
	method hacerActividad(actividad)  = conocimientos.add(actividad.tema()) and (commits += actividad.commitsAgregados())  
	
}

class Programador inherits Participante {
	
	var horasCapacitacion = 0
	
	override method esCape() = commits > 500 
	
	override method puedeEntrar() = super() and self.condicionAdicional()
	
	override method condicionAdicional() = commits > cumbre.cantidadCommitsIngreso()
	
	override method hacerActividad(actividad)  = super(actividad) and (horasCapacitacion += actividad.cantHoras())
}

class Especialista inherits Participante {
	
	override method esCape() = conocimientos.size() > 2
	
	override method puedeEntrar() = super() and self.condicionAdicional() 
	
	override method condicionAdicional() = 
		commits > cumbre.cantidadCommitsIngreso() - 100 and conocimientos.contains(objetos)
}

class Empresa {

}