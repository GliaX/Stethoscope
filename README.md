Stethoscope
===========

This project aims to create a research-validated stethoscope whose plans are 
available freely and openly. The goal is for the bell to cost ~USD$1-2 to produce, 
and the rest of the stethoscope to cost approximately the same.

Currently, the stethoscope resulting from this project functions as well as the 
market gold standard, the Littmann Cardiology III.


Bill of Materials
=================

**Printed parts:**
* 1 stethoscope head (head.stl)
* 1 stethoscope ring (ring.stl)
* 1 Y-piece (y-piece.stl)
* 2 ear tubes (eartube.stl)
* 1 spring (spring.stl)


**Other hardware:**
Some vendors are suggested. See Bill of materials ODS file for more information.
* 40cm Silicone 12mm outer diameter (OD), 8mm inner diameter (ID): To connect the head to the Y-piece.
 * [8MM I.D X 12MM O.D NGP60 Clear Translucent Silicone Hose Pipe Tubing](http://www.advancedfluidsolutions.co.uk/8mm-id-x-12mm-od-clear-transulcent-silicone-hose-pipe-tubing-2480-p.asp) (USD$6.95)

* 20cm Silicone 8mm OD, 4mm ID: To connect the eartubes to the central Y-piece.
 * NOTE: The printed eartubes are 6mm, so these tubes will initially be difficult to fit to them, but are recommended as they attach more reliably vs. 6mm ID silicone tubes.

* Diaphragm: 40mm diameter cut from a report cover with approx 0.35mm plastic sheet
 * [Staples 21639 report cover (UPC 718103160223)](http://www.staples.ca/en/Staples-Swing-Lock-Report-Cover-Clear-with-Black-Spine-5-Pack/product_780953_2-CA_1_20001) (USD$8.84)
 * You can cut the diaphragm by hand or with a stamp like [this one](https://www.amazon.ca/Karujimu-ki-jumbo-craft-circle-CN45004/dp/B001CBY41W)
	
	* Replacement earbud tips from an audio/electronics store, or make molded silicone ear plugs
 
**Optional hardware**:
* Metal spring for holding ear tubes together
* 1 earplug mold (earplug_mold.stl)
* Silicone for ear plugs
 * [Moldable Silicone Ear Plugs](http://www.earplugstore.com/custom-diy-ear-plugs.html) (≥USD$9.50/pair)
	* [Sugru](https://sugru.com/) (~£4-8/pair)


Print Instructions
==================
**INFILL MUST BE 100%**

All printed parts should be printed with ABS or PLA plastic at 0.2mm layer height, 
though it is acceptable for the first layer to be 0.3mm.

We print the eartubes with a brim of 2mm to ensure that none of the parts lift off.

**INFILL MUST BE 100%.** Otherwise, the stethoscope will not print well.


Assembly Instructions
=====================

* Insert silicone into mold and allow to set as per manufacturer instructions.
* Place the diaphragm (40mm) on the stethoscope head and fasten the printed ring over it.
* Attach the stethoscope head to the 8mm ID silicone tube.
* Attach the other end of the 8mm ID tube to the large end of the Y-piece.
* Attach the earplugs onto the matching grooves on the eartubes.
* Cut the 4mm ID silicone tubing in half.
* Attach the two 4mm ID tubes to the eartubes.
* Thread the two holes of the 3D printed spring through these tubes, and press them onto where the 4mm ID tube and the printed eartube meet.
	* Optionally, test the width of the spring by placing the eartubes, now connected by the spring, into your ears. Remove the spring and use a heat gun to bend the spring as desired.
* Attach the other ends of the two 4mm ID tubes to the smaller ends of the Y-Piece.
* Test the stethoscope as per the validation instructions.


Changing and creating SCAD files
================================

[CrystalSCAD](https://github.com/Joaz/CrystalScad) and [OpenSCAD](http://www.openscad.org/) 
were used to create all STL files. To recreate the stethoscope head, simpley do:

``` shell
gem install crystalscad
ruby source_files/stethoscope_head/stethoscope_head.rb
```
The SCAD files output from CrystalSCAD are found in `source_files/stethoscope_head/output` and are named as follows:
* PrintableStethoscopeHead1Assembly_output.scad - The head
* EarplugMold_output.scad - Earplug mold

Other stethoscopes
==================
Others have made 3D printed stethoscopes too. See:
* https://www.youmagine.com/designs/stethoscope-chestpiece
