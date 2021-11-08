import cumbre.*


class Pais {

	const paisConConflicto = []
	
	method registrarConflicto(pais) = paisConConflicto.add(pais)
	
	method tieneConflictoCon(pais) = paisConConflicto.contains(pais)

	method esConflictivo() = cumbre.esConflictivo(self)
	}

class Actividad {
	
	const property tema
	
	const property cantHoras
	
	method commitsAgregados() = cantHoras * tema.commitsPorHora()
}