class StethoscopeHeadAssembly < CrystalScad::Assembly

	def part(show)
		res = StethoscopeHead.new.show # see stethoscope_head.rb under lib/printed/
	end

end
