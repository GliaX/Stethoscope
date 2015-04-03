class EarplugMold < CrystalScad::Printed
	
	# This is a proof of concept.
	def initialize
		# Set the amount of earplug molds this file produces in a grid here:
		@grid_x = 3
		@grid_y = 2

		

		@bottom_height = 0
		@middle_height = 6
		@top_height = 10-0.1


		# The dimensions of each mold are currently hardcoded
		@x = 5 + @grid_x * 15
		@y = 5 + @grid_y * 15
		@coords = []
		@grid_x.times do |x|
			@grid_y.times do |y|
				@coords << {x:10+x*15, y:10+y*15}				
			end		
		end

	end
	
	def part(show)
		earplug = Earplug.new


		bottom_part = cube([@x,@y,@bottom_height])			
		middle_part = cube([@x,@y,@middle_height]).translate(z:@bottom_height)		
		top_part = cube([@x,@y,@top_height]).translate(z:@bottom_height+@middle_height)

		@coords.each do |coord|
			#bottom_part += earplug.inner_cut.translate(coord)
			middle_part -= earplug.output.translate(coord)		
			top_part -= earplug.output.translate(coord)		
		end

		if !show
			bottom_part.color("red") + middle_part.color("cyan") + top_part.color("silver").color(a:150).translate(z:100)
		else
			bottom_part + top_part.translate(y:@y+1)
		end
	end	

	

end
