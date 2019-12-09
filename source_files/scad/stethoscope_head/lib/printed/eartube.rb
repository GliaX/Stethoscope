class EartubePipe < CrystalScad::Pipe
	# inheriting Pipe here to create the design. We want a hexagonal outer diameter for easy printing
	# and a circular inner diameter	
	def initialize(args={})
		super(args) # call initialize from CrystalScad::	
	

		# Inner diameter of the Littmann version is about 3mm, I'm going for a slightly bigger inner diameter
		# here because of possible shrinkage and print imperfections
		@inner_diameter = args[:inner_diameter] || 3.7

		# Outer diameter of the hexagonal outer diameter
		@diameter = args[:outer_diameter] || 6.7 
	end

	# This defines the outside shape of the pipe
	def shape
		@line_rotation = 30 # This is necessary to have hexagonal lines align with the angled ones
		return circle(d:@diameter,fn:6) # hexagonal shape
	end	

	#	This defines the inside shape of the pipe
	def inner_shape
		circle(d:@inner_diameter)
	end

end

class Eartube < CrystalScad::Printed

	# Eartube is the part that goes from a Y to split up the channels from the tubing towards an earpiece 
	# that will be shaped with PCL for now
	def initialize		
		# I have removed the previous parametric parameters in order to make it easier to model	
		# in the show method. Values and details can be changed there
		@color = "LavenderBlush"
	end

	# fast rendering mockup of the part, for upper harness assembly
	def lite_view
		pipe = EartubePipe.new(inner_diameter:0)
		pipe.cw(28,80)
		pipe.line(100)
		return transform(colorize(pipe.pipe))		
	end

	def output
		pipe = EartubePipe.new(inner_diameter:0)
		pipe.line(30)
		return transform(colorize(pipe.pipe))		
	end


	def show
		# Initialize the pipe, we've defined the dimensions above in that class already		
		pipe = EartubePipe.new

		# We start with the piece that goes into the ear
		pipe.line(3) # 3mm line

		# Create a Clockwise angle, which goes into the ear
		pipe.cw(10,20) # radius, angle


		pipe.cw(28,80) # radius, angle
		
		pipe.cw(33,28) 

		pipe.line(40)
		# we need more precision here for the bigger bent radiuses
		pipe.bent_segments = 512
		pipe.cw(250,8)
		pipe.line(40)
		pipe.cw(85,10)
		pipe.line(20)
		

		return transform(colorize(pipe.pipe))
	end

end
