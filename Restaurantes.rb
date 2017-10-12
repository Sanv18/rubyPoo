class Trebol 
	attr_accessor :nombreLocal, :tipo, :calificacionAtencion, :calificacionGusto, :calificaciondecoracion 

=begin
 nombre del local, tipo (Sandwichería o Pollería),
 calificación de atención (valor entre 1 y 10), calificación de gusto o sabor (valor entre 1
 y 10) y decoración (valor entre 1 y 10)
=end
	def initialize(nombreLocal, tipo, calificacionAtencion, calificacionGusto, calificaciondecoracion)
		@nombreLocal = nombreLocal
		@tipo = tipo
		@calificacionAtencion = calificacionAtencion
		@calificacionGusto = calificacionGusto
		@calificaciondecoracion = calificaciondecoracion 
	end

	def get_Calificacion
		  (@calificacionAtencion) * 0.35 + (@calificacionGusto) * 0.35 + (@calificaciondecoracion)* 0.3
	end

end
 
class TrebolProcess

	#Desarrolle las clases necesarias y sus relaciones. Registre 6 locales.
	def initialize()
		
		instTrebol1 = Trebol.new('Local1',"Sandwichería",10,1, 1)
		instTrebol2 = Trebol.new('Local2',"Pollería", 600,2,7)
		instTrebol3 = Trebol.new('Local3',"Sandwichería", 5,2,1)
		instTrebol4 = Trebol.new('Local4',"Pollería", 1,2,5)
		instTrebol5 = Trebol.new('Local5',"Pollería", 8,2,1)
		instTrebol6 = Trebol.new('Local6',"Pollería", 8,1,1)

		$arrayTrebol =  [instTrebol1, instTrebol2, instTrebol3, instTrebol4, instTrebol5, instTrebol6] 
	end


	#listado de Locales. 
	def get_Locales
		$arrayTrebol.each { |x| puts "#{x.nombreLocal } #{x.tipo} => #{x.get_Calificacion } #{x.get_Calificacion >= 80 ? "APROBADO" : "DESAPROBADO"}."}
	end

	def generate_ListRating(tipo)
		tempArrayTrebol = $arrayTrebol.select {|v| v.tipo == tipo}
		(tempArrayTrebol.sort! {|x, y| y.get_Calificacion <=> x.get_Calificacion})#.reverse!
	end

	#Desarrolle un método que muestre los datos del local de Sandwiches con la mayor calificación
	def get_SandwichesHighestRating
		reult =generate_ListRating("Sandwichería")
		puts "Local de Sandwiches con mayor calificación #{reult.first.nombreLocal } => #{reult.first.get_Calificacion } ."
	end

	#Desarrolle un método que muestre los datos del local de Pollería con la mayor calificación.
	def get_PolleriaHighestRating
		reult =generate_ListRating("Pollería")
		puts "Local de Pollería con mayor calificación #{reult.first.nombreLocal } => #{reult.first.get_Calificacion } ."
	end

	#Desarrolle un método que permita buscar un local por nombre
	def get_Local(nombreLocal)
		result = $arrayTrebol.detect {|e| e.nombreLocal == nombreLocal }   
		if result == nil
			puts "No encontrado"
		else
			puts "Local: #{result.nombreLocal}\nTipo: #{result.tipo}\nCalificación: #{result.get_Calificacion }"
		end
	end
 
end

instTrebolProcess = TrebolProcess.new()

 #instTrebolProcess.get_Locales  
 #instTrebolProcess.get_SandwichesHighestRating
 instTrebolProcess.get_Local("Local1")

 #Sandy I. Valdivia