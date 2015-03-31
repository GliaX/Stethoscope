class Eartube < CrystalScad::Printed

	# Eartube is the part that goes from a Y to split up the channels from the tubing towards an earpiece 
	# that will be shaped with PCL for now
	def initialize
		# The tube length of the Littman version is about approximately 130mm until it gets joined with the
		# splitting part
		@tube_length = 155
		
		# Radius of the bent
		@bent_radius = 25
		
		# Angle of the bent, must be between or equal 90 and 180°
		@bent_angle = 125

		# Inner diameter of the Littmann version is about 3mm, I'm going for a slightly bigger inner diameter
		# here because of possible shrinkage and print imperfections
		@inner_diameter = 3.7

		# Outer diameter of the hexagonal outer diameter
		@outer_diameter = @inner_diameter + 3 
	end


	def part(show)
		res = outside_shape(@tube_length)
		res += bent(@bent_radius,@bent_angle)
	end

	def outside_shape(length)
		# hexagonal outside shape
		res = cylinder(d:@outer_diameter,h:length,	fn:6)
		# circular inner tube
		res -= cylinder(d:@inner_diameter,h:length+0.2).translate(z:-0.1)	
		# positioning it flat on surface		
		res.rotate(x:90)	
	end

	def bent(radius,angle)	
		unless angle >= 90 and angle <= 180		
			raise "the bent method only supports angles between 90 and 180 degrees"
		end

		# so in order to make the angle in a tube, I'm going to rotary extrude the outside shape...
		res = circle(d:@outer_diameter,fn:6).translate(x:radius).rotate_extrude(convexity:10)
		# and then rotary extrude the inner shape 
		res -= circle(d:@inner_diameter).translate(x:radius).rotate_extrude(convexity:10)
		# As a result, we have a hollow ring. I'm using a cube that I'll intersect with the part
		cut = cube([@outer_diameter*radius,@outer_diameter*radius,@outer_diameter*radius]).center_z
		# the previous cube would create a 90° angle. If it's bigger than 90°, I'll add another cube to it like the one
		# we used and rotate it along the Z axis by the angle, minus 90°
		if angle > 90
			cut += cube([@outer_diameter*radius,@outer_diameter*radius,@outer_diameter*radius]).center_z.rotate(z:angle-90)
		end
		# Finally we intersect the cut with the rotary extruded parts
		res *= cut
		
		# Positioning it on 0 
		res.translate(x:-radius)
	end

end
