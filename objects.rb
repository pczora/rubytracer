WIDTH = 1280
HEIGHT = 960

a = Vector3D.new(-1, -1, -10)
s1 = Sphere.new(a, 1)

pS1 = Primitive.new("sphere1", s1, Material.new(Color.new(255, 255, 255), 1.0), false)
pS2 = Primitive.new("sphere2", Sphere.new(Vector3D.new(-2, -2, -10), 1), Material.new(Color.new(255, 0, 255), 0.5), false)
pS3 = Primitive.new("sphere3", Sphere.new(Vector3D.new(-2, -2, -20), 1), Material.new(Color.new(255, 255, 255), 0.5), false)

pT1 = Primitive.new("triangle1", Triangle.new(Vector3D.new(1,0,-10), Vector3D.new(0, 3, -7), Vector3D.new(-3, 3, -7)), Material.new(Color.new(0, 255, 0), 1,), false)

pL1 = Primitive.new("light1", Sphere.new(Vector3D.new(-5, 9, -5), 0.3), Material.new(Color.new(0, 0, 255), 1.0), true)
pL2 = Primitive.new("light2", Sphere.new(Vector3D.new(5, -9, -15), 0.2), Material.new(Color.new(255, 255, 0), 1.0), true)
pL3 = Primitive.new("light3", Sphere.new(Vector3D.new(10, 0, -10), 0.3), Material.new(Color.new(128, 128, 128), 1.0), true)
pL4 = Primitive.new("light4", Sphere.new(Vector3D.new(-4, -5, -9), 1), Material.new(Color.new(255, 0, 0), 1.0), true)
#pL5 = Primitive.new("light5", Sphere.new(Vector3D.new(0,0,-5), 1), Material.new(Color.new(255, 255, 255), 1.0), true)

#pP1 = Primitive.new("plane1", Plane.new(Vector3D.new(0, 0, -1), Vector3D.new(0, 0, -15)), Material.new(Color.new(255,0,0), 1.0), false)

Objects = [pS1, pS2, pS3, pL1, pL2, pL3, pL4, pT1]