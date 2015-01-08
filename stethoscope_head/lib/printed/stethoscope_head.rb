class StethoscopeHead < CrystalScad::Printed
	def initialize()
	end

	def show
		# Dimensions of the Littmann Head 
		#
		# 1. Outside dimensions, not including inner dimensions nor tubing exit
	  #	

		@z = 0
	
		# I'm defining the big part of the head as bottom (stage 1) here
		res = cylinder(d: 43.43, h: stage1 = 1.08)
		@z = stage1

		# The second stage is the lip where the silicone ring of the diaphragm fits into 
		res += cylinder(d: 42, h: stage2 = 1.06).translate(z:@z)
		
		@z += stage2				
		# The third stage above the silicone ring of the diaphragm. This measures 1mm thick, but goes taper at some point. I cannot measure this precisely, so this might be actually thinner on the real model
		res += cylinder(d: current_diameter = 44.3 , h: stage3 = 0.8).translate(z:@z) 
						
		@z += stage3				

		# I missed this angle earlier 
		res += cylinder(d1: current_diameter, d2: current_diameter=21, h: stage4 = 6.2 - @z).translate(z:@z) 
		@z += stage4

		# At stage 5, the head gets much thinner. I estimated the thinnest point at about 7.5mm from bottom 
		res += cylinder(d1: current_diameter, d2: current_diameter = 16.95, h: stage5 = 7.5 - @z).translate(z:@z) 
		@z += stage5
		

		# Going up to the smaller funnel 
		res += cylinder(d1: current_diameter, d2: current_diameter = 27, h: stage6 = 21 - @z).translate(z:@z) 
		@z += stage6
	
		# More upwards
		res += cylinder(d1: current_diameter, d2: current_diameter = 32.75, h: stage7 = 25 - @z).translate(z:@z) 
		@z += stage7
		
		# The upper silicone ring lip (note: diameter is estimated as I'm unable to measure it exactly)
		res += cylinder(d: 31, h: stage8 = 25.8 - @z).translate(z:@z) 
		@z += stage8
		
		# top
		res += cylinder(d: 34.43, h: stage9 = 27.22 - @z).translate(z:@z) 
		@z += stage9
		

		#
		# 2. Inside dimensions, minus the tube exit
	  #	
		
		# hole in the middle
		res -= cylinder(d:3.15, h: @z+0.02).translate(z:-0.01) # note: all cuts are made with 0.01mm offset so they won't overlap with solid surfaces on preview

		inner_shape_diameter = 33.4

		# the inner ring where the diaphram can sit on when pressed firmly 	
		res -= cylinder(d:35.7,z:0.2+0.01).translate(z:-0.01)		
		
		# The valley between the inner diaphram ring and the outer rim	
		valley_z = 0.56
		valley = cylinder(d:40.9,h:valley_z+0.01)
		valley -= cylinder(d:35.7,h:valley_z+0.03).translate(z:-0.01)
		res -= valley.translate(z:-0.01)

		# I've taken the measurements from the hole in 2mm increments. 
		# the last one I have taken had value of 1.555, but it was less than 2mm. This has to be re-measured more precisely
		measurements = [0.0,0.105,0.24,0.35,0.47,0.60,0.71,0.835,0.966,1.09,1.29,1.33,1.455]
		
		# I need to convert the measurements into 2d coordinates now, putting them into the new array "points"
		points = []
		measurements.reverse.each_with_index do |m,i|
			points << [i*2,m] # 2 was the increments I have in my measurements
		end
		
    # in order to get a triangle, add 0,0 as the base point
		points << [0,0] 
		
		# create our 2d template of the cone and rotate it to the correct rotation		
		cone_template = polygon(points:points).rotate(x:90)  
		
		# now we need to rotate extude the template we've got in order to get cone, which we can substract
		cone = cone_template.rotate_extrude(convexity:10)

		res -= cone.translate(z:valley_z)
		
		# FIXME: so at the moment I see two problems:
		# 1. there seem to be a measurement error, or the "2mm increments" on my lathe are not 2mm. There could be some measurement errors involved because it has a bit of play whenever is goes in the other directoin. 
		# 2. the measurement resolution must be higher towards the center 
		



	
		res.color("lightgrey")
	end

end	
