=begin
	Un Emprendedor necesita simular partidas de 3 juegos electrónicos.
El Gamer podrá jugar n partidas de cada juego registrará su código de gamer.
El puntaje por juego se obtiene de la siguiente manera:
Se genera un número aleatorio entre 1 y 10.
Si es menor que 4 se puntaje base es 10.
Si es mayor o igual a 4 pero menor que 8 su base es 15
Si es mayor o igual que 8 su puntaje base es 20.
Si juega:
- “Dota 2” su puntaje base sube en un 20%
- “Poker” su puntaje base sube en 15%
- “Cars” su puntaje base sube en 10%
El costo de cada partida es de 1 sol.
Además, por cada 3 partidas que juega un mismo Gamer se le otorga gratis una partida.
Se necesita:
1) Simular 20 partidas.
2) Imprimir el puntaje total obtenido por cada Gamer.
3) Imprimir el nombre del Gamer con mayor puntaje.
4) Imprimir la cantidad de dinero que se recaudó
5) Imprimir cuantas partidas gratuitas se realizaron.
	
=end


class Partida

	attr_accessor :costo ,:punto

	def initialize(costo = 0) 
		@costo = costo
		@punto = Random.new().rand(1..10)
	end

	def generar_puntaje()
		
		if punto < 4
			10
		elsif punto >= 4 && punto < 8
			15
		else
			20
		end
	end
end

class Dota2 < Partida

 	def initialize(costo = 0)
 		super(costo)
 	end

 	def generar_puntaje

 		super + (super * 0.20)
 	end
end

class Poker < Partida

 	def initialize(costo = 0)
 		super(costo)
 	end

 	def generar_puntaje
 		super + (super * 0.15)
 	end
 end

class Cars < Partida

 	def initialize(costo = 0)
 		super(costo)
 	end

 	def generar_puntaje
 		super + (super * 0.10)
 	end
end

class Jugador

	attr_accessor :codigo, :partidas

	def initialize(codigo)
		@codigo = codigo
		@partidas = Array.new()
	end

	def agregar_partida(partida)
		partidas << partida
	end

	def obtener_puntajes
		
		puntos = 0
		partidas.each{ |partida| puntos += partida.generar_puntaje  }
		return puntos
	end

	def obtener_costo		
		costo = 0
		partidas.each{ |partida| costo += partida.costo  }
		return costo
	end

	def obtener_partida_gratuita		
		cant = 0
		partidas.each{ |partida| cant += ((partida.costo == 0) ? 1 : 0)  }
		return cant
	end
end

class SimilarPartida

	attr_accessor :jugadores

	def initialize()
		@jugadores = Array.new()
	end

	def agregar_jugador(jugador)
		jugadores << jugador
	end

	def listar_puntaje_por_jugador
		
		puts "[ Id 	|	Codigo 	| Puntaje	]"
		
		
		for x in 0...jugadores.size
			puts "| #{(x < 10) ? "0#{x + 1}" : x + 1}	| #{jugadores[x].codigo} | #{jugadores[x].obtener_puntajes}"
		end

		puts "----------------------------------"	
	end

	def jugador_mayor_puntaje
		jugador = jugadores.sort_by {|obj| obj.obtener_puntajes}.reverse[0] 
		
		puts "[ Codigo 	| Puntaje	]"
		puts "----------------------------------"
		puts "| #{jugador.codigo} | #{jugador.obtener_puntajes}"
		puts "----------------------------------"	
	end

	def dinero_recaudado
		dinero = 0
		jugadores.each{ |jugador| dinero += jugador.obtener_costo  }
		
		puts "---------------------------------------------------"
		puts "El dinero recaudado total es: #{dinero}"
		puts "---------------------------------------------------"	
	end
	
	def partida_gratuita
		partida = 0
		jugadores.each{ |jugador| partida += jugador.obtener_partida_gratuita  }
		  
		puts "---------------------------------------------------"
		puts "La cantidad de partida gratuita es: #{partida}"
		puts "---------------------------------------------------"	
	end

end

instJugador1 = Jugador.new("AVENGER1")
instJugador2 = Jugador.new("AVENGER2")
instJugador3 = Jugador.new("AVENGER3")
instJugador4 = Jugador.new("AVENGER4")
instJugador5 = Jugador.new("AVENGER5")

instJugador1.agregar_partida(Dota2.new(1))
instJugador2.agregar_partida(Dota2.new(1))
instJugador3.agregar_partida(Dota2.new(1))
instJugador4.agregar_partida(Dota2.new(1))
instJugador5.agregar_partida(Dota2.new(1))

instJugador1.agregar_partida(Poker.new(1))
instJugador2.agregar_partida(Poker.new(1))
instJugador3.agregar_partida(Poker.new(1))
instJugador4.agregar_partida(Poker.new(1))
instJugador5.agregar_partida(Poker.new(1))

instJugador1.agregar_partida(Cars.new(1))
instJugador2.agregar_partida(Cars.new(1))
instJugador3.agregar_partida(Cars.new(1))
instJugador4.agregar_partida(Cars.new(1))
instJugador5.agregar_partida(Cars.new(1))

#ESTAS SON LAS PARTIDAS GRATIS PARA LOS 5 JUGADORES
instJugador1.agregar_partida(Dota2.new())
instJugador2.agregar_partida(Dota2.new())
instJugador3.agregar_partida(Dota2.new())
instJugador4.agregar_partida(Dota2.new())
instJugador5.agregar_partida(Dota2.new())


instSimilarPartida = SimilarPartida.new()
instSimilarPartida.agregar_jugador(instJugador1)
instSimilarPartida.agregar_jugador(instJugador2)
instSimilarPartida.agregar_jugador(instJugador3)
instSimilarPartida.agregar_jugador(instJugador4)
instSimilarPartida.agregar_jugador(instJugador5)

instSimilarPartida.listar_puntaje_por_jugador 
instSimilarPartida.jugador_mayor_puntaje
instSimilarPartida.dinero_recaudado
instSimilarPartida.partida_gratuita



#Sandy I. Valdivia