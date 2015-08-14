class UpperHarnessAssembly < CrystalScad::Assembly

	skip :output

	def show
		big_tube = BigTube.new
		eartube = Eartube.new.rotate(x:-30)
		eartube2 = Eartube.new.mirror(y:1).rotate(x:30).translate(y:-50)

#		res = big_tube.show
		res = eartube.lite_view
		res+= eartube2.lite_view
	
	end

end
