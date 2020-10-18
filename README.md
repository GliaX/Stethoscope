Stethoscope
===========

This project aims to create a research-validated stethoscope whose plans are 
available freely and openly. The goal is for the bell to cost ~USD$1-2 to produce, 
and the rest of the stethoscope to cost approximately the same. You can see the peer-reviewed publication relating to this stethoscope's validation here:

http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0193087

Currently, the stethoscope resulting from this project functions as well as the 
market gold standard, the Littmann Cardiology III.


Bill of Materials
=================

**Printed parts:**
* 1 stethoscope head (head.stl)
* 2 ear tubes (eartube.stl)
* 1 Y-piece (y_piece.stl)
* 1 Spring (spring.stl)
* 1 Ring (ring.stl)

**Other hardware:**
Some vendors are suggested.
* 40cm - 50cm Silicone 13mm (preferred) or 12mm OD, 8mm ID, 50 durometer
  * [8MM I.D X 13MM O.D NGP60 Clear Translucent Silicone Hose Pipe Tubing](https://www.advancedfluidsolutions.co.uk/8mm-id-x-13mm-od-clear-transulcent-silicone-hose-pipe-tubing-2482-p.asp) (USD$7.34/meter)

* 20cm Silicone 8mm (preferred) or 6mm OD, 4mm ID (cut into 10cm pieces), 60 durometer
  * [4mm ID x 8mm OD](https://www.advancedfluidsolutions.co.uk/4mm-id-x-8mm-od-clear-transulcent-silicone-hose-pipe-tubing-2454-p.asp)

* Diaphragm: 40mm diameter cut from a report cover with approx 0.35mm plastic sheet
  * [Staples 21639 report cover (UPC 718103160223)](https://www.staples.ca/products/780953-en-staples-swing-lock-report-cover-clear-with-black-spine-5pack) (USD$8.84)
  * You can cut the diaphragm by hand or with a stamp like [this one](https://www.amazon.ca/Karujimu-ki-jumbo-craft-circle-CN45004/dp/B001CBY41W)

* Earbuds / Eartips: Any large-sized standard earbuds will do.
  * [Silicone Earbuds 7 Pairs - Large size](https://www.amazon.ca/gp/product/B006VELFJY)
 
**Optional hardware**:
* Metal spring for holding ear tubes together


Print Instructions
==================
**INFILL MUST BE 100%** **INFILL MUST BE 100%** **INFILL MUST BE 100%** **INFILL MUST BE 100%**

* Use PETG or ABS
* Layer height: 0.2mm
* Use PrusaSlicer 2.0 or above to import 3MF file
* Modify filament and printer settings as needed.
* **DO NOT MODIFY PRINT SETTINGS**
* Export and print


Troubleshooting
===============

* If the spring and eartubes do not fit well, go ahead and scale the spring as needed
* If the head and ring do not fit well, use caution as you may be modifying the acoustics. You can scale the head a little.


Notes
=====

* We do not use PLA due to deformation in heat and poor plastic quality in the spring causing early failure. PLA may be used, but the lifetime of the stethoscope will decrease significantly.

* We do not use brims, but you may print the eartubes and Y-pieces with a brim of 2mm to ensure that none of the parts lift off.

**INFILL MUST BE 100%** **INFILL MUST BE 100%** **INFILL MUST BE 100%.** Otherwise, the stethoscope will not produce a correct sound.


Assembly Instructions
=====================

See [this instructional video](https://www.youtube.com/watch?v=u-KNTc0POLA) for assembly instructions.

* Attach the diaphragm (40mm) to the stethoscope head.
* Attach the stethoscope head to the silicone tube.
* Attach the silicone tube to the Y-Piece.
* Attach spring to ear tubes.
* Attach the Y-piece to the ear tubes.
* Attach the ear tubes to the eartips / earbuds.
* Test the stethoscope as per the [validation instructions](https://github.com/GliaX/Stethoscope/blob/master/testing/Stethoscope_Validation.md).


Printing the inserts
====================
The inserts are included in the `manual` directory. Using 8.5 x 11 (Legal) paper,
they can be printed at 8.25" page width with 95% scale for the top print and 
90% scale for the bottom print using GIMP.

The top insert is cut at 14.5cm and again at 1cm creating two labels of 13.5cm height.
These inserts are printed on adhesive material.

The bottom insert is cut at a width of 20cm with a height cuts at 25cm, 15cm, 
13.5cm and 3.5cm creating 10cm x 20cm inserts.


Changing and creating SCAD files
================================

[CrystalSCAD](https://github.com/Joaz/CrystalScad) and [OpenSCAD](http://www.openscad.org/) 
were used to create all STL files. To recreate the stethoscope head, simply do:

``` shell
gem install crystalscad
ruby source_files/stethoscope_head/stethoscope_head.rb
```

The SCAD files output from CrystalSCAD are found in `source_files/stethoscope_head/output` and are named as follows:
* PrintableStethoscopeHead1Assembly_output.scad - The head


Mass Manufacturing
==================
We generally print 4 stethoscopes per plate to ensure that each stethoscope is created out of the same material.

Our serial numbering system consists of two parts. The last number part is the total number of unique stethoscopes created since day 1. All numbers before that dash are spool identifiers involved in that stethoscope. For example:

001-010 would be the tenth stethoscope made with the first spool in our inventory. If the first spool makes a total of 15 stethoscopes, then the first stethoscope of the second spool would be 002-016. If the twentieth stethoscope uses plastic from spool 002 and spool 003, it would be 002-003-020.


Other stethoscopes
==================
Others have made 3D printed stethoscopes too. See:
* https://www.youmagine.com/designs/stethoscope-chestpiece


Licensing notes
===============
As per our understanding, hardware is not covered by copyright. However, we present
our work under the TAPR OHL license insofar as it applies.
