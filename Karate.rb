class Karate 
	attr_accessor :nombre, :edad, :dni, :colorCinturon, :partidasGanadas, :partidasEmpatadas, :partidasPerdidas
	def initialize( nombre, edad, dni, colorCinturon,partidasGanadas, partidasEmpatadas, partidasPerdidas)
		@nombre = nombre
		@edad = edad
		@dni = dni
		@colorCinturon = colorCinturon
		@partidasGanadas = partidasGanadas
		@partidasEmpatadas = partidasEmpatadas
		@partidasPerdidas = partidasPerdidas
	end

	def calcular_Puntaje
		 (@partidasGanadas) * 3 + (@partidasEmpatadas) * 2
	end

end
 
class KarateProcess

	#Registre 6 equipos.
	def initialize()
		
		instKarate1 = Karate.new('Sandy',28,45932550,"Azul",  3,0,0)
		instKarate2 = Karate.new('Sandra',18,45965896,"Marron",  2,2,7)
		instKarate3 = Karate.new('Sarela',17,45235689,"Negro",  1,2,0)
		instKarate4 = Karate.new('Sergio',25,45968965,"Negro",  1,2,5)
		instKarate5 = Karate.new('Sixto',18,78457845,"Negro",  2,2,0)
		instKarate6 = Karate.new('Sandro',20,74859647,"Negro",  8,8,0)

		$arrayKarate =  [instKarate1, instKarate2, instKarate3, instKarate4, instKarate5, instKarate6] 
	end

	#Desarrolle un método que genere un listado ordenado por puntaje
	def generate_ListPosition
		($arrayKarate.sort! {|x, y| y.calcular_Puntaje <=> x.calcular_Puntaje})#.reverse!
	end

	#tabla de posiciones. 
	def get_Position
		generate_ListPosition.each { |x| puts "#{x.nombre } => #{x.calcular_Puntaje } puntos."}
	end

	#Desarrolle un método que permita obtener el participante campeón del torneo.
	def get_Campeon 
		puts "#{generate_ListPosition.first.nombre } => #{generate_ListPosition.first.calcular_Puntaje } puntos."
	end

	#Desarrolle un método que permita buscar un participante del torneo por dni
	def get_Participant(dni)
		result = $arrayKarate.detect {|e| e.dni == dni }   
		if result == nil
			puts "No encontrado"
		else
			puts "Participante: #{result.nombre}\nDNI: #{result.dni}\nPuntos: #{result.calcular_Puntaje }"
		end
	end

	#Desarrolle un método que reciba un número de dni y un número, tal que permita modificar el número de partidas ganadas
	def set_UpdateWonMatch(dni, value) 
		puts "========== Valores antes de modificar =========="
		get_Participant(45932550)
		puts ""
		$arrayKarate.each  {  |e| if (e.dni == dni); e.partidasGanadas = value;   break  end }
		puts "========== Nuevo valor modificado =========="
		get_Participant(45932550) 
		puts ""
	end
end

instKarateProcess = KarateProcess.new()

 #instKarateProcess.get_Position
 #instKarateProcess.get_Campeon
 #instKarateProcess.get_Participant(45932550)
 instKarateProcess.set_UpdateWonMatch(45932550,1)
 
 #Sandy I. Valdivia
