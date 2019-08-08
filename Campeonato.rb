--clase participante ingresar los datos correspondientes
class Participante 
	attr_accessor :nombre, :apellido, :alia, :razaJuego, :puntajeTotal
	def initialize(nombre, apellido, alia, razaJuego)
		@nombre = nombre
		@apellido = apellido
		@alia = alia
		@razaJuego = razaJuego 
	end

	def registrar_puntaje(puntajeTotal)
		 @puntajeTotal = puntajeTotal
	end

	def validar_raza_juego
		if tipoLiga == "Alliance" || tipoLiga == "Horde"
			return true
		else
			return false
		end
	end
end

class Liga

	attr_accessor :tipoLiga, :participantes
	def initialize(tipoLiga)
		@tipoLiga  = tipoLiga
		@participantes = Array.new()
	end

	def agregar_participantes(participante)

		@participantes << participante
	end

	def validar_tipo_liga
		if tipoLiga == "Platino" || tipoLiga == "Oro" || tipoLiga == "Plata"
			return true
		else
			return false
		end
	end

	def calcular_puntaje_total
		puntaje_total = 0
		participantes.map { |e| puntaje_total += e.puntajeTotal  }
		return puntaje_total
	end
end

class Campeonato

	attr_accessor :liga

	def initialize()		
		@liga = Array.new()
	end

	def registrar_Liga
 
		instLiga1 = Liga.new("Liga 01")		
		instParticipante1 = Participante.new('Abel',"Quispe","Abel123",  "Alliance")
		instParticipante2 = Participante.new('Oscar',"Ramos","Oscar123",  "Horde")
		instParticipante3 = Participante.new('Jose',"Quispe","Jose123",  "Alliance")
		instParticipante1.registrar_puntaje(20)
		instParticipante2.registrar_puntaje(00)
		instParticipante3.registrar_puntaje(00)
		instLiga1.agregar_participantes(instParticipante1)
		instLiga1.agregar_participantes(instParticipante2)
		instLiga1.agregar_participantes(instParticipante3)
		@liga << instLiga1
		 
	end

	#Crear un método que permita obtener al ganador de una liga.
	def obtener_ganador_por_liga

		for x in 0...liga.size
			participantesOrdenado = liga[x].participantes.sort_by{ |z| z.puntajeTotal}.reverse
			puts "| #{liga[x].tipoLiga}	| #{participantesOrdenado[0].puntajeTotal}   	| #{participantesOrdenado[0].nombre}	"
		end	
	end

	#Crear un método que me permita obtener la liga con mayor puntaje acumulado.
	def obtener_liga_puntaje_mayor

		ligasort = liga.sort_by{ |z| z.calcular_puntaje_total}.reverse
		puts "| #{ligasort[0].tipoLiga}							|"	
	end
end

instCampeonato = Campeonato.new()
instCampeonato.registrar_Liga
#instCampeonato.obtener_ganador_por_liga
instCampeonato.obtener_liga_puntaje_mayor 
