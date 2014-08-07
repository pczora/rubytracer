require_relative 'vector3d'
require_relative 'shapes'
require_relative 'primitive'
require_relative 'image'

require_relative 'objects' # objects.rb defines size of the image, the objects and lights we want to render

def getRay(u, v)
	width = WIDTH 
	height = HEIGHT

	fovX = Math::PI / 4
	fovY = (HEIGHT.to_f / WIDTH) * fovX
	x = ((2 * u - WIDTH).to_f / WIDTH) * Math.tan(fovX)
	y = ((2 * v - HEIGHT).to_f / HEIGHT) * Math.tan(fovY)
	Ray.new(Vector3D.new(0,0,0), Vector3D.new(x, y, -1).normalize) #Camera at (0,0,0); image plane at (0,0,-1)
end


img = Image.new(WIDTH, HEIGHT)

for u in 0...WIDTH do
	for v in 0...HEIGHT do
		ray = getRay(u, v)
		Objects.each do |object|		
			if ((pI = object.shape.intersect(ray)) != false)

				col = Color.new(0, 0, 0)

				if !object.light
					Objects.each do |o| #Check for lights!
						if o.light
							l = (o.shape.center - pI).normalize
							n = object.shape.get_normal(pI)
							if object.material.diffuse > 0
								dot = n.dot_product(l)
								if (dot > 0)
									diff = dot * object.material.diffuse
									col.r += diff * object.material.color.r / 255 * o.material.color.r / 255
									col.g += diff * object.material.color.g / 255 * o.material.color.g / 255
									col.b += diff * object.material.color.b / 255 * o.material.color.b / 255

								end
							end
						end
					end					
				else # object IS a light source	(we don't draw them by now)			
					col.r = object.material.color.r / 255
					col.g = object.material.color.g / 255
					col.b = object.material.color.b / 255						
				end
				img.put_pixel(u, v, col)
			end
		end
	end
end

img.save('filename.png')
