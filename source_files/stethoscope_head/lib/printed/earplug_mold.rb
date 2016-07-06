class EarplugMold < CrystalScad::Printed
	
	def initialize
		# height of each half of the mold
		@bottom_height = 7
		@top_height = 23.2
	
		# X & Y dimension of the mold
		@x = 50
		@y = @x 

		# bolt position from the corners
		@bolt_pos = 5

		# offset from the center of individual molds
		@x_offset = 16.5
		# Rotation of each mold from center, will affect number of molds
		@rotation = 45
		
		# outer diameter of the syringe opening
		@syringe_diameter = 4.4

		# printer layer height (needed for support)
		@layer_height = 0.2

		# using the earplug with slightly longer length than default, to make the channel on the top part all the way through
		@earplug = Earplug.new(cylinder_length:24)

		# Placing the bolts in the corner
		@bolt_coords = []
		[-1,1].each do |x|
			[-1,1].each do |y|
					@bolt_coords << {x:x*(@x/2.0-@bolt_pos),y:y*(@y/2.0-@bolt_pos)} 	
			end		
		end
	end
	
	def view1
		show
		@bottom_part
	end

	def create_molds
		bottom_part = cube([@x,@y,@bottom_height]).center_xy
		top_part = cube([@x,@y,@top_height]).center_xy.translate(z:@bottom_height)
		
		# molds in a circular pattern
		(360/@rotation).to_i.times do |i|
			# earplug cut
			bottom_part -= @earplug.output.translate(x:@x_offset,z:2).rotate(z:@rotation*i)
			# connection channel
			bottom_part -= cylinder(d:2.5,h:@x_offset).rotate(y:90).translate(x:0,z:@bottom_height).rotate(z:@rotation*i)
			# inner part of the earplug
			bottom_part += @earplug.inner_cut.translate(x:@x_offset,z:0).rotate(z:@rotation*i)
			
			# top part getting cut out as well
			top_part -= @earplug.output.translate(x:@x_offset,z:2).rotate(z:@rotation*i)
		
		end

		return [bottom_part, top_part]
	end

	def part(show)
		@bottom_part, @top_part = create_molds

		# syringe opening for pushing the silicone in
		@top_part -= cylinder(d:@syringe_diameter,h:@top_height+0.2).translate(z:@bottom_height-0.1)

		# Adding color before adding bolts to output
		if show
			@bottom_part = @bottom_part.color("cyan")
			@top_part = @top_part.color("lightgreen")
		end
		
		# Placing of the bolts and nuts to hold the parts together
		@bolt_coords.each do |coord|
			b = Bolt.new(3,30,additional_diameter:0.5)
			n = Nut.new(3)			
			@bottom_part -= b.output.translate(coord)
			@bottom_part -= n.output.translate(coord)
			@top_part -= b.output.translate(coord).translate(z:@bottom_height)

			if show
				# show bolts and nuts on show
				@bottom_part += b.show.translate(coord).mirror(z:1).translate(z:@bottom_height + @top_height) 
				@bottom_part += n.show.translate(coord)
			else
				# on output, add a support structure to the nut
				@bottom_part += n.add_support(@layer_height).translate(coord)
			end	
		end

		# plate placment	
		if show
			@bottom_part  + @top_part
		else
			@bottom_part + @top_part.mirror(z:1).translate(y:@y+1,z:@bottom_height + @top_height)
		end
	end	

end
