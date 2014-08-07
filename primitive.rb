class Color
	attr_accessor :r, :g, :b

	def initialize(r, g, b) 
		@r = r
		@g = g
		@b = b
	end
end

class Material
	attr_accessor :color, :diffuse

	def initialize(color, diffuse)
		@color = color
		@diffuse = diffuse
	end
end

class Primitive
	attr_accessor :name, :shape, :material, :light

	def initialize(name, shape, material, light)
		@name = name
		@shape = shape
		@material = material
		@light = light
	end
end