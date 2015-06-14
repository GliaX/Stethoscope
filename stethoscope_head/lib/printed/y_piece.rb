class YPiece < CrystalScad::Printed

	def initialize(args={})
		@x = 65
		@y = 40
		@bottom_width = 20
		@top_width = 20
		@height = 14

		@big_tube_insert_length = 6
	
		@big_tube = BigTube.new(margin:0.1).rotate(z:-90).translate(y:@big_tube_insert_length,z:@height / 2.0)
		@eartube = Eartube.new.rotate(x:-30).rotate(z:90).translate(x:-20,y:@y-10,z:@height / 2.0)
		
		# we use a 6mm tube, but I'm making the tube bigger, so silicone can move alone the sides of the tube
		@small_tube_cut = 6.5

		# outer diameter of the syringe opening
		@syringe_diameter = 4.4

	end

	def basic_shape
		points = []
		points << [0,0]
		points << [-@bottom_width / 2.0, 0]
		points << [-@x / 2.0, @y-2] # reduce sharp edge
		points << [-@x / 2.0, @y]
		points << [-@x / 2.0+@top_width, @y]
		points << [0, @y]

		res = polygon(points:points)
		res += polygon(points:points).mirror(x:1)		
		
		# create one half part
		res.linear_extrude(h:@height / 2.0) 
	end	

	def eartube_cut
		hull(
			@eartube.output,
			@eartube.output.translate(x:3),
			@eartube.output.rotate(z:20).translate(x:9.5,y:5)
		)
	end

	def small_tube_cut
		cylinder(d:@small_tube_cut,h:35).rotate(x:90).rotate(z:40).translate(x:-20,y:30,z:@height/2.0)
	end

	def half_part
		res = basic_shape

		# bottom tube
		res -= @big_tube.output 
		# make more room on the exit of the big tube
		res -= @big_tube.output.translate(y:10)

		res -= eartube_cut
		res -= eartube_cut.mirror(x:1)

		# cuts for the small tubes
		res -= small_tube_cut
		res -= small_tube_cut.mirror(x:1)

		# syringe cut
		res -= cylinder(d:@syringe_diameter, h:40).rotate(x:90).translate(y:45,z:@height/2.0)		

	end

	def part(show)
		lower = half_part.color("DarkSlateBlue")		
		upper = half_part.mirror(z:1).translate(z:@height).color("powderblue")

		bolt = Bolt.new(3,14).translate(x:-10,y:30)
		nut = Nut.new(3,support:true).translate(x:-10,y:30)

		lower -= nut	
		lower -= bolt.output
		upper -= bolt.output

		bolt = Bolt.new(3,14).translate(x:10,y:30)
		nut = Nut.new(3,support:true).translate(x:10,y:30)

		lower -= nut	
		lower -= bolt.output
		upper -= bolt.output

		if show
			res = lower 
			res += upper
	
			res += @big_tube.show
			res += @eartube.lite_view
		else
			res = lower
			res += upper.mirror(z:1).rotate(z:180).translate(x:45,y:40,z:@height)
		end

		res
	end

end
