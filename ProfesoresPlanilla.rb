
class Profesor 
	attr_accessor :dni, :nombre, :tarifa, :valorEncuesta

	def initialize(dni, nombre, tarifa, valorEncuesta)
		@dni = dni
		@nombre = nombre
		@tarifa = tarifa  
	end

	def agregar_encuesta(valorEncuesta)
			@valorEncuesta = valorEncuesta
	end

	def obtener_bonificacion
		
		if valorEncuesta > 8.5
			@tarifa * 0.20   
		end
	end
end
 
class Universidad

 	attr_accessor :profesores

 	def initialize()

 		@profesores = Array.new() 
		instProfesor1 = Profesor.new(72949875, "Abel", 5000, 10)
		instProfesor2 = Profesor.new(85412057, "Jose", 1544,0)
		instProfesor3 = Profesor.new(12547896, "Andy", 2000,0)
		instProfesor4 = Profesor.new(36547852, "Pedro", 3000, 7) 
		agregar_profesores(instProfesor1)
		agregar_profesores(instProfesor2)
		agregar_profesores(instProfesor3)
		agregar_profesores(instProfesor4)
 	end

 	def agregar_profesores(profesor)

 		@profesores << profesor
 	end

	#Calcular la planilla de todos los profesores registrados para un año y mes determinado.
	def calcular_planilla_mensual(cantMeses)
		sumaSueldo = 0
		profesores.each{ |x|  sumaSueldo +=  x.tarifa  + x.obtener_bonificacion}
		suedoTotal = sumaSueldo * cantMeses
		puts "Planilla de todos los profesores por #{cantMeses} meses es: #{suedoTotal}" 
	end

	#Dado un número de DNI obtener el valor del sueldo del profesor
	def buscar_profesor(dni)
		profesor = nil
		profesores.each{ |i| (i.dni == dni) ? profesor = i : nil}

		puts "La tarifa del profesor #{profesor.nombre} es: #{profesor.tarifa} y su bonificación es: #{profesor.obtener_bonificacion}"
	end
end

instUniversidad = Universidad.new()
#instUniversidad.calcular_planilla_mensual(12)
#instUniversidad.calcular_planilla_mensual(5)
instUniversidad.buscar_profesor(72949875) 