$fs = 0.5;
$fa = 1;
//$fn = 12;

eartube();

module acir(a, n) {
	rotate([0, 0, 180 / n]) circle(r = a / cos(180 / n), $fn = n);
}

module eartube() {
	seg1r = 250;
	seg1s = 30;
	seg2r = 30;
	seg2s = 80;

	module tube2(rr) {
		translate([10, 0, 0]) rotate([0, 90, 0]) linear_extrude(height = 20.1) acir(rr, 8);
		translate([30, seg1r, 0]) {
			rotate([0, 0, -90]) rotate_extrude(angle = seg1s + 0.1, convexity = 2) translate([seg1r, 0]) acir(rr, 8);
		}
		translate([30 + (seg1r - seg2r) * sin(seg1s), seg1r - (seg1r - seg2r) * cos(seg1s), 0]) {
			rotate([0, 0, -90 + seg1s]) rotate_extrude(angle = seg2s, convexity = 2) translate([seg2r, 0]) acir(rr, 8);
		}
	}

	module mouseear() {
		translate([0, 0,-3.5]) {
			translate([-10, 0, 0]) cylinder(r=5.5,h=0.4);
			translate([-10, -1, 0]) cube([10,2,0.4]);
		}
	}

	difference() {
		union() {
			hull() {
				sphere(d=6);
				translate([10, 0, 0]) rotate([0, 90, 0]) linear_extrude(height = 0.1) acir(3.5, 8);
			}
			tube2(3.5);
		}

		tube2(2);
		translate([-5, 0, 0]) rotate([0, 90, 0]) linear_extrude(height = 20) acir(2, 8);
	}

	translate([30 + (seg1r - seg2r) * sin(seg1s) + seg2r * sin(seg1s + seg2s), seg1r - (seg1r - seg2r) * cos(seg1s) - seg2r * cos(seg1s + seg2s), 0]) {
		// Earbud
		rotate([0, 0, seg1s + seg2s - 180]) difference() {
			union() {
				rotate([0,90,0]) translate([0, 0, -7]) cylinder(d=6.6,h=8);
				hull() {
					translate([-6.5, 0, 0]) scale([0.5, 1, 1]) sphere(d=7);
					translate([-11, 0, 0]) scale([0.6, 1, 1])sphere(d=6.5);
				}
				intersection() {
					translate([0, -4, -3.5]) cube([1, 8, 7.5]);
					rotate([0, 90, 0]) cylinder(h = 1, d = 8);
				}
			}
			rotate([0,-90,0]) translate([0, 0, -1.1]) linear_extrude(height = 15) acir(2, 8);
		}

		// Earbud mouse ear
		color("red") rotate([0, 0, seg1s + seg2s - 180]) translate([0, 0,-3.5]) {
			translate([-20, 0, 0]) cylinder(r=5.5,h=0.4);
			translate([-15, -0.5, 0]) cube([15,2,0.4]);
		}

		// Middle point 3 mouse ear
		color("red") rotate([0, 0, seg1s + seg2s + 90]) mouseear();
	}

	translate([30 + seg1r * sin(seg1s), seg1r - seg1r * cos(seg1s), 0]) {
		// Middle point 1 mouse ear
		color("red") rotate([0, 0, seg1s + 90]) mouseear();
	}

	translate([30 + (seg1r - seg2r) * sin(seg1s) + seg2r * sin(seg1s + seg2s / 2), seg1r - (seg1r - seg2r) * cos(seg1s) - seg2r * cos(seg1s + seg2s / 2), 0]) {
		// Middle point 2 mouse ear
		color("red") rotate([0, 0, seg1s + seg2s / 2 + 90]) mouseear();
	}

	// Tube beginning mouse ear
	color("red") {
		translate([-5,-0.5,-3.5]) cube([15,1,0.5]);
		translate([-8,0,-3.5]) cylinder(r=5.5,h=0.5);
		translate([-2.5,-0.5,-3.5]) cube([3,1,1.5]);
	}

	// Add stop so that people don't push the eartube too far
	translate([35.5,-1,3]) cube([2,2,2]);
}
