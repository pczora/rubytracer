require_relative('vector3d')
require_relative('ray')
require_relative('raymath')


class Plane
	attr_accessor :n, :x
	def initialize(n, x)
		@n = n
		@x = x
	end

	def to_s
		"Plane(n: " + n.to_s + " x: " + x.to_s + ")"
	end

	def get_normal(pI)
		return @n
	end

	def intersect(ray)
		nd = @n * ray.direction

		if (nd == 0)
			return false
		else
			t = (@x - ray.origin) * n / nd
			if (t < 0)
				return false
			end

			return ray.point(t)
		end
	end
end

class Triangle
	attr_accessor :a, :b, :c
	def initialize(a, b, c)
		@a = a
		@b = b
		@c = c
	end

	def to_s
		"Triangle(a: " + @a.to_s + " b: " + @b.to_s + " c: " + @c.to_s + ")"
	end


	def get_normal(pI)
		n = (@b - @a).product(@c - @a)
		return n.normalize
	end

	def get_plane
		Plane.new(self.get_normal(0), @a)
	end

	def intersect(ray)
		plane_intersection = self.get_plane.intersect(ray)
		n = self.get_normal(0)
		if plane_intersection == false
			return false
		else
			c1 = (@b - @a).product(plane_intersection - @a) * n
			c2 = (@c - @b).product(plane_intersection - @b) * n
			c3 = (@a - @c).product(plane_intersection - @c) * n

			if (c1 >= 0 && c2 >= 0 && c3 >= 0)
				return plane_intersection
			else
				return false
			end
		end
	end
end


class Sphere
	attr_accessor :center, :radius
	def initialize(center, radius)
		@center = center
		@radius = radius
	end

	def to_s
		"Sphere(center: " + center.to_s + " radius:" + radius.to_s + ")"
	end

	def intersect(ray)
		dir = ray.direction
		origin = ray.origin

		d = (dir * (origin - @center)) * (dir * (origin - @center)) - ((origin - @center) * (origin - @center)) + (@radius * @radius)
		if (d <= 0)
			return false
		else
			root = Math.sqrt(d)
			t = Tuple.new((dir* -1) * (origin - @center) + root, (dir * -1) * (origin - @center) - root)
		    ray.origin + ray.direction * t.min
		end
	end

	def get_normal(point)
		(point - @center) * (1/@radius)
	end
end