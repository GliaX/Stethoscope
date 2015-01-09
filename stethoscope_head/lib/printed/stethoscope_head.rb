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

		# I've taken the measurements from the hole in 0.5mm increments.
		increment_distance = 0.5

		# the first 4 measurements were -0.65, -0.8, -1.03, -0.99, but those are useless because that's the result of the dial gauge pin going into the hole
		# I'm setting them to 0.
		measurements = [0, 0, 0, 0, 0, 0.16, 0.46, 0.72, 0.85, 0.93, 0.96, 0.99, 1.02, 1.05, 1.085, 1.12, 1.15, 1.18, 1.215, 1.2475, 1.278, 1.308, 1.34, 1.372, 1.401, 1.432, 1.465, 1.5, 1.529, 1.559, 1.5925, 1.63, 1.659, 1.69, 1.7225, 1.76, 1.7875, 1.811, 1.849, 1.88, 1.91, 1.94, 1.9725, 2.005, 2.035, 2.065, 2.1, 2.134, 2.1675, 2.199, 2.23, 2.2625, 2.291, 2.32, 2.3575, 2.39, 2.42, 2.45, 2.48, 2.518, 2.5475, 2.5775, 2.6125, 2.6475, 2.68, 2.735]			

	
		# I need to convert the measurements into 2d coordinates now, putting them into the new array "points"
		points = []
		measurements.each_with_index do |m,i|
			points << [i*increment_distance / 2.0 , m] 
		end
		
		# we need to add one more point to the polygon in order to get it filled, so we can substract it later.
		points << [0,measurements.last]
		
		# create our 2d template of the cone and rotate it to the correct rotation		
		cone_template = polygon(points:points).rotate(x:90)  
		
		# now we need to rotate extude the template we've got in order to get cone, which we can substract
		cone = cone_template.rotate_extrude(convexity:10)
		
		# we need to mirror the cone as it goes in the wrong direction, translating it to 0
		cone = cone.mirror(z:1).translate(z:measurements.last)
	
		res -= cone.translate(z:valley_z+0.4) # TODO: check warum 0.4
#		res += cylinder(d:31,h:10).translate(z:5)
	

		# FIXME: so at the moment I see two problems:
		# 1. there seem to be a measurement error, or the "2mm increments" on my lathe are not 2mm. There could be some measurement errors involved because it has a bit of play whenever is goes in the other directoin. 
		# 2. the measurement resolution must be higher towards the center 
		

		# Second measurement notes:
		# - tip of the dial gauge cannot measure until the edge of the inner diaphram ring
		# from inner ring I can only estimate the precise point from the edge. Let's try to define the center and enter all raw values
		# 0.05mm steps now, trying to start at dead center
#		measurements = [6.64,6.49,6.26,6.3,7.29,7.45,7.75,8.01,8.14,8.22,8.25,8.28,8.31,8.34,8.375,8.41,8.44,8.47,8.505,8.5375,8.568,8.598,8.63,8.662,8.691,8.722,8.755,8.79,8.819,8.849,8.8825,8.92,8.949,8.98,9.0125,9.05,9.0775,9.101,9.139,9.17,9.20,9.23,9.2625,9.295,9.325,9.355,9.39,9.424,9.4575,9.489,9.52,9.5525,9.581,9.61,9.6475,9.68,9.71,9.74,9.77,9.808,9.8375,9.8675,9.9025,9.9375,9.97,10.025]

	
	
		res#.color("lightgrey")
	end

end	
