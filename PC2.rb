

module Tarifa_Derecho_Revision
	attr_accessor :tarifa_derecho_revision
end

class Vehiculo

	attr_accessor :dniConductor, :numeroPlaca,	:marca,	:modelo,	:anioFabricación, :tipoMotor
	attr_accessor :calificacion_sistema_direccion, :calificacion_sistema_freno, :calificacion_emision_gases, :calificacion_emision_sonora

	def initialize(dniConductor, numeroPlaca, marca, modelo,	anioFabricación, tipoMotor)
		@dniConductor= dniConductor
		@numeroPlaca = numeroPlaca
		@marca = marca
		@modelo = modelo
		@anioFabricación = anioFabricación
		@tipoMotor = tipoMotor

		@calificacion_sistema_direccion = 0
		@calificacion_sistema_freno = 0
		@calificacion_emision_gases = 0
		@calificacion_emision_sonora = 0
	end

	def verificar_tipo_motor?
		(tipoMotor == "diesel" || tipoMotor == "gasolina")
	end

	def agregar_calificacion_sistema_direccion(calificacion_sistema_direccion)
		calificacion_sistema_direccion = validar_calificacion(calificacion_sistema_direccion) ? calificacion_sistema_direccion : 0
	end
	def agregar_calificacion_sistema_freno(calificacion_sistema_freno)
		calificacion_sistema_freno = validar_calificacion(calificacion_sistema_freno) ? calificacion_sistema_freno : 0
	end
	def agregar_calificacion_emision_gases(calificacion_emision_gases)
		calificacion_emision_gases = validar_calificacion(calificacion_emision_gases) ? calificacion_emision_gases : 0
	end
	def agregar_calificacion_sistema_sonora(calificacion_emision_sonora)
		calificacion_emision_sonora = validar_calificacion(calificacion_emision_sonora) ? calificacion_emision_sonora : 0
	end

	def validar_calificacion(calificacion)
		calificacion >= 0 && calificacion <= 4
	end

	def validar_estado_vehiculo
		
	end

	def validar_estado_vehiculo
		if calcular_calificacion_general >= 14
			"APROBADO"
		elsif calcular_calificacion_general == 12 || calcular_calificacion_general == 13
			"OBSERVADO"
		else
			"DESAPROBADO"
		end
	end

	def calcular_calificacion_general(adicional = 0)
		((4 *(calificacion_sistema_direccion*2 +	calificacion_sistema_freno*3 +	calificacion_emision_gases*10+	calificacion_emision_sonora*5))/2+3+10+5)+ adicional
	end
end

class Moto < Vehiculo

	attr_accessor :calificacion_vibracion
	include Tarifa_Derecho_Revision 

	def initialize(dniConductor, numeroPlaca, marca, modelo,	anioFabricación, tipoMotor)
		super(dniConductor, numeroPlaca, marca, modelo,	anioFabricación, tipoMotor) 
		@calificacion_vibracion = 0
	end

	def agregar_calificacion_vibracion(calificacion_vibracion)
		calificacion_vibracion = validar_calificacion(calificacion_vibracion) ? calificacion_vibracion : 0
	end


	def calcular_calificacion_general()
		super( calificacion_vibracion)
	end
end

class Ligero < Vehiculo

	attr_accessor :calificacion_luces
	include Tarifa_Derecho_Revision 

	def initialize(dniConductor, numeroPlaca, marca, modelo,	anioFabricación, tipoMotor)
		super(dniConductor, numeroPlaca, marca, modelo,	anioFabricación, tipoMotor) 
		@calificacion_luces = 0
	end

	def agregar_calificacion_luces(calificacion_luces)
		calificacion_luces = validar_calificacion(calificacion_luces) ? calificacion_luces : 0
	end

	def calcular_calificacion_general()
		super( calificacion_luces)
	end
end

class Pesado < Vehiculo

	attr_accessor :calificacion_suspesion
	include Tarifa_Derecho_Revision 

	def initialize(dniConductor, numeroPlaca, marca, modelo,	anioFabricación, tipoMotor)
		super(dniConductor, numeroPlaca, marca, modelo,	anioFabricación, tipoMotor) 
		@calificacion_suspesion = 0
	end

	def agregar_calificacion_suspesion(calificacion_suspesion)
		calificacion_suspesion = validar_calificacion(calificacion_suspesion) ? calificacion_suspesion : 0
	end
	
	def calcular_calificacion_general()
		super( calificacion_suspesion)
	end
end

class Revision
	attr_accessor :vehiculo, :informacion

	def initialize(vehiculo, informacion)
		@vehiculo = vehiculo
		@informacion = informacion
	end
end

class Talleres

	attr_accessor :revisiones

	def initialize()
		@revisiones  = Array.new()
	end

	def agregar_revision(revision)
		@revisiones << revision
	end

	def listar_vehiculos
		puts "--------------------------------------------------------------------------------------------------------------------------------"
		puts "|														LISTADO DE VEHÍCULOS 													   |" 
		
		puts "--------------------------------------------------------------------------------------------------------------------------------"
		puts "| DNI Conductor | número de Placa | Marca  | Modelo | año de Fabricación | Tipo deMotor | Tarifa Pagada | Calificación Final"
		puts "--------------------------------------------------------------------------------------------------------------------------------"

		revisiones.each{ |x|  puts "| #{x.vehiculo.dniConductor} 		| 	#{x.vehiculo.numeroPlaca}		  | #{x.vehiculo.marca} | #{x.vehiculo.modelo}	| #{x.vehiculo.anioFabricación} 				 | #{x.vehiculo.tipoMotor}  		| #{x.vehiculo.tarifa_derecho_revision}				| #{x.vehiculo.calcular_calificacion_general}	 " }

		
		puts "--------------------------------------------------------------------------------------------------------------------------------"
		puts
		puts		
	end

	def buscar_vehiculo(placa)

		instvehiculo = nil
		for i in 0...revisiones.size
			if revisiones[i].vehiculo.numeroPlaca == placa
				instvehiculo = revisiones[i]
				break
			end
		end

		if instvehiculo == nil
			puts "No se ha encontrado el vehículo con la placa: #{placa}"
		else
			puts "--------------------------------------------------------------------------------------------------------------------------------"
			puts "|														LISTADO DE VEHÍCULOS 													   |" 
			
			puts "--------------------------------------------------------------------------------------------------------------------------------"
			puts "| DNI Conductor | número de Placa | Marca  | Modelo | año de Fabricación | Tipo deMotor | Tarifa Pagada | Calificación Final"
			puts "--------------------------------------------------------------------------------------------------------------------------------"

			puts "| #{instvehiculo.vehiculo.dniConductor} 		| 	#{instvehiculo.vehiculo.numeroPlaca}		  | #{instvehiculo.vehiculo.marca} | #{instvehiculo.vehiculo.modelo}	| #{instvehiculo.vehiculo.anioFabricación} 				 | #{instvehiculo.vehiculo.tipoMotor}  		| #{instvehiculo.vehiculo.tarifa_derecho_revision}				| #{instvehiculo.vehiculo.calcular_calificacion_general}	 " 

			
			puts "--------------------------------------------------------------------------------------------------------------------------------"
			puts
			puts	
		end
	end

	def mostrar_total_recaudado
		sumaMonto2 = revisiones.map{ |revisione| revisione.vehiculo.calcular_calificacion_general }.reduce(0, :+)

		puts "El monto recaudado es #{sumaMonto2}"
	end
end

#CREAMOS INSTANCIAS DE LOS VEHÍCULOS
instMoto = Moto.new(72949875, "GD-25", "Toyota", "Yaris", 2000, "diesel")
instMoto.agregar_calificacion_sistema_direccion(4)
instMoto.agregar_calificacion_sistema_freno(1)
instMoto.agregar_calificacion_emision_gases(4)
instMoto.agregar_calificacion_sistema_sonora(4)
instMoto.agregar_calificacion_vibracion(4)
 
instLigero = Ligero.new(12949800, "YO-05", "Toyota", "Yaris", 1995, "diesel")
instLigero.agregar_calificacion_sistema_direccion(4)
instLigero.agregar_calificacion_sistema_freno(0)
instLigero.agregar_calificacion_emision_gases(2)
instLigero.agregar_calificacion_sistema_sonora(3)
instLigero.agregar_calificacion_luces(4)

instPesado = Pesado.new(95487124, "KP-45", "Toyota", "Yaris", 1999, "diesel")
instPesado.agregar_calificacion_sistema_direccion(40)
instPesado.agregar_calificacion_sistema_freno(2)
instPesado.agregar_calificacion_emision_gases(3)
instPesado.agregar_calificacion_sistema_sonora(33)
instPesado.agregar_calificacion_suspesion(4)


#CREAMOS INSTANCIA DE TALLER Y AGREGAMOS LA REVISION CON LOS VEHICULOS A REVISAR
instTalleres = Talleres.new
instTalleres.agregar_revision(Revision.new(instMoto, "Revisiones Técnicas"))
instTalleres.agregar_revision(Revision.new(instLigero, "Revisiones Técnicas"))
instTalleres.agregar_revision(Revision.new(instPesado, "Revisiones Técnicas"))
instTalleres.listar_vehiculos
instTalleres.buscar_vehiculo("KP-45")
instTalleres.mostrar_total_recaudado
