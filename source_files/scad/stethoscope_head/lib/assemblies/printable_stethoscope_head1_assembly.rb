class PrintableStethoscopeHead1Assembly < CrystalScad::Assembly

	#	This is the first printable prototype of the stethoscope head	
	
	def part(show)
		# I'm using most of the Littmann head, but I want to cut everything on top of the connector
		
		# Defining the connector parameters here, overriding the standards of StethoscopeHead
		@connector = Connector.new(tube_additional_inner_diameter:0.3,
														   base_length:20,	
															 connector_type: 1,
															 connector_outside_diameter:8.5,
															 connector_inner_diameter:5,
															 connector_exit_diameter:6.5
				)

		# initialize the Stethoscope Head
		head = StethoscopeHead.new(hole_additional_diameter: 0.73+3,
															 connector:@connector,												 
															 connector_height:13.5

					)

		# For that, I'm making a large centered (in x/y) cube with the height of the tube at 17.8mm
		@height = 17.8		
		res = cube([100,100,@height]).center_xy
		
		# I'll interesct the Littmann head's outside shape from the cube
		res *= head.outside_shape # see stethoscope_head.rb under lib/printed/
	
		# since I'm going to flip it around later to print it, I'm going to add a lot of material in order to make it printable with minimal support
		res += cylinder(d:42,h:@height)

		res -= head.inside_cut

		# I want the top to be on the bottom for printing, so I'm mirroring it in z direction and translate it by the height
		res = res.mirror(z:1).translate(z:@height)
	
		# since the hole in the middle on the littmann model goes all the way through and I don't want that,
		# I'll close that by adding a small cylinder 
		res += cylinder(d: 10, h: 1.7)		
		
		return res
	end

end
