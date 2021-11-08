object cumbre {
	
	const property participantes = #{}
	const paisesAuspiciantes = []
	const personasRegistradas = []
	var property cantidadCommitsIngreso = 300
	
	method agregarAuspiciante(pais) = paisesAuspiciantes.add(pais)
	
	method ingresa(unParticipante) = participantes.add(unParticipante)
	
	method registrar(persona) {
		personasRegistradas.add(persona)
	}
	
	method esConflictivo(pais) = paisesAuspiciantes.any{ p => p.tieneConflictoCon(pais)}
	
	
	method paisesParticipantes() = participantes.map{ p => p.pais()}.asSet()
	
	method cantidadParticipantesDe(pais) = participantes.count {p => p.pais() == pais }
	
	method paisConMasParticipantes() = self.paisesParticipantes().max{ p => self.cantidadParticipantesDe(p)}
	
	method participantesExtranjeros() = participantes.filter{p => !paisesAuspiciantes.contains(p.pais())}
	
	method esRelevante() = participantes.all{ p => p.esCape() }
	
	method dejaEntrar(persona) = persona.puedeEntrar() and not self.esConflictivo(persona.pais()) and self.hayCupo(persona.pais())
	
	method hayCupo(pais) = paisesAuspiciantes.contains(pais) or self.cantidadParticipantesDe(pais) <= 2
	
	method ingresarParticipante(persona) {
		if (self.dejaEntrar(persona))
			self.ingresa(persona)
		else 
			self.error("No se le permite ingresar")
		}
		
	method esSegura() = personasRegistradas.all{ p=> self.dejaEntrar(p) }
	
}
