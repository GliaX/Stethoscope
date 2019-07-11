class StethoscopeHeadAssembly < CrystalScad::Assembly

	skip :output

	def part(show)
		res = StethoscopeHead.new.show # see stethoscope_head.rb under lib/printed/
	end

end
