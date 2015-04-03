class EarplugMold < CrystalScad::Printed
	
	# This is a proof of concept.
	def initialize
		# Set the amount of earplug molds this file produces in a grid here:
		@grid_x = 4
		@grid_y = 2

		@bottom_height = 7
		@top_height = 18.5-0.1


		# The dimensions of each mold are currently hardcoded
		@x = 5 + @grid_x * 15
		@y = 5 + @grid_y * 15
		# The @coords array represents the center of each mold 		
		@coords = []
		# Bolt coordinates for holding it together
		@bolt_coords = []
		@grid_x.times do |x|
			@grid_y.times do |y|
				@coords << {x:10+x*15, y:10+y*15}				
				if x > 0 and x < @grid_x.size and y > 0 and y < @grid_y.size 
					@bolt_coords << {x:2.5+x*15, y:2.5+y*15} 				
				end
			end		
		end
		
	end
	
	def part(show)
		earplug = Earplug.new


		bottom_part = cube([@x,@y,@bottom_height])
		top_part = cube([@x,@y,@top_height]).translate(z:@bottom_height)

		# Placing of the molds
		@coords.each do |coord|
		  # I've set the bottom part here to have both the cutout of the earplug bell
			# and then the inner cut, which will hopefully not break. If it does, I will replace the big
			# shaft by a screw. 
			bottom_part -= earplug.output.translate(coord).translate(z:1)
			bottom_part += earplug.inner_cut.translate(coord).translate(z:-1)

			top_part -= earplug.output.translate(coord).translate(z:1)		
		end
		# since the inner_cuts I added to the bottom part are sticking out, I'll cut them by
		# subtracting a box that's as high as the bottom part right below it.
		bottom_part -= cube([@x,@y,@bottom_height]).translate(z:-@bottom_height)


		# Adding color before adding bolts to output
		if show
			bottom_part = bottom_part.color("cyan")
			top_part = top_part.color("lightgreen")
		end
		
		# Placing of the Bolts to hold the parts together
		@bolt_coords.each do |coord|
			b = Bolt.new(3,25)
			n = Nut.new(3)			
			bottom_part -= b.output.translate(coord)
			bottom_part -= n.output.translate(coord)
			top_part -= b.output.translate(coord)

			if show
				bottom_part += b.show.translate(coord).mirror(z:1).translate(z:@bottom_height + @top_height) 
				bottom_part += n.show.translate(coord)
			else
				# The holes above the nut cutouts will need a tiny bit of plastic in order to print nicely
				# FIXME: This support structure will work nicely on 0.2mm layer height, but might 
				# 			 not on others
				bottom_part += cylinder(d:3.5,h:2.1).translate(coord)
			end	
		end
	
		if show
			bottom_part  + top_part
		else
			bottom_part + top_part.mirror(z:1).translate(y:@y+1,z:@bottom_height + @top_height)
		end
	end	

	

end
