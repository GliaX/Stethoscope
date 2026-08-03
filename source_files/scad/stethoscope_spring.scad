$fs = 1;
$fa = 5;

spring_radius = 20; // Radius of spring

spring(22.5, 3.7);

module acyl(a, h, n) {
	rotate([0, 0, 180 / n]) cylinder(r = a / cos(180 / n), h = h, $fn = n);
}

module outerSpring() {
	difference(){
		cylinder(r=spring_radius+1,h=10,$fn=60); //outer diameter
		translate([0,0,-0.1]) cylinder(r=spring_radius-2,h=10+0.2,$fn=60); //inner diameter
		translate([-45,0,-0.1])cube([90,45,10+0.2]); //cut centre
	}
}

module hole(ang, holesize) {
	radius = 7;
	difference() {
		hull(){
			translate([-radius - 2,-radius,0]) cube([2,10,20]);
			translate([-radius,-radius,0]) cube([10,2,12]);
			translate([0,0,0]) {
				cylinder(r=radius,h=12,$fn=60);
				translate([0,0,12]) rotate_extrude($fn=60) translate([radius-2,0]) circle(r=2);
			}
		}
		translate([0,0,-0.1]) rotate([0,0,-ang]) acyl(holesize, 20, 8);
	}
}

module spring(eartube_rotation, holesize) {
	outerSpring();
	for (i=[0:1]) mirror([i, 0, 0]) {
		translate([spring_radius + 12.5,30,7]) rotate([90,0,-10]) hole(eartube_rotation, holesize);
		translate([spring_radius - 2,-0.5,0]) rotate([0,0,-10]) cube([3,20,10]);
	}
}
