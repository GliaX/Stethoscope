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



	
		res.color("lightgrey")
	end

end	
