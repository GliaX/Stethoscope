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
		@base_height = args[:base_height] || 21 # estimated
		
		# The inner diameter of the whole connector 
		@connector_inner_diameter = args[:connector_inner_diameter] || 4.0

		# The exit of the connector has a cone. I'm calling it exit diameter. 
		@connector_exit_diameter = args[:connector_exit_diameter] || 6.0
		# Length for the cone
		@connector_exit_cone_length = args[:connector_exit_diameter] || 2.0


		# Inner diameter of the tube that is being used
		@tube_inner_diameter = args[:tube_inner_diameter]

		# TODO: I don't have the tubing at hand right now, I'm in need of the inner diameter in order to make a proper connector. 
			

	end

	def show
		res = cylinder(d:@base_diameter,h:@base_height)
	end	
		
end
