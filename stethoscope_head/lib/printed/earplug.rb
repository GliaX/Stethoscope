class Earplug < CrystalScad::Printed
	
	def initialize
		# maximum outer diameter of the bell
		@bell_outer_diameter = 12

		# cut the bell about this from the bottom:
		@opening_cut = 1
	
		# length and outer diameter of the cylinder that mounts onto the eartube
		# I'm making them longer than the littman ones in order to get a proper seal
		@cylinder_length = 18	# Length from the center of the bell
		@cylinder_outer_diameter = 9.5

		# inner diameter of the earpiece
		@inner_diameter = 5
		
		# inner diameter of the exit that sits towards the ear
		@exit_diameter = 6
		
		

	end

	def part(show)
		
		# starting off with the bell part that seals towards the ear
		res = sphere(d:@bell_outer_diameter).translate(z:@bell_outer_diameter / 2.0) # position on z=0
		
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
		res = cylinder(d:@inner_diameter, h:@cylinder_length + @bell_outer_diameter + 0.2)
		res += cylinder(d:@exit_diameter, h:@bell_outer_diameter + 0.2)
		res += sphere(d:@bell_outer_diameter-5).translate(z:@opening_cut+3)	
		
	end
	
end
