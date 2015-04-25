class EarplugMold < CrystalScad::Printed
	
	def initialize

		@bottom_height = 7
		@top_height = 23.2


		@earplug = Earplug.new(cylinder_length:24)


		# The dimensions of each mold are currently hardcoded
		@x = 45
		@y = @x

		# bolt position from the corners
		@bolt_pos = 4

		# Bolt coordinates for holding it together
		@bolt_coords = []
		[-1,1].each do |x|
			[-1,1].each do |y|
					@bolt_coords << {x:x*(@x/2.0-@bolt_pos),y:y*(@y/2.0-@bolt_pos)} 	
			end		
		end

		# offset of individual molds
		@x_offset = 16
		@rotation = 45
		
		@syringe_diameter = 4.4

	end
	
	def view1
		show
		@bottom_part
	end

	def create_molds
		bottom_part = cube([@x,@y,@bottom_height]).center_xy
		top_part = cube([@x,@y,@top_height]).center_xy.translate(z:@bottom_height)

		x_offset = 15
		y_offset = 15
		(360/@rotation).to_i.times do |i|
			bottom_part -= @earplug.output.translate(x:@x_offset,z:2).rotate(z:@rotation*i) #.translate(x:x_offset,y:y_offset,z:2).rotate(z:35)
			# connection channel
			bottom_part -= cylinder(d:2.5,h:@x_offset).rotate(y:90).translate(x:0,z:@bottom_height).rotate(z:@rotation*i)

			bottom_part += @earplug.inner_cut.translate(x:@x_offset,z:0).rotate(z:@rotation*i)
			top_part -= @earplug.output.translate(x:@x_offset,z:2).rotate(z:@rotation*i)
		
		end

		return [bottom_part, top_part]
	end

	def part(show)


		@bottom_part, @top_part = create_molds

		@top_part -= cylinder(d:@syringe_diameter,h:@top_height+0.2).translate(z:@bottom_height-0.1)

		# since the inner_cuts I added to the bottom part are sticking out, I'll cut them by
		# subtracting a box that's as high as the bottom part right below it.
		@bottom_part -= cube([@x,@y,@bottom_height]).translate(z:-@bottom_height)


		# Adding color before adding bolts to output
		if show
			@bottom_part = @bottom_part.color("cyan")
			@top_part = @top_part.color("lightgreen")
		end
		
		# Placing of the Bolts to hold the parts together
		@bolt_coords.each do |coord|
			b = Bolt.new(3,30,additional_diameter:0.5)
			n = Nut.new(3)			
			@bottom_part -= b.output.translate(coord)
			@bottom_part -= n.output.translate(coord)
			@top_part -= b.output.translate(coord).translate(z:@bottom_height)

			if show
				@bottom_part += b.show.translate(coord).mirror(z:1).translate(z:@bottom_height + @top_height) 
				@bottom_part += n.show.translate(coord)
			else
				# The holes above the nut cutouts will need a tiny bit of plastic in order to print nicely
				# FIXME: This support structure will work nicely on 0.2mm layer height, but might 
				# 			 not on others
				@bottom_part += cylinder(d:3.5,h:2.1).translate(coord)
			end	
		end
	
		if show
			@bottom_part  + @top_part
		else
			@bottom_part + @top_part.mirror(z:1).translate(y:@y+1,z:@bottom_height + @top_height)
		end
	end	

	

end
