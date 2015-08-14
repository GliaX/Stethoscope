class YPiece < CrystalScad::Printed

	def initialize(args={})
		@x = 40
		@y = 40
		@bottom_width = 20
		@top_width = 20
		@height = 17

		@big_tube_insert_length = 6
	
		@big_tube = BigTube.new(margin:0.1).rotate(z:-90).translate(y:@big_tube_insert_length,z:@height / 2.0)
		@eartube = Eartube.new.rotate(x:-30).rotate(z:90).translate(x:-20,y:@y-10,z:@height / 2.0)
		
		# we use a 6mm tube, but I'm making the tube bigger, so silicone can move alone the sides of the tube
		@small_tube_cut = 6.5

		# outer diameter of the syringe opening
		@syringe_diameter = 4.4
		@conn = Connector.new(tube_additional_inner_diameter:0.3,
														   base_length:1,	
															 base_diameter: 6.5,
															 connector_type: 1,
															 connector_outside_diameter:6.5,
															 connector_inner_diameter:4,
															 connector_exit_diameter:4.5
				).rotate(x:90).translate(y:0)

		

		@eartube_options = {base_diameter:4.7,
												base_length:1,
												connector_length:10,
												connector_inner_diameter:2.5,
												connector_outside_diameter:4.7,	
												connector_exit_diameter: 3,
												connector_type: 1
												}
		@eartube_conn = Connector.new(@eartube_options).rotate(x:-90).rotate(z:-15).translate(x:14,y:38,z:-(@conn.connector_outside_diameter-@eartube_options[:connector_outside_diameter])/2.0)
		@eartube_conn2 = Connector.new(@eartube_options).rotate(x:-90).rotate(z:-15).translate(x:14,y:38,z:-(@conn.connector_outside_diameter-@eartube_options[:connector_outside_diameter])/2.0).mirror(x:1)
	
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

	def inner_cut
		res = cylinder(d:5.5,h:5).rotate(x:90).translate(y:5)
		p = Pipe.new(diameter:2.5)
		p.line(40)
		p.cw(10,20.9)
	
		res += p.pipe.rotate(z:90).translate(z:-0.9)
	
	end

	def part(show)

		res = basic_shape.translate(z:-@conn.connector_outside_diameter/2.0)
		res += @conn.show
		res -= inner_cut
		res -= inner_cut.mirror(x:1)
		
		res += @eartube_conn.show
	 	res += @eartube_conn2.show

		res
	end

end
