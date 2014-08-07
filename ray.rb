require_relative('vector3d')

class Ray
	attr_accessor :origin, :direction

	def initialize(origin, direction)
		@origin = origin
		@direction = direction
	end

	def to_s
		"Ray(" + @origin.to_s + ", " + @direction.to_s + ")"
	end

	def point(t)
		@origin + (@direction * t)
	end
end