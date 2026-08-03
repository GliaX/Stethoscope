$fs = 1;
$fa = 5;
//$fn = 12;

head();

module head() {
	difference() {
		union() {
			rotate_extrude() polygon([[0, 0], [19.5, 0], [21, 1.5], [21, 10.8], [19.5, 10.8], [19.5, 15.2], [17.8, 15.2],
				[17.8, 15.8], [16.7, 15.8], [16.7, 15.2], [4.5, 13.7], [3.5, 12.8], [3.5, 9], [0, 8.99]]);
			rotate_extrude() translate([19.5,1.5]) circle(d=3);
			translate([0,-39,6/2+2]) rotate([-90,0,0]) cylinder(d=6,h=19);
			translate([0,-40,6/2+2]) rotate([-90,0,0]) cylinder(d1=5,d2=6,h=1);
			translate([0,-22,6/2+2]) rotate([-90,0,0]) cylinder(d1=6,d2=9,h=1.5);
			//%translate([0, 0, 16 + k]) cylinder(d = 1.5 * 25.4, h = 0.5);
		}
		translate([0,-4,6/2+2+4]) rotate([0,90,0]) rotate_extrude(angle=90) translate([4,0]) circle(r=3.5);
		translate([0,-42,6/2+2]) rotate([-90,0,0]) cylinder(d=4,h=25);
		translate([0,-19.99,6/2+2]) rotate([-90,0,0]) cylinder(d1=4,r2=3.5,h=16);
	}

	// pipe support
	color("#e0e0e0") {
		translate([-0.5,-40,0]) cube([1,18,1.8]);
		hull() { 
		  translate([0,-40,0]) cylinder(d=12,h=0.5);
		  translate([0,-24,0]) cylinder(d=8,h=0.5);
		}
		for (i=[-40:8:-20]) translate([-0.5,i,0]) cube([1,2,2.2]);
	}

	// many supports
//	for (i=[-1:7]) rotate([0,0,i*30]) { translate([20,-0.6,0]) cube([10,1.2,0.5]); translate([28,0,0]) cylinder(d=12,h=0.5,$fn=36); }

}