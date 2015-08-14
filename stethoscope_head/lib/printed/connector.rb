class Connector < CrystalScad::Printed

	# The connector is the part where the stethoscope head exists and holds the tubing end in place. 
	# This part is configurable, so that the stethoscope can be build with different exists for different tubings.

	#	The default values are compatible with the Littmann stethoscope.


	# Usage:
	# With default options:
	# conn = Connector.new 
	# or with your custom options, like these:
	# conn = Connector.new({base_diameter:12.5,base_height:20})
	# 	
	# Don't forget to use the show method for output:
	# res = conn.show

	def initialize(args={})
		# I define "base" here as in the thickest part which sticks out from the stethoscope head 
		@base_diameter = args[:base_diameter] || 10.9
		@base_length = args[:base_length] || 21 # estimated
		
		# The inner diameter of the whole connector 
		@connector_inner_diameter = args[:connector_inner_diameter] || 4.0

		# The exit of the connector has a cone. I'm calling it exit diameter. 
		@connector_exit_diameter = args[:connector_exit_diameter] || 6.0
		# Length for the cone
		@connector_exit_cone_length = args[:connector_exit_diameter] || 2.0


		# Inner diameter of the tube that is being used
		@tube_inner_diameter = args[:tube_inner_diameter] || 7.5
		
		# Additional inner diameter for printing
		@tube_additional_inner_diameter = args[:tube_additional_inner_diameter] || 0

		# Length of the pushfit part
		@connector_length = args[:connector_length] || 20.3

		# Outside diameter of the connector		
		@connector_outside_diameter = args[:connector_outside_diameter] || @tube_inner_diameter + 0.5				


		# Connector type
		# 0 = littman type
		# 1 = cylindrical
		@connector_type = args[:connector_type] || 0

	end

	def part(show)
		# the "base" is the part that sticks deep into the stethoscope. 
		base = cylinder(d:@base_diameter,h:@base_length)

		# FIXME: the pushfit connector is currently hardcoded to the littmann tubing. 
		case @connector_type		
			when 0	
				connector = littmann_connector.translate(z:@base_length)
			when 1
				connector = cylindrical_connector.translate(z:@base_length)
		end

		# combine base and connector part
		res = base + connector

		# remove a cylinder over the whole length 
		res -= inside_cut

		return res
	end	

	def inside_cut
		cylinder(d: @connector_inner_diameter+@tube_additional_inner_diameter, h: @base_length + @connector_length + 0.02).translate(z:-0.01) # additional 0.01 margin on top & bottom for clean cut in OpenSCAD. 
	end

	# I'm trying to make the copy of the littmann_connector already as parametric as possible, although we will likely
	# need to replace it for a slightly easier one to make in a later step.
	def littmann_connector
		
		# As base, I'm doing a cylinder with diameter of 8mm (which is 0.5mm thicker than the flexible tube) as measured on the top two smallest parts
		res = cylinder(d: @connector_outside_diameter, h: @connector_length)

		# the bottom part, next to the actual base is 0.5mm thicker, calling it connector_thick_base
		@connector_thick_base_diameter = @connector_outside_diameter + 0.5
		@connector_thick_base_length = 5

		# Adding this extra bit to the output. 
		res += cylinder(d: @connector_thick_base_diameter, h: @connector_thick_base_length)

		# The three cones all have the same outside diameter, which is 9.5mm. I'll use the tube again for reference
		@cone_outside_diameter = @tube_inner_diameter + 2		

		# The two inner cones are both the same. They are 3.5mm in length and there's a 1.5mm spacing in between
		@cone_length = 3.5		
		@cone_spacing = 1.5

		# I'm adding the first two cones
		cones = cylinder(d1: @cone_outside_diameter, d2: @connector_outside_diameter, h: @cone_length)
		cones += cylinder(d1: @cone_outside_diameter, d2: @connector_outside_diameter, h: @cone_length).translate(z:@cone_length + @cone_spacing)
		
		# The upper cone is approximately 5.2mm long. 
		# I suspect this is different because the inside diameter goes larger in there		
		@upper_cone_length = 5.2

		# adding the upper cone
		cones += cylinder(d1: @cone_outside_diameter, d2: @connector_outside_diameter, h: @upper_cone_length).translate(z:(@cone_length + @cone_spacing)*2)
		

		# combining the cones with the rest of the connector
		res += cones.translate(z:@connector_thick_base_length)
		
			
		# There's a taper exit of the connector. 
		#	Note: I'm going to substract it here at this method, although the rest of the inner diameter is substracted in show
		connector_exit = cylinder(d1: @connector_inner_diameter, d2: @connector_exit_diameter, h: @connector_exit_cone_length)
		
		# In order to get a clean cut for the exit, I'm adding a small cylinder on top of the cone
		connector_exit += cylinder(d: @connector_exit_diameter, h:1).translate(z: @connector_exit_cone_length)

		# Now removing the exit cone
		res -= connector_exit.translate(z:@connector_length-@connector_exit_cone_length)		


		return res
	end
		
	# This is defined as connector type 1
	def cylindrical_connector
	
		# We're just using the @connector_outside_diameter as base here
		res = cylinder(d: @connector_outside_diameter, h: @connector_length)

		# This is copy+pasted from the littmann connector
		# There's a taper exit of the connector. 
		#	Note: I'm going to substract it here at this method, although the rest of the inner diameter is substracted in show
		connector_exit = cylinder(d1: @connector_inner_diameter, d2: @connector_exit_diameter, h: @connector_exit_cone_length)
		
		# In order to get a clean cut for the exit, I'm adding a small cylinder on top of the cone
		connector_exit += cylinder(d: @connector_exit_diameter, h:1).translate(z: @connector_exit_cone_length)

		# And we're removing the exit cone
		res -= connector_exit.translate(z:@connector_length-@connector_exit_cone_length)		

	end

end
