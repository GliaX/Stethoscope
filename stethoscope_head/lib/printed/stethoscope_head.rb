class StethoscopeHead < CrystalScad::Printed
	def initialize()
	end

	def show
		# Dimensions of the Littmann Head 
	


		# 1. Outside dimensions, not including inner dimensions nor tubing exit

		@z = 0
	
		# I'm defining the big part of the head as bottom (stage 1) here
		res = cylinder(d: 43.43, h: stage1 = 1.08)
		@z = stage1

		# The second stage is the lip where the silicone ring of the diaphragm fits into 
		res += cylinder(d: 42, h: stage2 = 1.06).translate(z:@z)
		
		@z += stage2				
		# The third stage above the silicone ring of the diaphragm. This measures 1mm thick, but goes taper at some point. I cannot measure this precisely, so this might be actually thinner on the real model
		res += cylinder(d: 44.3, h: stage3 = 0.8).translate(z:@z) 
						
		@z += stage3				
		# At stage 4, the head gets much thinner. I estimated the thinnest point at about 7.5mm from bottom 
		res += cylinder(d1: 44.3, d2: 16.95, h: stage4 = 7.5 - @z).translate(z:@z) 
		
		# FIXME: this actually has two angles.

	
		res.color("lightgrey")
	end

end	
