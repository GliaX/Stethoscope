class Earplug < CrystalScad::Printed
	
	def initialize
		# maximum outer diameter of the bell
		@bell_outer_diameter = 12
		# length and outer diameter of the cylinder that mounts onto the eartube
		# I'm making them longer than the littman ones in order to get a proper seal
		@cylinder_length = 18	# Length from the center of the bell
		@cylinder_outer_diameter = 9.5
		
	end

	def part(show)
		
		# starting off with the bell part that seals towards the ear
		res = sphere(d:@bell_outer_diameter).translate(z:@bell_outer_diameter / 2.0) # position on z=0
		
		# I'm cutting the opening, the opening_cut value is estimated
		res -= cube([@bell_outer_diameter,@bell_outer_diameter,@opening_cut=1]).center_xy
		# putting the whole thing on z = 0 again
		res = res.translate(z:-@opening_cut)

		# Cylinder that interfaces with the earplugs

		res += cylinder(d:@cylinder_outer_diameter, h:@cylinder_length).translate(z:@bell_outer_diameter/2.0-@opening_cut)	

	end
	
end
