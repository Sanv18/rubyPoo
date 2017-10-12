class Heron

	attr_accessor :a , :b , :c

	def initialize(a,b,c)
		@a = a
		@b = b
		@c = c

	end

	def semiperimetro
		((@a+@b+@c)/2).to_f
	end

	def formula
		Math.sqrt(semiperimetro*(semiperimetro-@a)*(semiperimetro-@b)*(semiperimetro-@c))
	end
end

heron1 = Heron.new(4,8,8)

puts heron1.semiperimetro
puts heron1.formula