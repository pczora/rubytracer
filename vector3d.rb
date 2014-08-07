class Vector3D
	attr_accessor :x, :y, :z
	def initialize(coordX, coordY, coordZ) 
		@x = coordX
		@y = coordY
		@z = coordZ
	end

	def add(that) 
		Vector3D.new(@x + that.x, @y + that.y, @z + that.z)
	end

	def +(that)
		add(that)
	end

	def -(that)
		Vector3D.new(@x - that.x, @y - that.y, @z - that.z)
	end

	def dot_product(that)
		@x * that.x + @y * that.y + @z * that.z
	end

	def *(that)
		if (that.is_a? Vector3D)
			dot_product(that)
		else
			Vector3D.new(that * @x, that * @y, that * @z)
		end
	end

	def product(that)
		Vector3D.new(@y*that.z-@z*that.y, @z*that.x-@x*that.z, @x*that.y-@y*that.x)
	end


	def magnitude() 
		Math.sqrt(@x*@x + @y*@y + @z*@z)
	end
	
	def normalize()
		m = self.magnitude()
		Vector3D.new(@x / m, @y / m,  @z / m)	
	end

	def to_s()
		"Vector3D(" + @x.to_s + ", " + @y.to_s + ", " + @z.to_s + ")"
	end

end 