require 'chunky_png'

class Color
	attr_accessor :r, :g, :b
	def initialize(r, g, b) 
		@r = r
		@g = g
		@b = b
	end
end

class Image
	attr_accessor :w, :h

	def initialize(w, h)
		@w = w
		@h = h
		@png = ChunkyPNG::Image.new(@w, @h, ChunkyPNG::Color::BLACK)
	end

	def put_pixel(x, y, col)
		@png[x, y] = ChunkyPNG::Color.rgb((col.r*255).to_i, (col.g*255).to_i, (col.b*255).to_i)
	end

	def save(filename)
		@png.save(filename, :interlace => true)
	end
end