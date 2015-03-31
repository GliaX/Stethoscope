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
 

res = StethoscopeHeadAssembly.new.show
#res = Connector.new.show

res.save("stethoscope_head.scad","$fn=64;")

res = PrintableStethoscopeHead1Assembly.new.show
res.save("printable_head1.scad","$fn=64;")

res = Eartube.new.show
res.save("eartube.scad","$fn=64;")


@@bom.save("bom.txt")

