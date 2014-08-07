class RayMath
	def square(a)
		a*a
	end
end

class Tuple
	attr_accessor :first, :second
	def initialize(first, second)
		@first = first
		@second = second
	end

	def min 
		if @first < @second
			@first
		else
			@second
		end
	end

	def to_s
		"Tuple(" + @first.to_s + ", " + @second.to_s + ")"
	end
end