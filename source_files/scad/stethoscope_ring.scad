$fs = 0.5;
$fa = 1;
//$fn = 12;

ring();

module ring() {
	difference() {
		rotate_extrude() hull() {
			translate([20.5, 1.5]) circle(d = 3);
			square([21, 6]);
		}
		translate([0,0,-1]) cylinder(r=17.5,h=10); // inner hole
		translate([0,0,0.5]) cylinder(r=19.5,h=10); // head flange
	}
}
