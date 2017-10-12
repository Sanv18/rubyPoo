
class Animal
	attr_accessor :especie # Tipo de animal 
	def initialize(especie)
		@especie=especie				
	end	


end

class Mamifero < Animal 
	attr_accessor :id, :nombre, :sexo, :edad, :peso  

	def initialize(especie ,id,  nombre, sexo, edad, peso) 
		super(especie) 
		@id = id 		
		@nombre =  nombre 
		@sexo = sexo 
		@edad = edad 
		@peso = peso 
		
		# En caso el atributo base sea menor que cero, provocamos una excepción
		raise ArgumentError, "Ingrese la edad correcta del mamifero ", caller if edad < 0 
  		# En caso el atributo altura sea menor que cero, provocamos una excepción
		raise ArgumentError, "Argumento incorrecto para nombre, se espera valor para nombre ", caller if nombre == nil   		
	end	
end

class Reptil < Animal 
	attr_accessor :id, :nombre, :sexo, :edad, :tamaño 

	def initialize(especie ,id, nombre, sexo, edad, tamaño) 
		super(especie) 
		@id = id 		
		@nombre =  nombre 
		@sexo = sexo 
		@edad = edad 
		@tamaño = tamaño
		
		# En caso el atributo base sea menor que cero, provocamos una excepción
		raise ArgumentError, "Argumento incorrecto para mamifero se espera valor en su id ", caller if id == nil 
  		# En caso el atributo altura sea menor que cero, provocamos una excepción
		raise ArgumentError, "Argumento incorrecto para nombre, se espera valor para nombre ", caller if nombre == nil   		
	end	
end

class Aves < Animal 
	attr_accessor :id, :nombre, :sexo, :tipo 

	def initialize(especie, id, nombre, sexo, tipo)  
		super(especie) 
		@id = id 		
		@nombre =  nombre 
		@sexo = sexo 
		@tipo = tipo 
		
		# En caso el atributo base sea menor que cero, provocamos una excepción
		raise ArgumentError, "Argumento incorrecto para mamifero se espera valor en su id ", caller if id == nil 
  		# En caso el atributo altura sea menor que cero, provocamos una excepción
		raise ArgumentError, "Argumento incorrecto para nombre, se espera valor para nombre ", caller if nombre == nil   		
	end	
end

class Animalesfactory
	
	def self.crear(especie ,id,  nombre, sexo, edad, peso, tamaño, tipo)		
		case especie 
			when "mamifero"
				Mamifero.new(especie, id, nombre, sexo, edad, peso ) 
			when "reptil"
				Reptil.new(especie ,id, nombre, sexo, edad, tamaño)
			when "avez"
				Avez.new(especie, id, nombre, sexo, tipo) 
		end	
	end
end


class Administrador

	attr_accessor :animales, :correlativo 

	#aplicando singleton 
	def self.obtener_administrador
		@instancia ||= Administrador.new
	end


	def nombre_amigable
		'Zoologico'
	end

	def agregar_animal(especie ,id,  nombre, sexo, edad, peso, tamaño, tipo) 
		animales.push Animalesfactory.crear(especie ,id,  nombre, sexo, edad, peso, tamaño, tipo)
	end

	def eliminar_animal(id) 
		#animales.push Animalesfactory.crear(especie ,id,  nombre, sexo, edad, peso, tamaño, tipo)
		animales.delete_if {|elemento| elemento.id == id} 
	end

	def calcular_gasto(especie) 
		case especie 
		when 'mamifero'
		when 'reptil'
		when 'avez'
		end 

	end 

	def cantidad_animales
		animales.size 
	end

	def mostrar_animales 
		animales.map{ |animalito| " #{animalito.id}  #{animalito.especie} #{animalito.nombre}  "} 
	end 

	

	def initialize
		@animales = Array.new  
		@correlativo = 0 
	end

end

class AdministradorView

	def presentar(administrador)
		puts "#{administrador.nombre_amigable}: La Cantidad de animales = #{administrador.cantidad_animales}"
		puts  administrador.mostrar_animales

	end
end

class AdministradorController

	def initialize 
		@administradormodel=Administrador.obtener_administrador

		@administradorview=AdministradorView.new
	end

	def adicionar( especie ,id,  nombre, sexo, edad, peso, tamaño, tipo )
		@administradormodel.agregar_animal(especie ,id,  nombre, sexo, edad, peso, tamaño, tipo)
	end	
	
	def eliminar( indice) 
		@administradormodel.eliminar_animal(indice) 
	end	

	def procesar
		@administradorview.presentar(@administradormodel)
	end	

end

begin
zoologico = AdministradorController.new 
zoologico.adicionar('mamifero' ,1,  'lobo', 'M', 1, 5, 0.5, '' )
zoologico.adicionar('mamifero' ,2,  'firulais', 'M', 1, 5, 0.5, '' )
zoologico.adicionar('mamifero' ,3,  'Osito', 'M', 1, 5, 0.5, '' )

zoologico.procesar 
zoologico.eliminar(3)
zoologico.procesar 
rescue Exception => ex
	puts "#{ex.class}: #{ex.message}"
end