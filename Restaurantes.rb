#encoding: utf-8
class Tipo_Local
  SANDWICHERIA = "Sandwichería"
  POLLERIA = "Pollería"
end

class Local
	attr_accessor :nombre, :tipo
	attr_reader :cal_atencion, :cal_gusto, :cal_decoracion
	def initialize
		@cal_atencion = 0
		@cal_gusto = 0
		@cal_decoracion = 0
	end
	
	def cal_atencion=(cal_atencion)
		if cal_atencion < 1 || cal_atencion > 10 then
			puts "ERROR : La calificacion debe estar entre 1 y 10"
		else
			@cal_atencion = cal_atencion
		end	
	end
	
	def cal_gusto=(cal_gusto)
		if cal_gusto < 1 || cal_gusto > 10 then
			puts "ERROR : La calificacion debe estar entre 1 y 10"
		else
			@cal_gusto = cal_gusto
		end	
	end

	def cal_decoracion=(cal_decoracion)
		if cal_decoracion < 1 || cal_decoracion > 10 then
			puts "ERROR : La calificacion debe estar entre 1 y 10"
		else
			@cal_decoracion = cal_decoracion
		end	
	end

	def obtener_calificacion
		(cal_atencion*0.35 + cal_gusto*0.35 + cal_decoracion*0.30).round(2)
	end

	def obtener_resulta_calificacion
		if obtener_calificacion >= 8 then
			return "APROBADO"
		else
			return "DESAPROBADO"
		end
	end

	def to_s
		"Nombre #{nombre} --> Tipo #{tipo} --> P.Atencia #{cal_atencion} --> P.Sabor #{cal_gusto} --> P.Decoración #{cal_decoracion} --> calificacion #{obtener_calificacion} (#{obtener_resulta_calificacion})"
	end
end

class Encuestra
	attr_accessor :locales
	def initialize
		@locales = Array.new
	end
	
	def agregar_local(local)
		locales.push(local)
	end

	def mostrar_locales
		puts "#{"-"*25}---#{"-"*15}---#{"-"*15}"
		puts "#{"Nombre".ljust(25)} | #{"Puntaje".ljust(15)} | #{"Puntaje".ljust(15)}|"
		puts "#{"-"*25}---#{"-"*15}---#{"-"*15}"
		locales.each{ |l|
			puts "#{l.nombre.ljust(25)} | #{(l.obtener_calificacion).to_s.ljust(15)} | #{l.obtener_resulta_calificacion.ljust(15)}|"
		}
		puts "#{"-"*25}---#{"-"*15}---#{"-"*15}"
	end
	
	def mostrar_mayor_calificacion(tipo_local)
		puts "Local de #{tipo_local} mejor calificado"
		puts "#{"-"*25}---#{"-"*15}---#{"-"*15}---#{"-"*15}---#{"-"*15}"
		puts "#{"Nombre".ljust(25)} | #{"Atención".ljust(15)} | #{"Gusto/Sabor".ljust(15)}| #{"Decoración".ljust(15)}| #{"Puntaje".ljust(15)}|"
		puts "#{"-"*25}---#{"-"*15}---#{"-"*15}---#{"-"*15}---#{"-"*15}"
		local = obtener_mayor_calificacion(tipo_local)
		puts "#{local.nombre.ljust(25)} | #{local.cal_atencion.to_s.ljust(15)} | #{local.cal_gusto.to_s.ljust(15)}| #{local.cal_decoracion.to_s.ljust(15)}| #{local.obtener_calificacion.to_s.ljust(15)}|"
		puts "#{"-"*25}---#{"-"*15}---#{"-"*15}---#{"-"*15}---#{"-"*15}"
	end

	def mostrar_datos_local_por_nombre(nombre)
		local = obtener_local_por_nombre(nombre)
		if !local.nil? then
			puts local
		else
			puts "LOCAL NO ENCONTRADO!!:("
		end
	end

	private
	def obtener_mayor_calificacion(tipo_local)
		local = Local.new
		for i in 0...locales.count
			if locales[i].tipo == tipo_local && locales[i].obtener_calificacion >= local.obtener_calificacion then
				local = locales[i]
			end
		end
		return local
	end

	private
	def obtener_local_por_nombre(nombre)
		local = nil
		idx = 0
		while local.nil? && idx < locales.count
			if locales[idx].nombre == nombre then
				local = locales[idx]
			end
			idx += 1
		end
		return local
	end
end

def test
	encuesta = Encuestra.new
	local = Local.new
	local.nombre = "Pidelo con Rima"
	local.tipo = Tipo_Local::POLLERIA
	local.cal_gusto = 10
	local.cal_decoracion = 8
	local.cal_atencion = 10
	encuesta.agregar_local(local)

	local = Local.new
	local.nombre = "Pollo stock"
	local.tipo = Tipo_Local::POLLERIA
	local.cal_gusto = 9
	local.cal_decoracion = 8
	local.cal_atencion = 5
	encuesta.agregar_local(local)

	local = Local.new
	local.nombre = "Tía Venenos"
	local.tipo = Tipo_Local::POLLERIA
	local.cal_gusto = 10
	local.cal_decoracion = 10
	local.cal_atencion = 10
	encuesta.agregar_local(local)

	local = Local.new
	local.nombre = "Panchita"
	local.tipo = Tipo_Local::SANDWICHERIA
	local.cal_gusto = 8
	local.cal_decoracion = 8
	local.cal_atencion = 7
	encuesta.agregar_local(local)

	local = Local.new
	local.nombre = "Siete Colores"
	local.tipo = Tipo_Local::SANDWICHERIA
	local.cal_gusto = 7
	local.cal_decoracion = 6
	local.cal_atencion = 7
	encuesta.agregar_local(local)

	local = Local.new
	local.nombre = "Chespito"
	local.tipo = Tipo_Local::SANDWICHERIA
	local.cal_gusto = 8
	local.cal_decoracion = 8
	local.cal_atencion = 8
	encuesta.agregar_local(local)


	encuesta.mostrar_locales
	encuesta.mostrar_mayor_calificacion(Tipo_Local::POLLERIA)
	encuesta.mostrar_mayor_calificacion(Tipo_Local::SANDWICHERIA)
	encuesta.mostrar_datos_local_por_nombre("Pidelo con Rima")
end

test