#!/usr/bin/ruby1.9.3
require "rubygems"
require "crystalscad"
require "require_all"
include CrystalScad

require_all "lib/**/*.rb"

# To run this project and refresh any changes to the code, run the following command
# in a terminal (make sure you are in the same directory as this file): 
#  observr stethoscope_head.observr
#
# This will generate stethoscope_head.scad which you can open in OpenSCAD.
# In OpenSCAD make sure that you have the menu item
# Design -> Automatic Reload and Compile 
# activated. 
 

tools = [StethoscopeHeadAssembly,PrintableStethoscopeHead1Assembly,Eartube,EarplugMold]
# if we have a command line parameter
if ARGV[0]
	tools = get_classes_from_file(ARGV[0])
end
tools.each{|tool| save_all(tool)}


@@bom.save("bom.txt")

