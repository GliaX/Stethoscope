class YPiece < CrystalScad::Printed

	def initialize(args={})
		@x = 50
		@y = 30
		@bottom_width = 20
		@top_width = 20
		@height = 14

		@big_tube_insert_length = 6
	
		@big_tube = BigTube.new(margin:0.1).rotate(z:-90).translate(y:@big_tube_insert_length,z:@height / 2.0)
		@eartube = Eartube.new.rotate(x:-30).rotate(z:90).translate(x:-16.5,y:@y-5,z:@height / 2.0)

	end

	def basic_shape
		points = []
		points << [0,0]
		points << [-@bottom_width / 2.0, 0]
		points << [-@x / 2.0, @y-2] # reduce sharp edge
		points << [-@x / 2.0, @y]
		points << [-@x / 2.0+@top_width, @y]
		points << [0, @y-10]

		res = polygon(points:points)
		res += polygon(points:points).mirror(x:1)		
		
		# create one half part
		res.linear_extrude(h:@height / 2.0) 
	end	

	def eartube_cut
		hull(
			@eartube.output,
			@eartube.output.translate(x:7),
			@eartube.output.rotate(z:20).translate(x:8.5,y:5)
		)
	end

	def part(show)
		res = basic_shape
		# inner cut	
		res -= basic_shape.scale(x:0.8,y:0.75).translate(y:2.5,z:1.5)		
	
		# bottom tube
		res -= @big_tube.output 
		res += @big_tube.show	if show

		res -= eartube_cut
		res -= eartube_cut.mirror(x:1)
	
		res += @eartube.lite_view if show
		
	end

end
