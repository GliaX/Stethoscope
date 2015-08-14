class Earplug < CrystalScad::Printed
	
	def initialize(args={})
		# outer diameter of the bell
		@bell_outer_diameter = 12.25
		# its inner diameter		
		@inner_bell_diameter = @bell_outer_diameter-6

		# hull of the bell to make it longer	
		@bell_extra_height = 1

		# cut the bell about this from the bottom:
		@opening_cut = 1
	
		# length and outer diameter of the cylinder that mounts onto the eartube
		# I'm making them longer than the littman ones in order to get a proper seal
		@cylinder_length = args[:cylinder_length] || 20.5	# Length from the center of the bell
		@cylinder_outer_diameter = 9.5

		# inner diameter of the earpiece
		@inner_diameter = 5

		# inner diameter of the exit that sits towards the ear
		@exit_diameter = 6
		
		

	end

	def part(show)
		
		# starting off with the bell part that seals towards the ear
		
		res = hull(
			sphere(d:@bell_outer_diameter).translate(z:@bell_outer_diameter / 2.0),
			sphere(d:@bell_outer_diameter).translate(z:@bell_outer_diameter / 2.0+@bell_extra_height)
		)
		
		# I'm cutting the opening, the opening_cut value is estimated
		res -= cube([@bell_outer_diameter,@bell_outer_diameter,@opening_cut]).center_xy if show
		# putting the whole thing on z = 0 again
		res = res.translate(z:-@opening_cut)

		# Cylinder that interfaces with the earplugs

		res += cylinder(d:@cylinder_outer_diameter, h:@cylinder_length).translate(z:@bell_outer_diameter/2.0-@opening_cut)	
	
		res -= inner_cut.translate(z:-0.1) if show
		res
	end

	def inner_cut
		res = cylinder(d:@inner_diameter, h:@cylinder_length + @bell_outer_diameter + 0.2, fn:6)
		res += cylinder(d:@exit_diameter, h:@bell_outer_diameter + 0.2)
		res += sphere(d:@inner_bell_diameter).translate(z:@opening_cut+3)	
		
	end
	
end
